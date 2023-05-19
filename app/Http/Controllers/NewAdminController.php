<?php

namespace App\Http\Controllers;

use App\Models\Cargo;
use App\Models\TipoEmpleado;
use Illuminate\Http\Request;
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
        return view('admin.adminDashboard');
    }

    function frmUserView()
    {
        return view('admin.userInfoForm');
    }

    function mostrarConfig()
    {
        return view('admin.configAdmin');
    }

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

    function frmEmployeeView()
    {
        return view('admin.employeeInfoForm');
    }
}
