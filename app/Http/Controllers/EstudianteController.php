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

class EstudianteController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function obtenerGrupo(){
        $grupo = auth()->guard('admin')->user()->id;
        $estudiante = Estudiante::where('usuario_id', '=', $grupo)->first();
        return $estudiante->grupo_trabajo_id;
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
        $capitulo->delete();
    }

    //-----------------------------------Agregar temas y subtemas de capitulos-------------------------------------------

    public function formularioDinamico($id){ 
        // Validar que el contenido que se pueda ver corresponda al equipo
        $capitulo = SeccionCapitulo::with('contenidoSeccionCapitulo')->where('grupo_trabajo_id', '=', $this->obtenerGrupo())->findOrFail($id);

        $contenido = ContenidoSeccionCapitulo::with('contenidoCapitulo2')->orderBy("orden_contenido", 'asc')->where('seccion_capitulo_id', '=', $id)->where('orden_contenido', '>',0)->get();
        $contenido_introduccion = ContenidoSeccionCapitulo::with('contenidoCapitulo2')->where('seccion_capitulo_id', '=', $id)->where('orden_contenido', '=',0)->get();
        return view('formulariosDoc.dinamico', array(
            "capitulo" => $capitulo,
            "contenido" => $contenido,
            "introduccion" => $contenido_introduccion
        ));
    }

    public function crearDinamico(Request $request){
        $id = $request->input('idCapitulo');
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
        return redirect('fdinamico/'.$id)->with('status', 'Se guardo exitosamente!');
    }

    public function eliminarContenido(Request $request)
    {
        $id = $request->input('id');
        $contenido = ContenidoSeccionCapitulo::findOrFail($id);
        $contenido->delete();
    }

    public function eliminarContenido2(Request $request)
    {
        $id = $request->input('id');
        $contenido = SubcontenidoSeccionCapitulo::findOrFail($id);
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
                'mensaje' => "No pueden quedar campos vacios!"
            );
        } else{
            if($id == null){
                $resumen = new SeccionResumen();
                $resumen -> contenido = $contenido;
                $resumen -> grupo_trabajo_id = $this->obtenerGrupo();
                $resumen->save();
                $id = $resumen->id;
            } else{
                $resumen = SeccionResumen::findOrFail($id);
                $resumen -> contenido = $contenido;
                $resumen -> grupo_trabajo_id = $this->obtenerGrupo();
                $resumen->update();
            }
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "Se guardo exitosamente!",
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
                'mensaje' => "No pueden quedar campos vacios!"
            );
        } else{
            if($id == null){
                $referencia = new SeccionReferencia();
                $referencia -> contenido = $contenido;
                $referencia -> grupo_trabajo_id = $this->obtenerGrupo();
                $referencia->save();
                $id = $referencia->id;
            } else{
                $referencia = SeccionReferencia::findOrFail($id);
                $referencia -> contenido = $contenido;
                $referencia -> grupo_trabajo_id = $this->obtenerGrupo();
                $referencia->update();
            }
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "Se guardo exitosamente!",
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
                'mensaje' => "No pueden quedar campos vacios!"
            );
        } else{
            if($id == null){
                $glosario = new SeccionGlosario();
                $glosario -> contenido = $contenido;
                $glosario -> grupo_trabajo_id = $this->obtenerGrupo();
                $glosario -> opcional = $opcional;
                $glosario->save();
                $id = $glosario->id;
            } else{
                $glosario = SeccionGlosario::findOrFail($id);
                $glosario -> contenido = $contenido;
                $glosario -> grupo_trabajo_id = $this->obtenerGrupo();
                $glosario -> opcional = $opcional;
                $glosario->update();
            }
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "Se guardo exitosamente!",
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
                'mensaje' => "Cambio a estado: Es opcional"
            );
        } else{
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "Cambio a estado: No es opcional"
            );
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
                'mensaje' => "No pueden quedar campos vacios!"
            );
        } else{
            if($id == null){
                $abreviatura = new SeccionAbreviaturaNomenclaturaSigla();
                $abreviatura -> contenido = $contenido;
                $abreviatura -> grupo_trabajo_id = $this->obtenerGrupo();
                $abreviatura -> tipo_abreviatura_id  = $tipo;
                $abreviatura->save();
                $id = $abreviatura->id;
            } else{
                $abreviatura = SeccionAbreviaturaNomenclaturaSigla::findOrFail($id);
                $abreviatura -> contenido = $contenido;
                $abreviatura -> grupo_trabajo_id = $this->obtenerGrupo();
                $abreviatura -> tipo_abreviatura_id  = $tipo;
                $abreviatura->update();
            }
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "Se guardo exitosamente!",
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
        if($contenido == "" || $autor == ""){
            $mensaje = array(
                'code'=> 400,
                'mensaje' => "No pueden quedar campos vacios!"
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
            } else{ 
                $agradecimiento = SeccionAgradecimiento::findOrFail($id);
                $agradecimiento -> contenido = $contenido;
                $agradecimiento -> autor = $autor;
                $agradecimiento -> estudiante_id  = $idEstudiante;
                $agradecimiento -> opcional  = $opcional;
                $agradecimiento->update();
            }
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "Se guardo exitosamente!",
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
        if($contenido == "" || $autor == ""){
            $mensaje = array(
                'code'=> 400,
                'mensaje' => "No pueden quedar campos vacios!"
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
            } else{ 
                $dedicatoria = SeccionDedicatoria::findOrFail($id);
                $dedicatoria -> contenido = $contenido;
                $dedicatoria -> autor = $autor;
                $dedicatoria -> estudiante_id  = $idEstudiante;
                $dedicatoria -> opcional  = $opcional;
                $dedicatoria->update();
            }
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "Se guardo exitosamente!",
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

        if($opcional == 1){
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "Cambio a estado: Es opcional"
            );
        } else{
            $mensaje = array(
                'code'=> 200,
                'mensaje' => "Cambio a estado: No es opcional"
            );
        }

        return $mensaje;
    }
}
