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
            "lectores" => $lectores
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

    public function formularioGruposTrabajo(Request $request)
    {
        /*
            0 -> asesores
            1 -> lectores
        */
        
        $grupos = GrupoTrabajo::with('estudiante')->paginate(1);
        $busqueda = $request->get('buscadorE');
        $tipo = $request->get('tipoBusqueda');
        $nombreE = "";
        $apellidoE = "";
        $carnetE = "";
        if ($tipo == 1) {
            $nombreE = $busqueda;
        } elseif ($tipo == 2) {
            $apellidoE = $busqueda;
        } elseif ($tipo == 3) {
            $carnetE = $busqueda;
        }
        $idGrupo = $request->get('idGrupo');
        $estudiantes = Estudiante::where("carrera_id", "=", 7)->where('nombre', 'like', $nombreE.'%')->where('apellido', 'like', $apellidoE.'%')->where('carnet', 'like', $carnetE.'%')->where("grupo_trabajo_id", "=", $idGrupo)->orWhere("grupo_trabajo_id", "=", null)->paginate(6);
        $configuraciones = ConfiguracionSistema::first();
        
        if ($request->ajax()) {
            return response()->json(view($request->get('vista'), array(
                'grupos' => $grupos,
                'configuraciones' => $configuraciones,
                'estudiantes' => $estudiantes
            ))->render());
        }

        $facultad = Facultad::get();
        $departamento = DepartamentoU::where("facultad_id", "=", 1)->get();
        $empleado = Empleado::where("departamento_unidad_id", "=", 8)->get();
        $externo = Externo::where("departamento_unidad_id", "=", 8)->get();
        
        return view('director.gruposTrabajo', array(
            'departamentos' => $departamento,
            'facultades' => $facultad,
            'idFacultad' => 1,
            'idDepartamento' => 8,
            'empleados' => $empleado,
            'externos' => $externo,
            'grupos' => $grupos,
            'configuraciones' => $configuraciones,
            'estudiantes' => $estudiantes
        ));
    }

    public function filtroF(Request $request)
    {
        $id = $request->input('id');
        if ($id == -1) {
            $departamento = DepartamentoU::where("facultad_id", "=", null)->get();
        } else{
            $departamento = DepartamentoU::where("facultad_id", "=", $id)->get();
        }
        return $departamento;
    }

    public function filtroD(Request $request)
    {
        $id = $request->input('id');
        $empleados = Empleado::where("departamento_unidad_id", "=", $id)->get();
        return $empleados;
    }

    public function datosExterno(Request $request)
    {
        $tipoExterno = $request->input('id');
        $asesores = Externo::where('rol_externo', "=", $tipoExterno)->where("departamento_unidad_id", "=", 8)->orderBy('id', 'desc')->get();
        return $asesores;
    }

    public function registrarGrupo(Request $request)
    {
        /*
            0 -> UCA
            1 -> Externo
        */

        $id = $request->input('id');
        $tema = $request->input('tema');
        $idAsesor = $request->input('idAsesor');
        $tipoAsesor = $request->input('tipoAsesor');
        $idLector = $request->input('idLector');
        $tipoLector = $request->input('tipoLector');
        $prorroga = $request->input('prorroga');

        if ($id == "") {
            $grupoTrabajo = new GrupoTrabajo();
            $grupoTrabajo->tema = $tema;
            if ($idAsesor != "") {
                if ($tipoAsesor == 0) {
                    $grupoTrabajo->asesor_interno_id = $idAsesor;
                } else if ($tipoAsesor == 1) {
                    $grupoTrabajo->asesor_externo_id = $idAsesor;
                }
            } 

            if ($idLector != "") {
                if ($tipoLector == 0) {
                    $grupoTrabajo->lector_interno_id = $idLector;
                } else if ($tipoLector == 1) {
                    $grupoTrabajo->lector_externo_id = $idLector;
                }
            } 
            
            $grupoTrabajo->anio_inicio = "2022";
            $grupoTrabajo->ciclo_inicio = "1";
            $grupoTrabajo->prorroga = $prorroga;
            $grupoTrabajo->save();

            // Falta seccion de estudiantes, falta validacion de campos vacios de tema y asignacion de estudiantes
            // Validacion cuando el lector o asesor externo cambia su rol, verificarlo en la tabla de grupo.
        } else{
            $grupoTrabajo = GrupoTrabajo::findOrFail($id);
            $grupoTrabajo->tema = $tema;
            if ($idAsesor != "") {
                if ($tipoAsesor == 0) {
                    $grupoTrabajo->asesor_interno_id = $idAsesor;
                    $grupoTrabajo->asesor_externo_id = null;
                } else if ($tipoAsesor == 1) {
                    $grupoTrabajo->asesor_externo_id = $idAsesor;
                    $grupoTrabajo->asesor_interno_id = null;
                }
            } else{
                $grupoTrabajo->asesor_interno_id = null;
                $grupoTrabajo->asesor_externo_id = null;
            }

            if ($idLector != "") {
                if ($tipoLector == 0) {
                    $grupoTrabajo->lector_interno_id = $idLector;
                    $grupoTrabajo->lector_externo_id = null;
                } else if ($tipoLector == 1) {
                    $grupoTrabajo->lector_externo_id = $idLector;
                    $grupoTrabajo->lector_interno_id = null;
                }
            } else{
                $grupoTrabajo->lector_interno_id = null;
                $grupoTrabajo->lector_externo_id = null;
            }
            
            $grupoTrabajo->anio_inicio = "2022";
            $grupoTrabajo->ciclo_inicio = "1";
            $grupoTrabajo->prorroga = $prorroga;
            $grupoTrabajo->update();
        }
        $integrantesGrupo = $request->input('integrantes');
        if ($id == "") {
            foreach ($integrantesGrupo as $integrante) {
                $estudiante = Estudiante::findOrFail($integrante);
                $estudiante->grupo_trabajo_id = $grupoTrabajo->id;
                $estudiante->update(); 
            }
        } else{
            $estudiante = Estudiante::where("grupo_trabajo_id", "=", $grupoTrabajo->id)->get();
            foreach ($estudiante as $dato) {
                if (!in_array($dato->id, $integrantesGrupo)) {
                    $estudiante = Estudiante::findOrFail($dato->id);
                    $estudiante->grupo_trabajo_id = null;
                    $estudiante->update();
                } else if(in_array($dato->id, $integrantesGrupo)){
                    unset($integrantesGrupo[array_search($dato->id, $integrantesGrupo)]);
                }
            }
            foreach ($integrantesGrupo as $integrante) {
                $estudiante = Estudiante::findOrFail($integrante);
                $estudiante->grupo_trabajo_id = $grupoTrabajo->id;
                $estudiante->update(); 
            }
        }
        /*
            if (!in_array(10, $integrantesGrupo)) {
                $estudiante = Estudiante::findOrFail(10);
                $estudiante->grupo_trabajo_id = $grupoTrabajo->id;
            }  
        */
    }

    public function mostrarDatosGrupo(Request $request)
    {
        $id = $request->input("id");
        $gruposTrabajo = GrupoTrabajo::with("estudiante")->with("lector_interno")->with("asesor_interno")->with("lector_externo")->with("asesor_externo")->where("id", "=", $id)->first();   	
        return $gruposTrabajo;
    }

    //----------------------------------Asignar estudiantes a los trabajos de graduacion-------------------------------------

    public function mostrarDatoEstudiante(Request $request)
    {
        $id = $request->input("id");
        $gruposTrabajo = GrupoTrabajo::with("lector_interno")->with("asesor_interno")->with("lector_externo")->with("asesor_externo")->where("id", "=", $id)->first();   	
        return $gruposTrabajo;
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
