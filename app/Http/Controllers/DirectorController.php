<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use PhpOffice\PhpWord\Style\Language;
use PhpOffice\PhpWord\Style\TOC;
use PhpOffice\PhpWord\TemplateProcessor;

use App\Models\SeccionCapitulo;
use App\Models\ContenidoSeccionCapitulo;
use App\Models\SubcontenidoSeccionCapitulo;

class DirectorController extends Controller
{
    public function __construct()
    {
        $this->middleware('director');
    }

    public function menuDirector()
    {
        return view('plantillas.plantillaMenuDirector');
    }
    //-------------------------------Filtros de asesores y directores de trabajo de graduación----------------------------

    public function formularioFiltro()
    {
        $cont = 0;
        $carreras[$cont][0] = "Ingenieria Informática"; $carreras[$cont++][1] = '1'; 
        $carreras[$cont][0] = "Ingenieria Civil"; $carreras[$cont++][1] = '1';
        $carreras[$cont][0] = "Ingenieria Eléctrica"; $carreras[$cont++][1] = '1';
        $carreras[$cont][0] = "Licenciatura en Mercadeo"; $carreras[$cont++][1] = '2'; 
        $carreras[$cont][0] = "Licentiatura en Comunicación Social"; $carreras[$cont++][1] = '2';
        $carreras[$cont][0] = "Técnico en Mercadeo"; $carreras[$cont++][1] = '2';
        return view('director.filtro', array(
            'docentes' => $carreras
        ));
    }

    public function filtro(Request $request)
    {
        $cont = 0;
        $carreras[$cont][0] = "Ingenieria Informática"; $carreras[$cont++][1] = '1'; 
        $carreras[$cont][0] = "Ingenieria Civil"; $carreras[$cont++][1] = '1';
        $carreras[$cont][0] = "Ingenieria Eléctrica"; $carreras[$cont++][1] = '1';
        $carreras[$cont][0] = "Licenciatura en Mercadeo"; $carreras[$cont++][1] = '2'; 
        $carreras[$cont][0] = "Licentiatura en Comunicación Social"; $carreras[$cont++][1] = '2';
        $carreras[$cont][0] = "Técnico en Mercadeo"; $carreras[$cont++][1] = '2';

        $contFiltro = 0;
        foreach ($carreras as $carrera) {
            if ($carrera[1] == $request->input('id')) {
                $filtro[$contFiltro][0] = $carrera[0]; $filtro[$contFiltro++][1] = $carrera[1];
            } else if ($request->input('id') == 0) {
                $filtro[$contFiltro][0] = $carrera[0]; $filtro[$contFiltro++][1] = $carrera[1];
            }
        }
        if (!isset($filtro)) {
            $filtro = "";
        } 
        return $filtro;
    }

    public function filtro2(Request $request)
    {
        $cont = 0;
        $docentes[$cont][0] = "Eduardo Alberto López Torres"; $docentes[$cont++][1] = '1'; 
        $docentes[$cont][0] = "Eduardo Alberto López Torres"; $docentes[$cont++][1] = '1'; 
        $docentes[$cont][0] = "Eduardo Alberto López Torres"; $docentes[$cont++][1] = '1'; 
        $docentes[$cont][0] = "Eduardo Alberto López Torres"; $docentes[$cont++][1] = '1'; 
        $docentes[$cont][0] = "Eduardo Alberto López Torres"; $docentes[$cont++][1] = '1'; 
        $docentes[$cont][0] = "Eduardo Alberto López Torres"; $docentes[$cont++][1] = '1'; 
        $docentes[$cont][0] = "Eduardo Alberto López Torres"; $docentes[$cont++][1] = '1'; 
        $docentes[$cont][0] = "Eduardo Alberto López Torres"; $docentes[$cont++][1] = '1'; 
        $docentes[$cont][0] = "Eduardo Alberto López Torres"; $docentes[$cont++][1] = '1'; 
        $docentes[$cont][0] = "Marielos Alejandra Najarro Alvarez"; $docentes[$cont++][1] = '2';
        $docentes[$cont][0] = "Nombre ".$cont.", Apellido ".$cont; $docentes[$cont++][1] = '3';
        $docentes[$cont][0] = "Nombre ".$cont.", Apellido ".$cont; $docentes[$cont++][1] = '4'; 
        $docentes[$cont][0] = "Nombre ".$cont.", Apellido ".$cont; $docentes[$cont++][1] = '5';
        $docentes[$cont][0] = "Nombre ".$cont.", Apellido ".$cont; $docentes[$cont++][1] = '6';
        
        $docentes[$cont][0] = "Nombre ".$cont.", Apellido ".$cont; $docentes[$cont++][1] = '1'; 
        $docentes[$cont][0] = "Nombre ".$cont.", Apellido ".$cont; $docentes[$cont++][1] = '2';
        $docentes[$cont][0] = "Nombre ".$cont.", Apellido ".$cont; $docentes[$cont++][1] = '3';
        $docentes[$cont][0] = "Nombre ".$cont.", Apellido ".$cont; $docentes[$cont++][1] = '4'; 
        $docentes[$cont][0] = "Nombre ".$cont.", Apellido ".$cont; $docentes[$cont++][1] = '5';
        $docentes[$cont][0] = "Nombre ".$cont.", Apellido ".$cont; $docentes[$cont++][1] = '6';

        $contFiltro = 0;
        foreach ($docentes as $docente) {
            if ($docente[1] == $request->input('id')) {
                $filtro[$contFiltro][0] = $docente[0]; $filtro[$contFiltro++][1] = $docente[1];
            } else if ($request->input('id') == 0) {
                $filtro[$contFiltro][0] = $docente[0]; $filtro[$contFiltro++][1] = $docente[1];
            }
        }
        if (!isset($filtro)) {
            $filtro = "";
        } 
        return $filtro;
    }

    public function asignarD(Request $request)
    {
        echo $request->input('nombresD') . '</br>';
        echo $request->input('idD') . '</br>';
        echo $request->input('nombresL') . '</br>';
        echo $request->input('idL') . '</br>';
    }

    public function buscador(Request $request)
    {
        $datos = json_decode($request->input("datos"));
        $contBusqueda = 0;
        foreach ($datos as $dato) {
            $valor = json_decode(strripos($dato[0], $request->input("busqueda")));
            if($valor == "0"){
                $busqueda[$contBusqueda][0] = $dato[0]; $busqueda[$contBusqueda++][1] = $dato[1];
            } 
        }
        if (!isset($busqueda)) {
            $busqueda = "";
        } 
        if ($request->input("busqueda") == "") {
            $busqueda = $datos;
        }
        return $busqueda;
    }
}
