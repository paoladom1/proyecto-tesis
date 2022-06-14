<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use PhpOffice\PhpWord\Style\Language;
use PhpOffice\PhpWord\Style\TOC;
use PhpOffice\PhpWord\TemplateProcessor;

use App\Models\SeccionResumen;
use App\Models\SeccionAgradecimiento;
use App\Models\SeccionDedicatoria;
use App\Models\SeccionAbreviaturaNomenclaturaSigla;
use App\Models\SeccionCapitulo;
use App\Models\SeccionGlosario;
use App\Models\SeccionReferencia;
use App\Models\ContenidoSeccionCapitulo;
use App\Models\SubcontenidoSeccionCapitulo;
use App\Models\Estudiante;
use App\Models\Bitacora;
use App\Models\BitacoraSeccion;
use App\Models\BitacoraModificacion;

class EstudianteController extends Controller
{
    public function __construct()
    {
        $this->middleware('estudiante');
    }

    //-------------------------------------Funciones generales-----------------------------------

    public function obtenerGrupo(){
        $grupo = auth()->guard('admin')->user()->id;
        $estudiante = Estudiante::where('usuario_id', '=', $grupo)->first();
        return $estudiante->grupo_trabajo_id;
    }

    public function bitacora($descripcion, $bitacora_seccion, $bitacora_modificacion)
    {
        /*
            - BITACORA_MODIFICACION -
            1 -> Agregó
            2 -> Modificó
            3 -> Eliminó
            4 -> Creación

            - BITACORA_SECCIÓN -
            1 -> Agradecimiento
            2 -> Dedicatoria
            3 -> Resumen
            4 -> Siglas
            5 -> Abreviaciones
            6 -> Nomenclaturas
            7 -> Capítulo
            8 -> Glosario
            9 -> Referencia
            10 -> Creación de documento
        */
        $grupo = auth()->guard('admin')->user()->id;
        $estudiante = Estudiante::where('usuario_id', '=', $grupo)->first();

        $bitacora = New Bitacora();
        $bitacora->descripcion = $descripcion;
        $bitacora->estudiante_id = $estudiante->id;
        $bitacora->bitacora_seccion_id = $bitacora_seccion;
        $bitacora->bitacora_modificacion_id = $bitacora_modificacion;
        $bitacora->save();
    }

    //-------------------------------------Creación de capitulos-----------------------------------
        
    public function formCapitulos()
    {
        $capitulo = SeccionCapitulo::orderBy("orden_capitulo", 'asc')->where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
        return view("formulariosDoc.capitulo", array(
            "capitulos" => $capitulo
        ));
    }

    public function registrar(Request $request)
    {
        $capitulo = new SeccionCapitulo();
        $capitulo->nombre_capitulo = $request->input('nombreTitulo');
        $capitulo->orden_capitulo = $request->input('orden_capitulo');
        //$capitulo->grupo_trabajo_id = $request->input('orden_capitulo');
        $capitulo->grupo_trabajo_id = $this->obtenerGrupo();
        $capitulo->save();
        $this->bitacora('Se ha creado el capítulo: '.$capitulo->nombre_capitulo, 7, 1);
        $capitulos = SeccionCapitulo::orderBy("orden_capitulo", 'asc')->get();
        return $capitulos;
    }

    public function modificar(Request $request)
    {
        if($request->input('idList')){
            $ids = json_decode($request->input('idList'));
            $cont = 1;
            foreach ($ids as $id) {
                $capitulo = SeccionCapitulo::findOrFail($id);
                $capitulo->orden_capitulo = $cont++;
                $capitulo->update();
            }  
        } else if($request->input('id')){
            $id = $request->input('id');
            $nombre = $request->input('nombre');
            $capitulo = SeccionCapitulo::findOrFail($id);
            $this->bitacora('Se ha modificado el capítulo: '.$capitulo->nombre_capitulo.'. El nuevo nombre del capítulo es: '.$nombre, 7, 2);
            $capitulo->nombre_capitulo = $nombre;
            $capitulo->update();   
            $capitulos = SeccionCapitulo::orderBy("orden_capitulo", 'asc')->get();
            return $capitulos;
        }
    }

    public function eliminar(Request $request)
    {
        $id = $request->input('id');
        $capitulo = SeccionCapitulo::findOrFail($id);
        $this->bitacora('Se ha eliminado el capítulo: '.$capitulo->nombre_capitulo, 7, 3);
        $capitulo->delete();
    }

    //-----------------------------------Agregar temas y subtemas de capitulos-------------------------------------------

    public function formularioDinamico($id){ 
        // Validar que el contenido que se pueda ver corresponda al equipo
        $capitulo = SeccionCapitulo::with('contenidoSeccionCapitulo')->where('grupo_trabajo_id', '=', $this->obtenerGrupo())->where('id', '=', $id)->first();
        
        if ($capitulo == null) {
            return redirect('capitulos')->with('statusError', 'Error, el capitulo seleccionado es incorrecto!');
        }else if($capitulo->grupo_trabajo_id != $this->obtenerGrupo()){
            return redirect('capitulos')->with('statusError', 'Error, el capitulo seleccionado es incorrecto!');
        } 

        $contenido = ContenidoSeccionCapitulo::with('contenidoCapitulo2')->orderBy("orden_contenido", 'asc')->where('seccion_capitulo_id', '=', $id)->where('orden_contenido', '>',0)->get();
        $contenido_introduccion = ContenidoSeccionCapitulo::with('contenidoCapitulo2')->where('seccion_capitulo_id', '=', $id)->where('orden_contenido', '=',0)->get();
        return view('formulariosDoc.contenidoCapitulo', array(
            "capitulo" => $capitulo,
            "contenido" => $contenido,
            "introduccion" => $contenido_introduccion
        ));
    }

    public function crearDinamico(Request $request){
        $id = $request->input('idCapitulo');
        $capitulo = SeccionCapitulo::with('contenidoSeccionCapitulo')->findOrFail($id);
        $i = 0;
        $i2 = 0;
        foreach ($request->input('seccion1') as $seccion) {
            $idCont = $request->input('seccion3')[$i];
            $tipo = $request->input('seccion4')[$i];
            $idTitulo;
            if($tipo == 2){
                if ($idCont == 0) {
                    $contenidoCapitulo2 = new SubcontenidoSeccionCapitulo();
                } else{
                    $contenidoCapitulo2 = SubcontenidoSeccionCapitulo::findOrFail($idCont);
                }
                $contenidoCapitulo2->subtema = $seccion;
                $contenidoCapitulo2->contenido = $request->input('seccion2')[$i];
                $contenidoCapitulo2->orden_subcontenido = $i;
                if($request->input('seccion5')[$i2] == 0){
                    $contenidoCapitulo2->contenido_seccion_capitulo_id  = $idTitulo;
                } else{
                    $contenidoCapitulo2->contenido_seccion_capitulo_id = $request->input('seccion5')[$i2];
                }
                if ($idCont == 0) {
                    $contenidoCapitulo2->save(); 
                } else{
                    $contenidoCapitulo2->update(); 
                }
                ++$i2;
            } else{
                if ($idCont == 0) {
                    $contenidoCapitulo = new ContenidoSeccionCapitulo();
                } else{
                    $contenidoCapitulo = ContenidoSeccionCapitulo::findOrFail($idCont);
                }
                $contenidoCapitulo->tema = $seccion;
                if($i == 0){
                    if ($request->input('seccion2')[$i] == null) {
                        $contenidoCapitulo->contenido = "<p>null</p>";    
                    } else{
                        $contenidoCapitulo->contenido = $request->input('seccion2')[$i];  
                    }
                } else{
                    $contenidoCapitulo->contenido = $request->input('seccion2')[$i];   
                }
                $contenidoCapitulo->orden_contenido = $i;
                $contenidoCapitulo->seccion_capitulo_id = $id;
                if ($idCont == 0) {
                    $contenidoCapitulo->save(); 
                    $idTitulo=  $contenidoCapitulo->id;
                } else{
                    $contenidoCapitulo->update(); 
                }
            }
            ++$i;
        }
        $this->bitacora('Se ha modificado el contenido del capítulo: '.$capitulo->nombre_capitulo, 7, 2);
        return redirect('capitulos')->with('status', '¡Se guardaron los datos del Capítulo '.$capitulo->orden_capitulo.'. '.$capitulo->nombre_capitulo.'!');
    }

    public function eliminarContenido(Request $request)
    {
        $id = $request->input('id');
        $capitulo = $request->input('capitulo');
        $contenido = ContenidoSeccionCapitulo::findOrFail($id);
        $this->bitacora('Se ha eliminado el tema: '.$contenido->tema.' del capítulo: '.$capitulo, 7, 3);
        $contenido->delete();
    }

    public function eliminarContenido2(Request $request)
    {
        $id = $request->input('id');
        $capitulo = $request->input('capitulo');
        $contenido = SubcontenidoSeccionCapitulo::findOrFail($id);
        $this->bitacora('Se ha eliminado el subtema: '.$contenido->tema.' del capitulo: '.$capitulo, 7, 3);
        $contenido->delete();
    }

    //---------------------------------------Sección de resumen---------------------------------------------
    public function frmResumen(){ 
        $resumen = SeccionResumen::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
        return view('formulariosDoc.resumen', array(
            "resumen" => $resumen
        ));
    }

    public function saveResumen(Request $request){
        $id = $request->input('id');
        $contenido = $request->input('contenido');
        if($contenido == ""){
            $mensaje = array(
                'code'=> 400,
                'mensaje' => "¡No pueden quedar campos vacíos!"
            );
        } else{
            if($id == null){
                $resumen = new SeccionResumen();
                $resumen -> contenido = $contenido;
                $resumen -> grupo_trabajo_id = $this->obtenerGrupo();
                $resumen->save();
                $id = $resumen->id;
                $this->bitacora('Se creó la sección de resumen', 3, 1);
            } else{
                $resumen = SeccionResumen::findOrFail($id);
                $resumen -> contenido = $contenido;
                $resumen -> grupo_trabajo_id = $this->obtenerGrupo();
                $resumen->update();
                $this->bitacora('Se modificó la sección de resumen', 3, 2);
            }
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "¡Se guardó el resumen exitosamente!",
                'id' => $id
            );
        }
        return $mensaje;
    }

    //---------------------------------------Sección de referencias---------------------------------------------
    public function frmReferencia(){ 
        $referencia = SeccionReferencia::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
        return view('formulariosDoc.referencias', array(
            "referencia" => $referencia
        ));
    }

    public function saveReferencia(Request $request){
        $id = $request->input('id');
        $contenido = $request->input('contenido');
        if($contenido == ""){
            $mensaje = array(
                'code'=> 400,
                'mensaje' => "¡No pueden quedar campos vacíos!"
            );
        } else{
            if($id == null){
                $referencia = new SeccionReferencia();
                $referencia -> contenido = $contenido;
                $referencia -> grupo_trabajo_id = $this->obtenerGrupo();
                $referencia->save();
                $id = $referencia->id;
                $this->bitacora('Se creó la sección de referencias', 9, 1);
            } else{
                $referencia = SeccionReferencia::findOrFail($id);
                $referencia -> contenido = $contenido;
                $referencia -> grupo_trabajo_id = $this->obtenerGrupo();
                $referencia->update();
                $this->bitacora('Se modificó la sección de referencias', 9, 2);
            }
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "¡Se guardaron las referencias exitosamente!",
                'id' => $id
            );
        }
        return $mensaje;
    }

    //---------------------------------------Sección de glosario---------------------------------------------
    public function frmGlosario(){ 
        $glosario = SeccionGlosario::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
        if (count($glosario) == 0) {
            $desabilitar = "disabled";
        } else {
            $desabilitar = "";
        }
        
        return view('formulariosDoc.glosario', array(
            "glosario" => $glosario,
            "desabilitar" => $desabilitar
        ));
    }

    public function saveGlosario(Request $request){
        $id = $request->input('id');
        $contenido = $request->input('contenido');
        $opcional = $request->input('opcional');
        if($contenido == ""){
            $mensaje = array(
                'code'=> 400,
                'mensaje' => "¡No pueden quedar campos vacíos!"
            );
        } else{
            if($id == null){
                $glosario = new SeccionGlosario();
                $glosario -> contenido = $contenido;
                $glosario -> grupo_trabajo_id = $this->obtenerGrupo();
                $glosario -> opcional = $opcional;
                $glosario->save();
                $id = $glosario->id;
                $this->bitacora('Se creó la sección de glosario', 8, 1);
            } else{
                $glosario = SeccionGlosario::findOrFail($id);
                $glosario -> contenido = $contenido;
                $glosario -> grupo_trabajo_id = $this->obtenerGrupo();
                $glosario -> opcional = $opcional;
                $glosario->update();
                $this->bitacora('Se modificó la sección de glosario', 8, 2);
            }
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "¡Se guardó el glosario exitosamente!",
                'id' => $id
            );
        }
        return $mensaje;
    }

    public function cambioEstadoGlosario(Request $request)
    {
        $id = $request->input('id');
        $opcional = $request->input('opcional');
        $glosario = SeccionGlosario::findOrFail($id);
        $glosario -> opcional  = $opcional;
        $glosario->update();  

        if($opcional == 1){
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "¡Cambió a estado: Es opcional! (La sección del glosario no se incluirá en el documento)"
            );
            $this->bitacora('Se cambió a estado: Es opcional', 8, 2);
        } else{
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "¡Cambió a estado: No es opcional! (La sección del glosario se podrá incluir en el documento)"
            );
            $this->bitacora('Se cambió a estado: No es opcional', 8, 2);
        }

        return $mensaje;
    }

    //--------------------------------Sección de abreviatura, nomenclatura y glosario-----------------------------------------
    public function frmAbreviatura(){ 
        $abreviatura = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->where('tipo_abreviatura_id', '=', 1)->get();
        $nomenclatura = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->where('tipo_abreviatura_id', '=', 3)->get();
        $sigla = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->where('tipo_abreviatura_id', '=', 2)->get();
        return view('formulariosDoc.abreviaturas', array(
            "abreviatura" => $abreviatura,
            "nomenclatura" => $nomenclatura,
            "sigla" => $sigla
        ));
    }

    public function saveAbreviatura(Request $request){
        $id = $request->input('id');
        $contenido = $request->input('contenido');
        $tipo = $request->input('tipo');
        if($contenido == ""){
            $mensaje = array(
                'code'=> 400,
                'mensaje' => "¡No pueden quedar campos vacíos!"
            );
        } else{
            if($id == null){
                $abreviatura = new SeccionAbreviaturaNomenclaturaSigla();
                $abreviatura -> contenido = $contenido;
                $abreviatura -> grupo_trabajo_id = $this->obtenerGrupo();
                $abreviatura -> tipo_abreviatura_id  = $tipo;
                $abreviatura->save();
                $id = $abreviatura->id;
                if ($tipo == 1) {
                    $this->bitacora('Se creó la sección de abreviaciones', 5, 1);
                } else if($tipo == 2){
                    $this->bitacora('Se creó la sección de siglas', 4, 1);
                } else if ($tipo == 3) {
                    $this->bitacora('Se creó la sección de nomenclaturas', 6, 1);
                }
            } else{
                $abreviatura = SeccionAbreviaturaNomenclaturaSigla::findOrFail($id);
                $abreviatura -> contenido = $contenido;
                $abreviatura -> grupo_trabajo_id = $this->obtenerGrupo();
                $abreviatura -> tipo_abreviatura_id  = $tipo;
                $abreviatura->update();
                if ($tipo == 1) {
                    $this->bitacora('Se modificó la sección de abreviaciones', 5, 2);
                } else if($tipo == 2){
                    $this->bitacora('Se modificó la sección de siglas', 4, 2);
                } else if ($tipo == 3) {
                    $this->bitacora('Se modificó la sección de nomenclaturas', 6, 2);
                }
            }

            if ($tipo == 1) {
                $tipoMensaje = "las abreviaciones";
            } else if($tipo == 2){
                $tipoMensaje = "las siglas";
            } else if ($tipo == 3) {
                $tipoMensaje = "las nomenclaturas";
            }

            $mensaje = array(
                'code'=> 200,
                'mensaje' => "¡Se guardó ".$tipoMensaje." exitosamente!",
                'id' => $id
            );
        }
        return $mensaje;
    }

     //-------------------------------------Creación de agradecimientos y dedicatoria-----------------------------------

    public function frmAgradecimientoDedicatoria(){ 
        $dedicatoria = SeccionDedicatoria::join('estudiante','estudiante_id', '=', 'estudiante.id', 'right outer')->selectRaw('*, seccion_dedicatoria.id as idDedicatoria, estudiante.id as idEstudiante')->where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
        $agradecimiento = SeccionAgradecimiento::join('estudiante','estudiante_id', '=', 'estudiante.id', 'right outer')->selectRaw('*, seccion_agradecimiento.id as idAgradecimiento, estudiante.id as idEstudiante')->where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
        $dedicatoriaEstado =  SeccionDedicatoria::join('estudiante','estudiante_id', '=', 'estudiante.id')->where('grupo_trabajo_id', '=', $this->obtenerGrupo())->groupBy("opcional")->first("opcional");
        $agradecimientoEstado =  SeccionAgradecimiento::join('estudiante','estudiante_id', '=', 'estudiante.id')->where('grupo_trabajo_id', '=', $this->obtenerGrupo())->groupBy("opcional")->first("opcional");
        $dedicatoriaContador =  SeccionDedicatoria::join('estudiante','estudiante_id', '=', 'estudiante.id')->where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get("opcional");
        $agradecimientoContador =  SeccionAgradecimiento::join('estudiante','estudiante_id', '=', 'estudiante.id')->where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get("opcional");
        $opcionDedicatoria = "";
        $opcionAgradecimiento = "";
        $desabilitarDedicatoria = "";
        $desabilitarAgradecimiento = "";

        if ($dedicatoriaEstado != null) {
            if ($dedicatoriaEstado->opcional == 1) {
                $opcionDedicatoria = "checked";
            }
        } 

        if ($agradecimientoEstado != null) {
            if ($agradecimientoEstado->opcional == 1) {
                $opcionAgradecimiento = "checked";
            }
        }

        if(count($dedicatoriaContador) == 0){
            $desabilitarDedicatoria = "disabled";
        }

        if(count($agradecimientoContador) == 0){
            $desabilitarAgradecimiento = "disabled";
        }

        return view('formulariosDoc.agradecimientos', array(
            "dedicatoria" => $dedicatoria,
            "agradecimiento" => $agradecimiento,
            "dedicatoriaEstado" => $opcionDedicatoria,
            "agradecimientoEstado" => $opcionAgradecimiento,
            "desabilitarDedicatoria" => $desabilitarDedicatoria,
            "desabilitarAgradecimiento" => $desabilitarAgradecimiento,
        ));
    }

    public function saveAgradecimiento(Request $request){
        $id = $request->input('id');
        $idEstudiante = $request->input('idEstudiante');
        $contenido = $request->input('contenido');
        $autor = $request->input('autor');
        $opcional = $request->input('opcional');
        $estudiante = Estudiante::where('id', '=', $idEstudiante)->first();
        if($contenido == "" || $autor == ""){
            $mensaje = array(
                'code'=> 400,
                'mensaje' => "¡No pueden quedar campos vacíos!"
            );
        } else{
            if($id == null){
                $agradecimiento = new SeccionAgradecimiento();
                $agradecimiento -> contenido = $contenido;
                $agradecimiento -> autor = $autor;
                $agradecimiento -> estudiante_id  = $idEstudiante;
                $agradecimiento -> opcional  = $opcional;
                $agradecimiento->save();
                $id = $agradecimiento->id;
                $this->bitacora('Se ha creado el agradecimiento de '.$estudiante->nombre.' '.$estudiante->apellido, 1, 1);
            } else{ 
                $agradecimiento = SeccionAgradecimiento::findOrFail($id);
                $agradecimiento -> contenido = $contenido;
                $agradecimiento -> autor = $autor;
                $agradecimiento -> estudiante_id  = $idEstudiante;
                $agradecimiento -> opcional  = $opcional;
                $agradecimiento->update();
                $this->bitacora('Se ha modificado el agradecimiento de '.$estudiante->nombre.' '.$estudiante->apellido, 1, 2);
            }
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "¡El agradecimiento de ".$estudiante->nombre." ".$estudiante->apellido." se guardó exitosamente!",
                'id' => $id
            );
        }
        return $mensaje;
    }

    public function saveDedicatoria(Request $request){
        $id = $request->input('id');
        $idEstudiante = $request->input('idEstudiante');
        $contenido = $request->input('contenido');
        $autor = $request->input('autor');
        $opcional = $request->input('opcional');
        $estudiante = Estudiante::where('id', '=', $idEstudiante)->first();
        if($contenido == "" || $autor == ""){
            $mensaje = array(
                'code'=> 400,
                'mensaje' => "¡No pueden quedar campos vacíos!"
            );
        } else{
            if($id == null){
                $dedicatoria = new SeccionDedicatoria();
                $dedicatoria -> contenido = $contenido;
                $dedicatoria -> autor = $autor;
                $dedicatoria -> estudiante_id  = $idEstudiante;
                $dedicatoria -> opcional  = $opcional;
                $dedicatoria->save();
                $id = $dedicatoria->id;
                $this->bitacora('Se ha creado la dedicatoria de '.$estudiante->nombre.' '.$estudiante->apellido, 2, 1);
            } else{ 
                $dedicatoria = SeccionDedicatoria::findOrFail($id);
                $dedicatoria -> contenido = $contenido;
                $dedicatoria -> autor = $autor;
                $dedicatoria -> estudiante_id  = $idEstudiante;
                $dedicatoria -> opcional  = $opcional;
                $dedicatoria->update();
                $this->bitacora('Se ha modificado la dedicatoria de '.$estudiante->nombre.' '.$estudiante->apellido, 2, 2);
            }
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "¡La dedicatoria de ".$estudiante->nombre.' '.$estudiante->apellido." se guardó exitosamente!",
                'id' => $id
            );
        }
        return $mensaje;
    }

    public function cambioEstado(Request $request)
    {
        $opcional = $request->input('opcional');
        $tipo = $request->input('tipo');
        if ($tipo == 1) {
            $agradecimiento = SeccionAgradecimiento::join('estudiante','estudiante_id', '=', 'estudiante.id')->selectRaw('*, seccion_agradecimiento.id as idAgradecimiento')->where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get('idAgradecimiento');
            foreach ($agradecimiento as $dato) {
                $agradecimiento = SeccionAgradecimiento::findOrFail($dato->idAgradecimiento);
                $agradecimiento -> opcional  = $opcional;
                $agradecimiento->update();   
            }
        } else if ($tipo == 2) {
            $dedicatoria = SeccionDedicatoria::join('estudiante','estudiante_id', '=', 'estudiante.id')->selectRaw('*, seccion_dedicatoria.id as idDedicatoria')->where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get('idDedicatoria');
            foreach ($dedicatoria as $dato) {
                $dedicatoria = SeccionDedicatoria::findOrFail($dato->idDedicatoria);
                $dedicatoria -> opcional  = $opcional;
                $dedicatoria->update();   
            }
        }

        if ($tipo == 1) {
            $mensajeTipo = "agradecimientos";
        } else{
            $mensajeTipo = "dedicatorias";
        }

        if($opcional == 1){
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "¡Cambió a estado: Es opcional! (La sección de ".$mensajeTipo." no se incluirá en el documento)"
            );
            $this->bitacora('La sección de '.$mensajeTipo.' cambió a estado: Es opcional', 1, 2);
        } else{
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "¡Cambió a estado: No es opcional! (La sección de ".$mensajeTipo." se podrá incluir en el documento)"
            );
            $this->bitacora('La sección de '.$mensajeTipo.' cambió a estado: No es opcional', 2, 2);
        }

        return $mensaje;
    }

    public function deleteDedicatoriaAgradecimiento(Request $request)
    {
        $tipo = $request->input('tipo');
        $id = $request->input('id');
        $nombre = $request->input('nombre');
        
        if ($tipo == 1) {
            $agradecimiento = SeccionAgradecimiento::findOrFail($id);
            $agradecimiento->delete();
            $agradecimientoContador =  SeccionAgradecimiento::join('estudiante','estudiante_id', '=', 'estudiante.id')->where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "Se eliminó con exito el agradecimiento de ".$nombre,
                'total' => count($agradecimientoContador)
            );
            $this->bitacora('Se ha eliminado el agradecimiento de '.$nombre, 1, 3);
        } else if($tipo == 2){
            $dedicatoria = SeccionDedicatoria::findOrFail($id);
            $dedicatoria->delete();
            $dedicatoriaContador =  SeccionDedicatoria::join('estudiante','estudiante_id', '=', 'estudiante.id')->where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "Se eliminó con exito la dedicatoria de ".$nombre,
                'total' => count($dedicatoriaContador)
            );
            $this->bitacora('Se ha eliminado la dedicatoria de '.$nombre, 1, 3);
        }
        return $mensaje;
    }

    //-------------------------------------Bitacora de cambios-----------------------------------

    public function frmBitacora(Request $request)
    {
        $bitacora = Bitacora::orderBy("fecha_modificacion", 'desc')->join('estudiante','estudiante_id', '=', 'estudiante.id')->selectRaw('*, bitacora.id as idBitacora, estudiante.id as idEstudiante')->where('grupo_trabajo_id', '=', $this->obtenerGrupo())->Where('bitacora_modificacion_id', 'like', '%'.$request->get('accion').'%')->Where('bitacora_seccion_id', 'like', '%'.$request->get('seccion').'%')->Where('estudiante_id', 'like', '%'.$request->get('miembro').'%')->with('estudiante')->with("bitacora_seccion")->with("bitacora_modificacion")->paginate(10);
        
        $bitacoraM = BitacoraModificacion::get();
        $bitacoraS = BitacoraSeccion::get();
        $integrantes = Estudiante::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
        return view('formulariosDoc.bitacora', array(
            'bitacora' => $bitacora,
            'acciones' => $bitacoraM,
            'secciones' => $bitacoraS,
            'miembros' => $integrantes,
            'accion_id' => $request->get('accion'),
            'seccion_id' => $request->get('seccion'),
            'miembro_id' => $request->get('miembro')
        ));
    }

    public function buscarInformacion(Request $request)
    {
        $id = $request->input('id');
        $bitacora = Bitacora::with('estudiante')->with("bitacora_seccion")->with("bitacora_modificacion")->where('id', '=', $id)->first();
        return $bitacora;
    }
}
