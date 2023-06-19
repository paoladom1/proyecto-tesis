<?php

namespace App\Http\Controllers;

use App\Models\Cargo;
use App\Models\Carrera;
use App\Models\ConfiguracionSistema;
use App\Models\DirectorCarrera;
use App\Models\Estudiante;
use App\Models\GrupoTrabajo;
use App\Models\TipoEmpleado;
use App\Models\TipoUsuario;
use App\Models\Usuario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

use App\Models\DepartamentoU;
use App\Models\Empleado;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class NewAdminController extends Controller
{
    private const CARRERA_DIRECTOR_ID = 3;

    public function menuAdmin()
    {
        return view('plantillas.plantillaMenuAdmin');
    }

    // Se muestra vista para anadir usuarios (Dashboard ADMIN)

    function mostrarUsuario(Request $request)
    {
        $tipos_usuario = TipoUsuario::all();

        $usuarios = Usuario::where([
            ['email', '!=', Null],
            [
                function ($query) use ($request) {

                    if (($s = $request->s)) {
                        $query
                            ->orWhere('email', 'LIKE', '%' . $s . '%')
                            ->get();
                    }


                }
            ]
        ])->paginate(10);

        return view('admin.adminDashboard', compact('tipos_usuario', 'usuarios'));
    }

    // Función para registrar Usuarios.
    public function registrarUsuario(Request $request)
    {
        $validations = [
            'email' => 'required|email|unique:usuario',
            'password' => 'required|min:4',
            'tipo_usuario_id' => 'required',
            'fecha_limite' => 'required'
        ];

        $validator = Validator::make($request->all(), $validations);

        if ($validator->fails()) {
            Log::info($validator->errors());
            return response()->json([
                'errors' => $validator->errors()
            ]);
        }

        $validatedData = $request->validate($validations);
        $validatedData['password'] = bcrypt($validatedData['password']);

        // Crea el usuario
        $user = Usuario::create($validatedData);

        if ($user) {
            Session::flash('success', 'Usuario registrado correctamente');
            return response()->json(['success' => true]);
        } else {
            return response()->json(['error' => 'Ha ocurrido un error creando el usuario']);
        }
    }

    public function editarUsuario(Usuario $usuario)
    {
        $tipos_usuario = TipoUsuario::all();

        return view('admin.userInfoForm', compact('usuario', 'tipos_usuario'));
    }

    public function actualizarUsuario(Request $request, Usuario $usuario)
    {
        $user = Usuario::find($usuario, ['email', 'tipo_usuario_id', 'estado']);

        $validatedData = $request->validate([
            'email' => [
                'required',
                'email',
                Rule::unique('usuario', 'email')->ignore($usuario)
            ],
            'tipo_usuario_id' => 'required',
            'fecha_limite' => 'required'
        ]);

        if (!$validatedData) {
            return redirect()->route('users')->with('error', 'Ha ocurrido un error!');
        }

        if ($user->toArray()[0] == $validatedData) {
            return redirect()->route('users')->with('warning', 'No se realizó ningún cambio');
        }

        $usuario->update($validatedData);

        //$this->mostrarUsuario($request);
        return redirect()->route('users')->with('success', "Usuario actualizado correctamente");
    }

    public function eliminarUsuario(Usuario $usuario)
    {
        $usuario->delete();



        return redirect()->route('users')->with('success', "Usuario eliminado correctamente");
    }

    function frmUserView()
    {
        return view('admin.userInfoForm');
    }

    // Función para mostrar lista de empleados
    function mostrarEmpleados(Request $request)
    {
        $tipos_empleado = TipoEmpleado::all();
        $cargos = Cargo::all();
        $departamentos_u = DepartamentoU::all();
        $directores = DirectorCarrera::all();

        $carreras = Carrera::all();
        $carrerasDeshabilitadas = Carrera::whereIn('id', $directores->pluck('carrera_id'))->get()->pluck('id');

        $empleados = Empleado::where([
            ['nombre', '!=', Null],
            [
                function ($query) use ($request) {
                    if (($s = $request->s)) {
                        $query
                            ->orWhere('nombre', 'LIKE', '%' . $s . '%')
                            ->orWhere('codigo_empleado', 'LIKE', '%' . $s . '%')
                            ->orWhere('apellido', 'LIKE', '%' . $s . '%')
                            ->get();
                    }
                }
            ]
        ])->paginate(10);

        return view('admin.employeeInfo', compact('cargos', 'departamentos_u', 'empleados', 'carreras', 'carrerasDeshabilitadas'));
    }

    // Función para registrar Empleado.
    public function registrarEmpleado(Request $request)
    {
        $validations = [
            'codigo_empleado' => 'required|unique:empleado',
            'nombre' => 'required',
            'apellido' => 'required',
            'cargo_id' => 'required',
            'departamento_unidad_id' => 'required',
            'email_usuario' => 'nullable|required_if:cargo_id,3|email',
            'carrera_id' => 'required_if:cargo_id,3|unique:director_carrera',
            'tipo_empleado_id',
        ];

        $tipo_empleado_id = '';

        if ($request->input('cargo_id' == 4)) {
            $tipo_empleado_id = 1;
        } else {
            $tipo_empleado_id = 2;
        }

        $validator = Validator::make($request->all(), $validations);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()
            ]);
        }

        $employeeData = $request->only(['codigo_empleado', 'nombre', 'apellido', 'cargo_id', 'departamento_unidad_id']);
        $employeeData['tipo_empleado_id'] = $tipo_empleado_id;

        // si es director, verificar que exista un usuario con correo
        if ($request->input('cargo_id') == self::CARRERA_DIRECTOR_ID) {
            if (sizeof(Usuario::where('email', $request->input('email_usuario'))->get()) == 0) {
                return response()->json([
                    'errors' => [
                        'email_usuario' => ['El correo ingresado debe pertenecer a un usuario registardo']
                    ]
                ]);
            }
        }

        // Crea el empleado
        $employee = Empleado::create($employeeData);
        $director = true;

        // creando director de carrera si aplica
        if ($request->input('cargo_id') == self::CARRERA_DIRECTOR_ID) {
            $director = DirectorCarrera::create([
                'usuario_id' => Usuario::where('email', $request->input('email_usuario'))->firstOrFail()->id,
                'carrera_id' => $request->input('carrera_id'),
                'empleado_id' => $employee->id,
            ]);
        }

        if ($employee && $director) {
            Session::flash('success', 'Empleado registrado correctamente');
            return response()->json(['success' => true]);
        } else {
            return response()->json(['error' => 'Ha ocurrido un error creando el empleado']);
        }
    }

    public function editarEmpleado(Empleado $empleado)
    {
        $directores = DirectorCarrera::where('empleado_id', '!=', $empleado->id)->get();
        $carreras = Carrera::all();
        $carrerasDeshabilitadas = Carrera::whereIn('id', $directores->pluck('carrera_id'))->get()->pluck('id');

        $director = DirectorCarrera::where('empleado_id', $empleado->id)->first();
        $email_usuario = $director ? Usuario::where('id', $director->usuario_id)->first()->email : '';

        $cargos = Cargo::all();
        $departamentos_u = DepartamentoU::all();

        return view(
            'admin.employeeInfoForm',
            compact(
                'empleado',
                'cargos',
                'departamentos_u',
                'carreras',
                'carrerasDeshabilitadas',
                'director',
                'email_usuario'
            )
        );
    }

    public function actualizarEmpleado(Request $request, Empleado $empleado)
    {
        $request->validate([
            'codigo_empleado' => [
                'required',
                Rule::unique('empleado', 'codigo_empleado')->ignore($empleado)
            ],
            'nombre' => 'required',
            'apellido' => 'required',
            'cargo_id' => 'required',
            'departamento_unidad_id' => 'required',
            'carrera_id' => 'required_if:cargo_id,3',
            'email_usuario' => 'required_if:cargo_id,3|email',
        ]);

        $empleadoData = $request->validate([
            'codigo_empleado' => [
                'required',
                Rule::unique('empleado', 'codigo_empleado')->ignore($empleado)
            ],
            'nombre' => 'required',
            'apellido' => 'required',
            'cargo_id' => 'required',
            'departamento_unidad_id' => 'required',
        ]);

        if (!$empleadoData) {
            Session::flash('error', $empleadoData);
            return redirect()->route('employees')->with('error', 'Ha ocurrido un error!');
        }

        if ($empleado->cargo_id == self::CARRERA_DIRECTOR_ID && $request->input('cargo_id') != self::CARRERA_DIRECTOR_ID) {
            DirectorCarrera::where('empleado_id', $empleado->id)->delete();
        }

        // si es director, verificar que exista un usuario con correo
        if ($request->input('cargo_id') == self::CARRERA_DIRECTOR_ID) {
            if (sizeof(Usuario::where('email', $request->input('email_usuario'))->get()) == 0) {
                return redirect()->route('edit_employee', ['empleado' => $empleado->id])->with(
                    'error',
                    'El correo ingresado debe pertenecer a un usuario registrado'
                );
            }
        }
        $empleado->update($empleadoData);

        if ($request->input('cargo_id') == self::CARRERA_DIRECTOR_ID) {
            DirectorCarrera::updateOrCreate([
                'usuario_id' => Usuario::where('email', $request->input('email_usuario'))->firstOrFail()->id,
                'carrera_id' => (int) $request->input('carrera_id'),
                'empleado_id' => $empleado->id
            ]);
        }

        return redirect()->route('employees')->with('success', "Empleado actualizado correctamente");
    }

    public function eliminarEmpleado(Empleado $empleado)
    {
        $empleado->delete();



        return redirect()->route('employees')->with('success', "Empleado eliminado correctamente");
    }

    //Estudiantes

    function mostrarEstudiante(Request $request)
    {
        $carreras = Carrera::all();

        $grupos_trabajo = GrupoTrabajo::all();

        $estudiantes = Estudiante::where([
            ['carnet', '!=', Null],
            [
                function ($query) use ($request) {
                    if (($s = $request->s)) {
                        $query
                            ->orWhere('nombre', 'LIKE', '%' . $s . '%')
                            ->orWhere('apellido', 'LIKE', '%' . $s . '%')
                            ->orWhere('carnet', 'LIKE', '%' . $s . '%')
                            ->get();
                    }
                }
            ]
        ])->paginate(10);

        return view('admin.studentDashboard', compact('carreras', 'grupos_trabajo', 'estudiantes'));
    }

    function editarEstudiante(Estudiante $estudiante)
    {
        $carreras = Carrera::all();

        $carrera = $estudiante->carrera_id;
        $grupo_trabajo = GrupoTrabajo::join('estudiante', 'grupo_trabajo_id', '=', 'grupo_trabajo.id')->
            selectRaw('grupo_trabajo.id as id, anio_inicio, ciclo_inicio, tema, prorroga, asesor_interno_id, lector_interno_id, asesor_externo_id, lector_externo_id')
            ->where("carrera_id", "=", $carrera)->
            groupBy("id");
        $grupos_trabajo = GrupoTrabajo::all();
        $configuraciones = ConfiguracionSistema::first();

        return view('admin.editStudent', compact('estudiante', 'carreras', 'grupos_trabajo', 'configuraciones'));
    }

    public function actualizarEstudiante(Request $request, Estudiante $estudiante)
    {
        $student = Estudiante::find($estudiante, ['nombre', 'apellido', 'carnet', 'carrera_id', 'grupo_trabajo_id'])->first();

        $validatedData = $request->validate([
            'nombre' => 'required',
            'apellido' => 'required',
            'carnet' => [
                'required',
                Rule::unique('estudiante', 'carnet')->ignore($estudiante)
            ],
            'carrera_id' => 'required',
            'grupo_trabajo_id' => 'required',
            'usuario_id',
        ]);

        if (!$validatedData) {
            return redirect()->route('students')->with('error', 'Ha ocurrido un error!');
        }

        if ($student == $validatedData) {
            return redirect()->route('students')->with('warning', 'No se realizó ningún cambio');
        }

        $handle = '@uca.edu.sv';

        $user = Usuario::where('email', '=', strval($validatedData['carnet'] . $handle))->first();

        $validatedData['usuario_id'] = $user->id;

        $estudiante->update($validatedData);
        //$this->mostrarEstudiante($request);

        return redirect()->route('students')->with('success', "Estudiante actualizado correctamente");
    }

    public function registrarEstudiante(Request $request)
    {
        $validations = [
            'nombre' => 'required',
            'apellido' => 'required',
            'carnet' => 'required|unique:estudiante',
            'carrera_id' => 'required',
            'usuario_id',
        ];

        $validator = Validator::make($request->all(), $validations);

        if ($validator->fails()) {
            Log::info($validator->errors());
            return response()->json([
                'errors' => $validator->errors()
            ]);
        }

        $validatedData = $request->validate($validations);

        $handle = '@uca.edu.sv';

        $user = Usuario::where('email', '=', strval($validatedData['carnet'] . $handle))->first();

        if ($user) {
            $validatedData['usuario_id'] = $user->id;

            // Crea el empleado
            $student = Estudiante::create($validatedData);

            if ($student) {
                Session::flash('success', 'Estudiante registrado correctamente');
                return response()->json(['success' => true]);
            }
        } else {
            Session::flash('error', 'Ha ocurrido un error creando el estudiante');
            return response()->json(['error' => 'Ha ocurrido un error creando el estudiante']);
        }
    }

    public function eliminarEstudiante(Estudiante $estudiante)
    {
        $estudiante->delete();



        return redirect()->route('students')->with('success', "Estudiante eliminado correctamente");
        ;
    }

    //Director de carrera
    function mostrarDirectores()
    {
        $carreras = Carrera::all();

        $empleados = Empleado::all();

        $usuarios = Usuario::all();

        $directores_carrera = DirectorCarrera::paginate(10);

        return view('admin.directorDashboard', compact('carreras', 'empleados', 'usuarios', 'directores_carrera'));
    }

    public function eliminarDirector(DirectorCarrera $director)
    {
        $director->delete();

        //$this->mostrarDirectores();

        return redirect()->route('directores')->with('success', "Director de Carrera eliminado correctamente");
    }
}
