<?php

namespace App\Http\Controllers;

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
    
}