<?php

namespace App\Http\Controllers;

use App\Models\Cargo;
use App\Models\Carrera;
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
use Illuminate\Support\Str;

class NewAdminController extends Controller
{

    // Se muestra vista para anadir usuarios (Dashboard ADMIN)

    function mostrarUsuario()
    {
        $tipos_usuario = TipoUsuario::all();

        $usuarios = Usuario::paginate(10);

        return view('admin.adminDashboard', compact('tipos_usuario', 'usuarios'));
    }

    // Función para registrar Usuarios.
    public function registrarUsuario(Request $request)
    {
        $validatedData = $request->validate([
            'email' => 'required',
            'password' => 'required|min:4',
            'tipo_usuario_id' => 'required',
            'estado' => 'required',
        ]);

        $validatedData['password'] = bcrypt($validatedData['password']);

        // Crea el usuario
        Usuario::create($validatedData);

        $this->mostrarUsuario();

        return redirect()->route('users');
    }

    public function editarUsuario(Usuario $usuario)
    {
        $tipos_usuario = TipoUsuario::all();

        return view('admin.userInfoForm', compact('usuario', 'tipos_usuario'));
    }

    public function actualizarUsuario(Request $request, Usuario $usuario)
    {
        $validatedData = $request->validate([
            'email' => 'required',
            'tipo_usuario_id' => 'required',
            'estado' => 'required',
        ]);

        $usuario->update($validatedData);

        $this->mostrarUsuario();

        return redirect()->route('users');
    }

    public function eliminarUsuario(Usuario $usuario)
    {
        $usuario->delete();

        $this->mostrarUsuario();

        return redirect()->route('users');
    }

    function frmUserView()
    {
        return view('admin.userInfoForm');
    }

    function mostrarConfig()
    {
        return view('admin.configAdmin');
    }

    // Función para mostrar lista de empleados
    function mostrarEmpleados()
    {
        $tipos_empleado = TipoEmpleado::all();
        $cargos = Cargo::all();
        $departamentos_u = DepartamentoU::all();

        $empleados = Empleado::paginate(10);


        return view('admin.employeeInfo', compact('tipos_empleado', 'cargos', 'departamentos_u', 'empleados'));
    }

    // Función para registrar Empleado.
    public function registrarEmpleado(Request $request)
    {
        $validatedData = $request->validate([
            'codigo_empleado' => 'required',
            'nombre' => 'required',
            'apellido' => 'required',
            'tipo_empleado_id' => 'required',
            'cargo_id' => 'required',
            'departamento_unidad_id' => 'required',
        ]);

        // Crea el empleado
        Empleado::create($validatedData);

        $this->mostrarEmpleados();

        return redirect()->route('employees');
    }

    public function editarEmpleado(Empleado $empleado)
    {
        $tipos_empleado = TipoEmpleado::all();
        $cargos = Cargo::all();
        $departamentos_u = DepartamentoU::all();

        return view('admin.employeeInfoForm', compact('empleado', 'tipos_empleado', 'cargos', 'departamentos_u'));
    }

    public function actualizarEmpleado(Request $request, Empleado $empleado)
    {
        $validatedData = $request->validate([
            'codigo_empleado' => 'required',
            'nombre' => 'required',
            'apellido' => 'required',
            'tipo_empleado_id' => 'required',
            'cargo_id' => 'required',
            'departamento_unidad_id' => 'required',
        ]);

        $empleado->update($validatedData);

        $this->mostrarEmpleados();

        return redirect()->route('employees');
    }

    public function eliminarEmpleado(Empleado $empleado)
    {
        $empleado->delete();

        $this->mostrarEmpleados();

        return redirect()->route('employees');
    }

    //Estudiantes

    function mostrarEstudiante()
    {
        $carreras = Carrera::all();

        $grupos_trabajo = GrupoTrabajo::all();

        $estudiantes = Estudiante::paginate(10);

        return view('admin.studentDashboard', compact('carreras', 'grupos_trabajo', 'estudiantes'));
    }

    function editarEstudiante(Estudiante $estudiante)
    {
        $carreras = Carrera::all();

        $grupos_trabajo = GrupoTrabajo::all();

        return view('admin.editStudent', compact('estudiante', 'carreras', 'grupos_trabajo'));
    }

    public function actualizarEstudiante(Request $request, Estudiante $estudiante)
    {
        $validatedData = $request->validate([
            'nombre' => 'required',
            'apellido' => 'required',
            'carnet' => 'required',
            'carrera_id' => 'required',
            'grupo_trabajo_id' => 'required',
        ]);

        $estudiante->update($validatedData);

        $this->mostrarEstudiante();

        return redirect()->route('students');
    }

    public function registrarEstudiante(Request $request)
    {
        $validatedData = $request->validate([
            'nombre' => 'required',
            'apellido' => 'required',
            'carnet' => 'required',
            'carrera_id' => 'required',
            'grupo_trabajo_id' => 'required',
            'usuario_id',
        ]);

        $handle = '@uca.edu.sv';

        $user = Usuario::where('email', '=', strval($validatedData['carnet'] . $handle))->first();

        $validatedData['usuario_id'] = $user->id;

        // Crea el empleado
        Estudiante::create($validatedData);

        $this->mostrarEstudiante();

        return redirect()->route('students');
    }

    public function eliminarEstudiante(Estudiante $estudiante)
    {
        $estudiante->delete();

        $this->mostrarEstudiante();

        return redirect()->route('students');
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

    function editarDirector(DirectorCarrera $director)
    {
        $carreras = Carrera::all();

        $empleados = Empleado::all();

        return view('admin.editDirector', compact('carreras', 'empleados', 'director'));
    }

    public function eliminarDirector(DirectorCarrera $director)
    {
        $director->delete();

        $this->mostrarDirectores();

        return redirect()->route('directores');
    }

    public function registrarDirector(Request $request)
    {
        $validatedData = $request->validate([
            'usuario_id' => 'required',
            'empleado_id' => 'required',
            'carrera_id' => 'required',
        ]);

        // Crea el empleado
        DirectorCarrera::create($validatedData);

        $this->mostrarDirectores();

        return redirect()->route('directores');
    }
}
