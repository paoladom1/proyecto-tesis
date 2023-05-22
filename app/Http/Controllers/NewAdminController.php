<?php

namespace App\Http\Controllers;

use App\Models\Cargo;
use App\Models\TipoEmpleado;
use App\Models\TipoUsuario;
use App\Models\Usuario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use PhpOffice\PhpWord\Style\Language;
use PhpOffice\PhpWord\Style\TOC;
use PhpOffice\PhpWord\TemplateProcessor;

use App\Models\Externo;
use App\Models\ConfiguracionSistema;
use App\Models\GrupoTrabajo;
use App\Models\Estudiante;
use App\Models\Facultad;
use App\Models\DepartamentoU;
use App\Models\Empleado;
use App\Models\DirectorCarrera;
use App\Models\Carrera;

class NewAdminController extends Controller
{

    // Se muestra vista para anadir usuarios (Dashboard ADMIN)

    function mostrarUsuario()
    {
        $tipos_usuario = TipoUsuario::all();

        $usuarios = Usuario::all();

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

        Log::info($validatedData);
        // Crea el usuario
        Usuario::create($validatedData);

        return $this->mostrarUsuario();
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

        $empleados = Empleado::all();


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

        return $this->mostrarEmpleados();
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
        Log::info($request);
        $validatedData = $request->validate([
            'codigo_empleado' => 'required',
            'nombre' => 'required',
            'apellido' => 'required',
            'tipo_empleado_id' => 'required',
            'cargo_id' => 'required',
            'departamento_unidad_id' => 'required' . $empleado->id,
        ]);

        $empleado->update($validatedData);

        return $this->mostrarEmpleados();
    }

    public function eliminarEmpleado(Empleado $empleado)
    {
        $empleado->delete();

        return $this->mostrarEmpleados();
    }
}
