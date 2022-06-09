<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use PhpOffice\PhpWord\Style\Language;
use PhpOffice\PhpWord\Style\TOC;
use PhpOffice\PhpWord\TemplateProcessor;

use App\Models\Externo;

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

    //-------------------------------Asesores y lectores externos----------------------------

    public function frmLectorAsesor(Request $request)
    {
        /*
            0 -> asesores
            1 -> lectores
        */

        $asesores = Externo::with('departamento')->where('rol_externo', "=", 0)->orderBy('id', 'desc')->paginate(6);
        $lectores = Externo::with('departamento')->where('rol_externo', "=", 1)->orderBy('id', 'desc')->paginate(6);

        if ($request->ajax()) {
            return response()->json(view($request->get('vista'), array(
                "asesores" => $asesores,
                "lectores" => $lectores
            ))->render());
        }

        return view('director.externo', array(
            "asesores" => $asesores,
            "lectores" => $lectores, 
            "pagAsesores" => $asesores->links('pagination::bootstrap-4'),
            "pagLectores" => $lectores->links('pagination::bootstrap-4')
        ));
    }

    public function registrarLA(Request $request)
    {
        $id = $request->input('id');
        if ($id != "") {
            $externo = Externo::findOrFail($id);
            $externo->nombre = $request->input('nombre');
            $externo->apellido = $request->input('apellido');
            $externo->correo = $request->input('correo');
            $externo->descripcion = $request->input('descripcion');
            $externo->rol_externo = $request->input('rol');
            $externo->departamento_unidad_id = 8;
            $externo->update();
        } else{
            $externo = new Externo();
            $externo->nombre = $request->input('nombre');
            $externo->apellido = $request->input('apellido');
            $externo->correo = $request->input('correo');
            $externo->descripcion = $request->input('descripcion');
            $externo->rol_externo = $request->input('rol');
            $externo->departamento_unidad_id = 8;
            $externo->save();
        }
    }

    public function mostrarDato(Request $request)
    {
        $externo = Externo::with('departamento')->where('id', "=", $request->id)->first();
        return $externo;
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
