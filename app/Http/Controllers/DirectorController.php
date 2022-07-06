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

class DirectorController extends Controller
{
    // Valida que solo el usuario del director de carrera pueda entrar a los formularios de este controlador.
    public function __construct()
    {
        $this->middleware('director');
    }

    // Redirije al menu del director de carrera.
    public function menuDirector()
    {
        return view('plantillas.plantillaMenuDirector');
    }

    // Obtiene los datos del director de carrera que este en sesión.
    private function obtenerDatosDirector()
    {
        $id = auth()->guard('admin')->user()->id;
        $director_carrera = DirectorCarrera::with("empleado")->where("usuario_id", "=", $id)->first();
        return $director_carrera;
    }

    //-------------------------------Asesores y lectores externos----------------------------

    // Redirije al formulario del Lector y Asesor.
    public function frmLectorAsesor(Request $request)
    {
        /*
            0 -> asesores
            1 -> lectores
        */
        
        $departamentoBusqueda = $this->obtenerDatosDirector()->empleado->departamento_unidad_id;
        $tipoAD = $request->get('tipoLectorAsesor');

        // Datos para usar en caso de realizar una busqueda o filtrar los datos.
        $tipoBusqueda = $request->get('tipoBusqueda');
        $busqueda = $request->get('busqueda');

        // Datos del Lector.
        $nombreL = "";
        $apellidoL = "";
        $correoL = "";

        // Datos del director del trabajo de graduación.
        $nombreD = "";
        $apellidoD = "";
        $correoD = "";

        // En caso de buscar los datos del lector es 1, caso contrario es 2, es decir el director del trabajo de graduación.
        if ($tipoAD == 1) { // Lector
            if ($tipoBusqueda == 1) {
                $nombreL = $busqueda;
            } else if ($tipoBusqueda == 2) {
                $apellidoL = $busqueda;
            } else if ($tipoBusqueda == 3) {
                $correoL = $busqueda;
            }
        } else if ($tipoAD == 2) { // Director del trabajo de graduación
            if ($tipoBusqueda == 1) {
                $nombreD = $busqueda;
            } else if ($tipoBusqueda == 2) {
                $apellidoD = $busqueda;
            } else if ($tipoBusqueda == 3) {
                $correoD = $busqueda;
            }
        }

        // Obtener los datos de los directores de los trabajos de graduación, combinado con el filtro en caso se quiera hacer una busqueda.
        $asesores = Externo::with('departamento')->where('rol_externo', "=", 0)->
        where("departamento_unidad_id", "=", $departamentoBusqueda)->where("nombre", "like", $nombreD."%")->Where("apellido", "like", $apellidoD."%")->Where("correo", "like", $correoD."%")
        ->orderBy('id', 'desc')->paginate(10);
        
        // Obtener los datos de los lectores, combinado con el filtro en caso se quiera hacer una busqueda.
        $lectores = Externo::with('departamento')->where('rol_externo', "=", 1)->
        where("departamento_unidad_id", "=", $departamentoBusqueda)->where("nombre", "like", $nombreL."%")->Where("apellido", "like", $apellidoL."%")->Where("correo", "like", $correoL."%")
        ->orderBy('id', 'desc')->paginate(10);

        // En caso de realizar un filtro, simplemente retornaria una vista devolviendo una tabla con los datos filtrados.
        if ($request->ajax()) {
            return response()->json(view($request->get('vista'), array(
                "asesores" => $asesores,
                "lectores" => $lectores
            ))->render());
        }

        // redirije a la vista del lector o asesor externo, en caso no se haya utilizado la función para filtro.
        return view('director.externo', array(
            "asesores" => $asesores,
            "lectores" => $lectores
        ));
    }

    // Función para registrar Asesor o Lector.
    public function registrarLA(Request $request)
    {
        // Se obtiene el id en caso se quiera modificar el dato.
        $id = $request->input('id');
        // Se obtiene el departamento al que pertenece el director de carrera.
        $departamento = $this->obtenerDatosDirector()->empleado->departamento_unidad_id;

        if ($id != "") { // En caso el id no este vacío, se actualizara el dato.
            $externo = Externo::findOrFail($id);
            $externo->nombre = $request->input('nombre');
            $externo->apellido = $request->input('apellido');
            $externo->correo = $request->input('correo');
            $externo->descripcion = $request->input('descripcion');
            $externo->rol_externo = $request->input('rol');
            $externo->departamento_unidad_id = $departamento;
            $externo->update();
        } else{ // Caso contrario el id este vacio, se agregará un nuevo lector o asesor, segun sea el caso.
            $externo = new Externo();
            $externo->nombre = $request->input('nombre');
            $externo->apellido = $request->input('apellido');
            $externo->correo = $request->input('correo');
            $externo->descripcion = $request->input('descripcion');
            $externo->rol_externo = $request->input('rol');
            $externo->departamento_unidad_id = $departamento;
            $externo->save();
        }
    }

    // Se obtiene un solo registro de algun lector o asesor.
    public function mostrarDato(Request $request)
    {
        $externo = Externo::with('departamento')->where('id', "=", $request->id)->first();
        return $externo;
    }

    //-------------------------------Filtros de asesores y directores de trabajo de graduación----------------------------

    // Se despliega el formulario de grupos de trabajo o se realiza un filtro de estudiantes.
    public function formularioGruposTrabajo(Request $request)
    {
        /*
            0 -> asesores
            1 -> lectores
        */

        $carrera = $this->obtenerDatosDirector()->carrera_id;
        $departamentoBusqueda = $this->obtenerDatosDirector()->empleado->departamento_unidad_id;
        $grupos = GrupoTrabajo::with('estudiante')->paginate(10);

        // Si es el caso, se obtienen los datos necesarios para realizar los filtros de estudiantes.
        $busqueda = $request->get('buscadorE');
        $tipo = $request->get('tipoBusqueda');
        // Datos a buscar del estudiante.
        $nombreE = "";
        $apellidoE = "";
        $carnetE = "";

        // Solo se puede buscar por un tipo de dato a la vez, como por nombre, apellido o carnet del estudiante.
        if ($tipo == 1) {
            $nombreE = $busqueda;
        } elseif ($tipo == 2) {
            $apellidoE = $busqueda;
        } elseif ($tipo == 3) {
            $carnetE = $busqueda;
        }

        // Se obtienen los datos de los estudiantes y si se da el caso, tambien se realizan los respectivos filtros.
        $idGrupo = $request->get('idGrupo');
        $estudiantes = Estudiante::where("carrera_id", "=", $carrera)->where("grupo_trabajo_id", "=", null)->orWhere("grupo_trabajo_id", "=", $idGrupo)->having('nombre', 'like', $nombreE.'%')->having('apellido', 'like', $apellidoE.'%')->having('carnet', 'like', $carnetE.'%')->orderBy("grupo_trabajo_id", "desc")->paginate(6);
        $configuraciones = ConfiguracionSistema::first(); // Configuraciones de los grupos de trabajo.
        
        // Retorna una tabla, en la cual se obtienen los datos de los estudiantes filtrados anteriormente, solo si es el caso.
        if ($request->ajax()) {
            return response()->json(view($request->get('vista'), array(
                'grupos' => $grupos,
                'configuraciones' => $configuraciones,
                'estudiantes' => $estudiantes
            ))->render());
        }

        // Obtiene los datos restantes, necesarios para el formulario de grupos de trabajo.
        $facultad = Facultad::get();
        $facultadBusqueda = Carrera::where("id", "=", $carrera)->first();
        $departamento = DepartamentoU::where("facultad_id", "=", $facultadBusqueda->facultad_id)->get();
        $empleado = Empleado::where("departamento_unidad_id", "=", $departamentoBusqueda)->get();
        $externo = Externo::where("departamento_unidad_id", "=", $departamentoBusqueda)->get();
        
        // Redirije al formulario grupos de trabajo.
        return view('director.gruposTrabajo', array(
            'departamentos' => $departamento,
            'facultades' => $facultad,
            'idFacultad' => $facultadBusqueda->facultad_id,
            'idDepartamento' => $departamentoBusqueda,
            'empleados' => $empleado,
            'externos' => $externo,
            'grupos' => $grupos,
            'configuraciones' => $configuraciones,
            'estudiantes' => $estudiantes
        ));
    }

    // Se hace un filtro del departamento por facultad.
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

    // Se hace un filtro de los empleados segun los departamentos.
    public function filtroD(Request $request)
    {
        $id = $request->input('id');
        $empleados = Empleado::where("departamento_unidad_id", "=", $id)->get();
        return $empleados;
    }

    // Se obtienen los registros de las personas externas, ya sea lector o directos rel trabajo.
    public function datosExterno(Request $request)
    {
        $departamento = $this->obtenerDatosDirector()->empleado->departamento_unidad_id;
        $tipoExterno = $request->input('id');
        $asesores = Externo::where('rol_externo', "=", $tipoExterno)->where("departamento_unidad_id", "=", $departamento)->orderBy('id', 'desc')->get();
        return $asesores;
    }

    // Se registra o modifica al grupo de trabajo de graduación.
    public function registrarGrupo(Request $request)
    {
        /*
            0 -> UCA
            1 -> Externo
        */

        // Se obtienen los datos generales del grupo de trabajo de graduación.
        $id = $request->input('id');
        $tema = $request->input('tema');
        $idAsesor = $request->input('idAsesor');
        $tipoAsesor = $request->input('tipoAsesor');
        $idLector = $request->input('idLector');
        $tipoLector = $request->input('tipoLector');
        $prorroga = $request->input('prorroga');

        if ($id == "") { // En caso el id este vacio, se ingresará un nuevo grupo de trabajo de graduación.
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
        } else{ // Caso contrario, el no este vacio, el grupo de trabajo de graduación, solo se modificará.
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

        // ----------------- Asignación de estudiantes al grupo de trabajo -----------------------------------

        $integrantesGrupo = $request->input('integrantes');
        if ($id == "") { // En caso el id este vació, simplemente a los estudiantes se les asignará el grupo anteriormente creado.
            foreach ($integrantesGrupo as $integrante) {
                $estudiante = Estudiante::findOrFail($integrante);
                $estudiante->grupo_trabajo_id = $grupoTrabajo->id;
                $estudiante->update(); 
            }
        } else{ // Caso contrario, se verificará a los estudiantes que fueron eliminados del grupo o que fueron agregados.
            // Se obtienen a los estudiantes que pertenecen al grupo actualmente.
            $estudiante = Estudiante::where("grupo_trabajo_id", "=", $grupoTrabajo->id)->get();
            foreach ($estudiante as $dato) { // Se verifican a los estudiantes que fueron eliminados del grupo y pasa a estado NULL.
                if (!in_array($dato->id, $integrantesGrupo)) {
                    $estudiante = Estudiante::findOrFail($dato->id);
                    $estudiante->grupo_trabajo_id = null;
                    $estudiante->update();
                } else if(in_array($dato->id, $integrantesGrupo)){
                    unset($integrantesGrupo[array_search($dato->id, $integrantesGrupo)]);
                }
            }
            foreach ($integrantesGrupo as $integrante) { // Se asignan a los nuevos integrantes del grupo de graduación.
                $estudiante = Estudiante::findOrFail($integrante);
                $estudiante->grupo_trabajo_id = $grupoTrabajo->id;
                $estudiante->update(); 
            }
        }
    }

    // Se muestra un solo registro de un grupo de graduación en específico.
    public function mostrarDatosGrupo(Request $request)
    {
        $id = $request->input("id");
        $gruposTrabajo = GrupoTrabajo::with("estudiante")->with("lector_interno")->with("asesor_interno")->with("lector_externo")->with("asesor_externo")->where("id", "=", $id)->first();   	
        return $gruposTrabajo;
    }

    //----------------------------------Asignar estudiantes a los trabajos de graduacion-------------------------------------

    //Se muestra un registro en especifico de un grupo de trabajo de graduación.
    public function mostrarDatoEstudiante(Request $request)
    {
        $id = $request->input("id");
        $gruposTrabajo = GrupoTrabajo::with("lector_interno")->with("asesor_interno")->with("lector_externo")->with("asesor_externo")->where("id", "=", $id)->first();   	
        return $gruposTrabajo;
    }

    // Se hace un buscador para los estudiantes. 
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
