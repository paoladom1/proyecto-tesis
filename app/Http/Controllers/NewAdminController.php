<?php

namespace App\Http\Controllers;

use App\Models\Cargo;
use App\Models\TipoEmpleado;
use App\Models\TipoUsuario;
use App\Models\Usuario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

use App\Models\DepartamentoU;
use App\Models\Empleado;

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
}
