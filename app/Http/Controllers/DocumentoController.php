<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use PhpOffice\PhpWord\Style\Language;
use PhpOffice\PhpWord\Style\TOC;
use PhpOffice\PhpWord\TemplateProcessor;

use App\Models\GrupoTrabajo;
use App\Models\Estudiante;
use App\Models\DirectorCarrera;
use App\Models\Empleado;
use App\Models\Carrera;
use App\Models\ConfiguracionSistema;
use App\Models\SeccionResumen;
use App\Models\SeccionAbreviaturaNomenclaturaSigla;
use App\Models\SeccionCapitulo;
use App\Models\SeccionGlosario;
use App\Models\SeccionReferencia;
use App\Models\ContenidoSeccionCapitulo;
use App\Models\SubcontenidoSeccionCapitulo;
use App\Models\SeccionAgradecimiento;
use App\Models\SeccionDedicatoria;
use App\Models\Bitacora;
use App\Models\BitacoraSeccion;
use App\Models\BitacoraModificacion;

class DocumentoController extends Controller
{
    public function __construct()
    {
        $this->middleware('estudiante');
    }

    public function obtenerGrupo(){
        $grupo = auth()->guard('admin')->user()->id;
        $estudiante = Estudiante::where('usuario_id', '=', $grupo)->first();
        return $estudiante->grupo_trabajo_id;
    }

    public function obtenerGrupoTema(){
        $grupo = auth()->guard('admin')->user()->id;
        $estudiante = Estudiante::where('usuario_id', '=', $grupo)->first();
        $grupoTema = GrupoTrabajo::where('id', '=', $this->obtenerGrupo())->first();
        $nombre = "DOCUMENTO_GRADUACION_CICLO_".$grupoTema->ciclo_inicio.'_'.$grupoTema->anio_inicio;
        return $nombre;
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

    public function formularioModal(){
        // -----------------------------------------Creación de documento-----------------------------------------

        /*
            -1 => Significa que es una sección obligatoria parte 1.
            -2 => Significa que es una sección obligatoria parte 2.
            -3 => Significa que es una sección que no tiene datos.
            -4 => Significa que no hay capitulos ingresados.
            numeros naturales => Significa que es un capitulo y se le pasa el respectivo ID.
        */ 

        $glosario = SeccionGlosario::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
        $resumen = SeccionResumen::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
        $abreviatura = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->where('tipo_abreviatura_id', '=', 1)->get();
        $nomenclatura = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->where('tipo_abreviatura_id', '=', 3)->get();
        $sigla = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->where('tipo_abreviatura_id', '=', 2)->get();
        $referencia = SeccionReferencia::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
        $dedicatoriaEstado =  SeccionDedicatoria::join('estudiante','estudiante_id', '=', 'estudiante.id')->where('grupo_trabajo_id', '=', $this->obtenerGrupo())->groupBy("opcional")->first("opcional");
        $agradecimientoEstado =  SeccionAgradecimiento::join('estudiante','estudiante_id', '=', 'estudiante.id')->where('grupo_trabajo_id', '=', $this->obtenerGrupo())->groupBy("opcional")->first("opcional");
        $tema_graduacion = GrupoTrabajo::where('id', '=', $this->obtenerGrupo())->first();

        $cont = 0;
        $array[$cont][0] = 'Portada y Segunda Portada (Autogenerado)'; $array[$cont++][1] = '-1'; 

        if ($dedicatoriaEstado != null) {
            if ($dedicatoriaEstado->opcional == 0) {
                $array[$cont][0] = 'Dedicatoria (seccion opcional)'; $array[$cont++][1] = '-1';
            } else if ($dedicatoriaEstado->opcional == 1) {
                $array[$cont][0] = 'Dedicatoria (seccion opcional)'; $array[$cont++][1] = '-3';
            }
        } else{
            $array[$cont][0] = 'Dedicatoria (No tiene datos)'; $array[$cont++][1] = '-3'; 
        }

        if ($agradecimientoEstado != null) {
            if ($agradecimientoEstado->opcional == 0) {
                $array[$cont][0] = 'Agradecimiento (seccion opcional)'; $array[$cont++][1] = '-1';
            } else if ($agradecimientoEstado->opcional == 1) {
                $array[$cont][0] = 'Agradecimiento (seccion opcional)'; $array[$cont++][1] = '-3';
            }
        } else{
            $array[$cont][0] = 'Agradecimiento (No tiene datos)'; $array[$cont++][1] = '-3';
        }

        if ($resumen == "[]") {
            $array[$cont][0] = 'Resumen (No tiene datos)'; $array[$cont++][1] = '-3';    
        } else{
            $array[$cont][0] = 'Resumen'; $array[$cont++][1] = '-1'; 
        }

        $array[$cont][0] = 'Índice (Autogenerado)'; $array[$cont++][1] = '-1'; 

        if ($sigla == "[]") {
            $array[$cont][0] = 'Siglas (No tiene datos)'; $array[$cont++][1] = '-3'; 
        } else{
            $array[$cont][0] = 'Siglas'; $array[$cont++][1] = '-1'; 
        }

        if ($abreviatura == "[]") {
            $array[$cont][0] = 'Abreviaciones (No tiene datos)'; $array[$cont++][1] = '-3';     
        } else{
            $array[$cont][0] = 'Abreviaciones'; $array[$cont++][1] = '-1';
        }

        if ($nomenclatura == "[]") {
            $array[$cont][0] = 'Nomenclaturas (No tiene datos)'; $array[$cont++][1] = '-3';   
        } else{
            $array[$cont][0] = 'Nomenclaturas'; $array[$cont++][1] = '-1';
        }

        $capitulo = SeccionCapitulo::orderBy("orden_capitulo", 'asc')->where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
        $numCap = 1;

        if (count($capitulo) == 0) {
            $array[$cont][0] = 'No hay capítulos ingresados'; $array[$cont++][1] = -4;
        }

        foreach($capitulo as $cap){
            $array[$cont][0] = 'Capítulo '.$numCap++.'. '.$cap->nombre_capitulo; $array[$cont++][1] = $cap->id; 
        }

        if ($glosario == "[]") {
            $array[$cont][0] = 'Glosario (No tiene datos)'; $array[$cont++][1] = '-3';    
        } else{
            if ($glosario[0]->opcional == 0) {
                $array[$cont][0] = 'Glosario (seccion opcional)'; $array[$cont++][1] = '-2';;
            } else{
                $array[$cont][0] = 'Glosario (seccion opcional)'; $array[$cont++][1] = '-3'; 
            }
        }

        if ($referencia == "[]") {
            $array[$cont][0] = 'Referencias (No tiene datos)'; $array[$cont++][1] = '-3'; 
        } else{
            $array[$cont][0] = 'Referencias'; $array[$cont++][1] = '-2'; 
        }

        // -----------------------------------------Bitacora-----------------------------------------

        $bitacora = Bitacora::with('estudiante')->with("bitacora_seccion")->with("bitacora_modificacion")->paginate(10);

        return view('plantillas.plantillaMenuC', array(
            'secciones' => $array, 
            'tema' => mb_strtoupper($tema_graduacion->tema),
            'bitacora' => $bitacora
        ));
    }

    public function margenes(){
        return array(
            'marginLeft' => \PhpOffice\PhpWord\Shared\Converter::cmToTwip(3.5), 
            'marginRight' => \PhpOffice\PhpWord\Shared\Converter::cmToTwip(2.5),
            'marginTop' => \PhpOffice\PhpWord\Shared\Converter::cmToTwip(2.5), 
            'marginBottom' => \PhpOffice\PhpWord\Shared\Converter::cmToTwip(2.5)
        );
    }

    private function crearDocumento(){
        $phpWord = new \PhpOffice\PhpWord\PhpWord();
        $phpWord->setDefaultParagraphStyle(array(
            'spaceAfter' => \PhpOffice\PhpWord\Shared\Converter::pointToTwip(0), 
            'spacing' => 0,
            'lineHeight' => 1.5, 
            'alignment' => \PhpOffice\PhpWord\SimpleType\Jc::BOTH
        ));

        $phpWord->setDefaultFontSize(11);
        $phpWord->setDefaultFontName('Times New Roman');
        $phpWord->getSettings()->setUpdateFields(true);
        $center = array(
            'align' => 'center'
        );
        
        $fuenteTitulo = [
            "name" => "Times New Roman",
            "size" => 11,
            "bold" => true
        ];

        $fuenteTitulo2 = [
            "name" => "Times New Roman",
            "bold" => true,

        ];
        $phpWord->addTitleStyle(1, $fuenteTitulo, $center);
        $phpWord->addTitleStyle(2, $fuenteTitulo2);
        $phpWord->addTitleStyle(3, $fuenteTitulo2);
        // Estilo de parrafo
        $phpWord->addParagraphStyle('portadaStyle', $center);
        $phpWord->getCompatibility()->setOoxmlVersion(15);
        $phpWord->getSettings()->setMirrorMargins(true);
        $phpWord->getSettings()->setThemeFontLang(new Language("ES-SV"));
        return $phpWord;
    }

    private function portada($documento){
        $grupo_trabajo = GrupoTrabajo::where('id', '=', $this->obtenerGrupo())->get();
        $estudiantes = Estudiante::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->orderBy("apellido", 'asc')->get();
        $carrera_id = Estudiante::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->groupBy("carrera_id")->get("carrera_id");
        $carrera = Carrera::where('id', '=', $carrera_id[0]->carrera_id)->with("facultad")->get();
        $configuracion_sistema = ConfiguracionSistema::get();
        $numeroIntegrantes = $configuracion_sistema[0]->numero_integrantes;
        
        $section = $documento->addSection(DocumentoController::margenes());
        $estilo = array(
            "name" => "Times New Roman",
            "size" => 14,
        );

        $section->addText("UNIVERSIDAD CENTROAMERICANA", $estilo, 'portadaStyle');
        $section->addText("JOSÉ SIMEÓN CAÑAS", $estilo, 'portadaStyle');
        $section->addTextBreak(1);
        $section->addImage("logo-uca.png", [
            "width" => 65,
            "heigth" => 65,
            'align' => 'center'
        ]);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addText(mb_strtoupper($grupo_trabajo[0]->tema), $estilo, 'portadaStyle');
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addText("TRABAJO DE GRADUACIÓN PREPARADO PARA LA", $estilo, 'portadaStyle');
        $section->addText(mb_strtoupper($carrera[0]->facultad->nombre_facultad), $estilo, 'portadaStyle');
        $section->addTextBreak(1); 
        $section->addTextBreak(1);
        $section->addText("PARA OPTAR AL GRADO DE", $estilo, 'portadaStyle');
        $section->addText(mb_strtoupper($carrera[0]->grado), $estilo, 'portadaStyle');
        $section->addTextBreak(1);
        $section->addText("POR", $estilo, 'portadaStyle');

        $contIntegrantes = 0;
        foreach ($estudiantes as $integrante) {
            ++$contIntegrantes;
            $section->addText(mb_strtoupper($integrante->apellido).', '.mb_strtoupper($integrante->nombre), $estilo, 'portadaStyle');
        }
        if ($contIntegrantes != $numeroIntegrantes) {
            $diferencia = $numeroIntegrantes - $contIntegrantes;
            $section->addTextBreak($diferencia);
        }

        $section->addTextBreak(1);
        if ($grupo_trabajo[0]->prorroga == 0) {
            $section->addText(mb_strtoupper($configuracion_sistema[0]->fecha_entrega), $estilo, 'portadaStyle');   
        } else if($grupo_trabajo[0]->prorroga == 1){
            $section->addText(mb_strtoupper($configuracion_sistema[0]->fecha_prorroga), $estilo, 'portadaStyle');
        }
        $section->addText("ANTIGUO CUSCATLÁN, EL SALVADOR, C.A.", $estilo, 'portadaStyle');
    }

    private function segundo($documento){
        $section = $documento->addSection(DocumentoController::margenes());
        $secretaria = Empleado::where('cargo_id', '=', 2)->first();
        $carrera_id = Estudiante::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->groupBy("carrera_id")->first("carrera_id");
        $DirectorCarrera = DirectorCarrera::where('carrera_id', '=', $carrera_id->carrera_id)->with("empleado")->first();
        $grupo_trabajo = GrupoTrabajo::where('id', '=', $this->obtenerGrupo())->with("lector_interno")->with("asesor_interno")->with("lector_externo")->with("asesor_externo")->first();
        $carrera = Carrera::where('id', '=', $carrera_id->carrera_id)->with("facultad")->first();
        $decano = Empleado::join('departamento_unidad','departamento_unidad_id', '=', 'departamento_unidad.id')->where('cargo_id', '=', 1)->where('facultad_id', '=', $carrera->facultad->id)->first();
        $rector = Empleado::where('cargo_id', '=', 5)->first();

        if($grupo_trabajo->lector_interno == null and $grupo_trabajo->lector_externo == null){
            $lector = "Sin asignar";
        } else if($grupo_trabajo->lector_interno == null){
            $lector = mb_strtoupper($grupo_trabajo->lector_externo->nombre).' '.mb_strtoupper($grupo_trabajo->lector_externo->apellido);
        } else{
            $lector = mb_strtoupper($grupo_trabajo->lector_interno->nombre).' '.mb_strtoupper($grupo_trabajo->lector_interno->apellido);
        }

        if($grupo_trabajo->asesor_interno == null and $grupo_trabajo->asesor_externo == null){
            $asesor = "Sin asignar";
        } else if($grupo_trabajo->asesor_interno == null){
            $asesor = mb_strtoupper($grupo_trabajo->asesor_externo->nombre).' '.mb_strtoupper($grupo_trabajo->asesor_externo->apellido);
        } else{
            $asesor = mb_strtoupper($grupo_trabajo->asesor_interno->nombre).' '.mb_strtoupper($grupo_trabajo->asesor_interno->apellido);
        }

        $estilo = array(
            "name" => "Times New Roman",
            "size" => 14,
        );

        $section->addText("RECTOR", $estilo, 'portadaStyle');
        $section->addText(mb_strtoupper($rector->nombre).' '.mb_strtoupper($rector->apellido), $estilo, 'portadaStyle');
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addText("SECRETARIA GENERAL", $estilo, 'portadaStyle');
        $section->addText(mb_strtoupper($secretaria->nombre).' '.mb_strtoupper($secretaria->apellido), $estilo, 'portadaStyle');
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addText("DECANO DE LA FACULTAD DE INGENIERÍA Y ARQUITECTURA", $estilo, 'portadaStyle');
        $section->addText(mb_strtoupper($decano->nombre).' '.mb_strtoupper($decano->apellido), $estilo, 'portadaStyle');
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addText("DIRECTOR DE LA CARRERA DE INGENIERÍA INFORMÁTICA", $estilo, 'portadaStyle');
        $section->addText(mb_strtoupper($DirectorCarrera->empleado->nombre).' '.mb_strtoupper($DirectorCarrera->empleado->apellido), $estilo, 'portadaStyle');
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addText("DIRECTOR DEL TRABAJO", $estilo, 'portadaStyle');
        $section->addText($asesor, $estilo, 'portadaStyle');
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addText("LECTOR", $estilo, 'portadaStyle');
        $section->addText($lector, $estilo, 'portadaStyle');
    }

    private function indice($documento){
        $section = $documento->addSection(DocumentoController::margenes());
        $section->addTitle(mb_strtoupper('Indice'), 1);
        $section->addTextBreak(1);
        $fuenteTablaContenidos = [
            "name" => "Times New Roman ",
            "size" => 11,
        ];
        
        $section->addTOC($fuenteTablaContenidos);
    }

    private function seccion($documento, $numero, $numCap, $documentoTodo){
        if($numCap == 1){
            if($documentoTodo == null){
                $section = $documento->addSection(DocumentoController::margenes());
            } else{
                $section = $documento->addSection(array('pageNumberingStart' => 1, 
                'marginLeft' => \PhpOffice\PhpWord\Shared\Converter::cmToTwip(3.5), 
                'marginRight' => \PhpOffice\PhpWord\Shared\Converter::cmToTwip(2.5),
                'marginTop' => \PhpOffice\PhpWord\Shared\Converter::cmToTwip(2.5), 
                'marginBottom' => \PhpOffice\PhpWord\Shared\Converter::cmToTwip(2.5)));
                $footer = $section->addFooter();
                $footer->addTextRun(array('alignment' => \PhpOffice\PhpWord\SimpleType\Jc::CENTER))->addField('PAGE');
            }
        } else{
            $section = $documento->addSection(DocumentoController::margenes());
        }

        $capitulo = SeccionCapitulo::findOrFail($numero);
        //$contenido = ContenidoCapitulo::orderBy("orden_contenido", 'asc')->where('id_capitulo', $capitulo->id)->get();
        $contenido = ContenidoSeccionCapitulo::with('contenidoCapitulo2')->orderBy("orden_contenido", 'asc')->where('seccion_capitulo_id', '=', $numero)->get();
        
        $section->addTitle(mb_strtoupper('Capitulo '.$capitulo->orden_capitulo.'. '.$capitulo->nombre_capitulo), 1);
        $section->addTextBreak(1);
        $numSegundo = 1;
        foreach($contenido as $con){
            if ($con->orden_contenido > 0) {
                $section->addTitle($capitulo->orden_capitulo.'.'.$numSegundo.' '.$con->tema,2);
                if ($con->contenido != null) {
                    $section->addTextBreak(1);
                }
                \PhpOffice\PhpWord\Shared\Html::addHtml($section, $con->contenido, false, false);
                $section->addTextBreak(1);
                $numTercero = 1;
                foreach($con->contenidoCapitulo2 as $con2){
                    $section->addTitle($capitulo->orden_capitulo.'.'.$numSegundo.'.'.$numTercero++.' '.$con2->subtema,3);
                    $section->addTextBreak(1);
                    \PhpOffice\PhpWord\Shared\Html::addHtml($section, $con2->contenido, false, false);
                    $section->addTextBreak(1);
                }
                ++$numSegundo;   
            } else{
                if ($con->contenido != "<p>null</p>") {
                    \PhpOffice\PhpWord\Shared\Html::addHtml($section, $con->contenido, false, false);
                    $section->addTextBreak(1);
                }
            }
        }
        return 'Capitulo '.$capitulo->orden_capitulo.'. '.$capitulo->nombre_capitulo;
    }

    private function seccionResumen($documento, $documentoTodo){
        $resumen = SeccionResumen::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
        if($documentoTodo == null){
            $section = $documento->addSection(DocumentoController::margenes());
        } else{
            $section = $documento->addSection(array('pageNumberingStart' => 1, 
                                                'marginLeft' => \PhpOffice\PhpWord\Shared\Converter::cmToTwip(3.5), 
                                                'marginRight' => \PhpOffice\PhpWord\Shared\Converter::cmToTwip(2.5),
                                                'marginTop' => \PhpOffice\PhpWord\Shared\Converter::cmToTwip(2.5), 
                                                'marginBottom' => \PhpOffice\PhpWord\Shared\Converter::cmToTwip(2.5)));
            $footer = $section->addFooter();
            $footer->addTextRun(array('alignment' => \PhpOffice\PhpWord\SimpleType\Jc::CENTER))->addField('PAGE', array('format' => 'roman'));
        }
        $section->addTitle(mb_strtoupper('Resumen'), 1);
        $section->addTextBreak(1);
        \PhpOffice\PhpWord\Shared\Html::addHtml($section, $resumen[0]->contenido, false, false);
    }

    public function upload(Request $request){
        if($request->hasFile('upload')) {
            //get filename with extension
            $filenamewithextension = $request->file('upload')->getClientOriginalName();
   
            //get filename without extension
            $filename = pathinfo($filenamewithextension, PATHINFO_FILENAME);
   
            //get file extension
            $extension = $request->file('upload')->getClientOriginalExtension();
   
            //filename to store
            $filenametostore = $filename.'_'.time().'.'.$extension;
   
            //Upload File
            $request->file('upload')->storeAs('public/uploads', $filenametostore);
 
            $CKEditorFuncNum = $request->input('CKEditorFuncNum');
            $url = asset('storage/app/public/uploads/'.$filenametostore); 
            $msg = 'Image successfully uploaded'; 
            $re = "<script>window.parent.CKEDITOR.tools.callFunction($CKEditorFuncNum, '$url', '$msg')</script>";
          
            // Render HTML output 
            @header('Content-type: text/html; charset=utf-8'); 
            echo $re;
        }
    }

    private function seccionSiglas($documento){
        $sigla = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->where('tipo_abreviatura_id', '=', 2)->get();
        $section = $documento->addSection(DocumentoController::margenes());
        $section->addTitle(mb_strtoupper('Siglas'), 1);
        $section->addTextBreak(1);
        \PhpOffice\PhpWord\Shared\Html::addHtml($section, $sigla[0]->contenido, false, false);
    }

    private function seccionAbreviaturas($documento){
        $abreviatura = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->where('tipo_abreviatura_id', '=', 1)->get();
        $section = $documento->addSection(DocumentoController::margenes());
        $section->addTitle(mb_strtoupper('Abreviaciones'), 1);
        $section->addTextBreak(1);
        \PhpOffice\PhpWord\Shared\Html::addHtml($section, $abreviatura[0]->contenido, false, false);
    }

    private function seccionNomenclaturas($documento){
        $nomenclatura = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->where('tipo_abreviatura_id', '=', 3)->get();
        $section = $documento->addSection(DocumentoController::margenes());
        $section->addTitle(mb_strtoupper('Nomenclaturas'), 1);
        $section->addTextBreak(1);
        \PhpOffice\PhpWord\Shared\Html::addHtml($section, $nomenclatura[0]->contenido, false, false);
    }

    private function seccionGlosario($documento){
        $glosario = SeccionGlosario::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
        $section = $documento->addSection(DocumentoController::margenes());
        $section->addTitle(mb_strtoupper('Glosario'), 1);
        $section->addTextBreak(1);
        \PhpOffice\PhpWord\Shared\Html::addHtml($section, $glosario[0]->contenido, false, false);
    }

    private function seccionReferencia($documento){
        $referencia = SeccionReferencia::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
        $section = $documento->addSection(DocumentoController::margenes());
        $section->addTitle(mb_strtoupper('Referencias'), 1);
        $section->addTextBreak(1);
        \PhpOffice\PhpWord\Shared\Html::addHtml($section, $referencia[0]->contenido, false, false);
    }

    private function seccionAgradecimiento($documento){
        $agradecimiento = SeccionAgradecimiento::join('estudiante','estudiante_id', '=', 'estudiante.id')->where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
        $section = $documento->addSection(DocumentoController::margenes());

        foreach ($agradecimiento as $dato) {
            \PhpOffice\PhpWord\Shared\Html::addHtml($section, $dato->contenido, false, false);
            $section->addTextBreak(1);
            $estiloTexto = $section->addTextRun([
                "name" => "Times New Roman",
                "size" => 11,
                'alignment' => \PhpOffice\PhpWord\SimpleType\Jc::RIGHT
            ]);
            $estiloTexto->addText($dato->autor);
            $section->addPageBreak(1);
        }
    }

    private function seccionDedicatoria($documento){
        $dedicatoria = SeccionDedicatoria::join('estudiante','estudiante_id', '=', 'estudiante.id')->where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
        $section = $documento->addSection(DocumentoController::margenes());

        foreach ($dedicatoria as $dato) {
            \PhpOffice\PhpWord\Shared\Html::addHtml($section, $dato->contenido, false, false);
            $section->addTextBreak(1);
            $estiloTexto = $section->addTextRun([
                "name" => "Times New Roman",
                "size" => 11,
                'alignment' => \PhpOffice\PhpWord\SimpleType\Jc::RIGHT
            ]);
            $estiloTexto->addText($dato->autor);
            $section->addPageBreak(1);
        }
    }

    public function seccionesDocumento(Request $request){
        $resumen = SeccionResumen::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
        $abreviatura = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->where('tipo_abreviatura_id', '=', 1)->get();
        $nomenclatura = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->where('tipo_abreviatura_id', '=', 3)->get();
        $sigla = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->where('tipo_abreviatura_id', '=', 2)->get();
        $referencia = SeccionReferencia::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
        $capitulo = SeccionCapitulo::where('grupo_trabajo_id', '=', $this->obtenerGrupo())->get();
        $seccionesCrear = "";
        $banderaSeccion = 0;
        $i = 0;
        $documento = DocumentoController::crearDocumento();

        if ($resumen != "[]" and $abreviatura != "[]" and $nomenclatura != "[]" and $sigla != "[]" and $referencia != "[]" and $capitulo != "[]") {
            $documentoTodo = $request->input('seccionToda');    
        } else{
            $documentoTodo = null;
        }

        while (isset($_REQUEST['seccion'][$i])) {
            $dato = $request->input('seccion')[$i];
            if ($dato == -1) {
                DocumentoController::portada($documento);
                DocumentoController::segundo($documento);
                $seccionesCrear = $seccionesCrear.'- Portada y Segunda Portada\\n';
            } else if($dato == -2){ 
                DocumentoController::seccionDedicatoria($documento);
                $seccionesCrear = $seccionesCrear.'- Dedicatoria\\n';
            } else if($dato == -3){ 
                DocumentoController::seccionAgradecimiento($documento);
                $seccionesCrear = $seccionesCrear.'- Agradecimiento\\n';
            } else if($dato == -4){ 
                DocumentoController::seccionResumen($documento, $documentoTodo);
                $seccionesCrear = $seccionesCrear.'- Resumen\\n';
            } else if($dato == -5){ 
                DocumentoController::indice($documento);
                $seccionesCrear = $seccionesCrear.'- Índice\\n';
            } else if($dato == -6){ 
                DocumentoController::seccionSiglas($documento);
                $seccionesCrear = $seccionesCrear.'- Siglas\\n';
            } else if($dato == -7){ 
                DocumentoController::seccionAbreviaturas($documento);
                $seccionesCrear = $seccionesCrear.'- Abreviaciones\\n';
            } else if($dato == -8){ 
                DocumentoController::seccionNomenclaturas($documento);
                $seccionesCrear = $seccionesCrear.'- Nomenclaturas\\n';
            }
            ++$i;
        }
        $i = 0;
        while (isset($_REQUEST['seccion2'][$i])) {
            $dato = $request->input('seccion2')[$i];
            $seccionesCrear = $seccionesCrear.'- '.DocumentoController::seccion($documento, $dato, $i+1, $documentoTodo).'\\n';
            ++$i;
        }
        $i = 0;
        while (isset($_REQUEST['seccion3'][$i])) {
            $dato = $request->input('seccion3')[$i];
            if ($dato == -9) {
                DocumentoController::seccionGlosario($documento);
                $seccionesCrear = $seccionesCrear.'- Glosario\\n';
            } else if($dato == -10){ 
                DocumentoController::seccionReferencia($documento);
                $seccionesCrear = $seccionesCrear.'- Referencias';
                $banderaSeccion = 1;
            } 
            ++$i;
        }
        if ($banderaSeccion == 0) {
            $seccionesCrear = rtrim($seccionesCrear, "\\n");
        }
        $seccionesCrear = 'Las secciones creadas fueron:\\n\\n'.$seccionesCrear;
        $this->bitacora($seccionesCrear, 10, 4);
        \PhpOffice\PhpWord\Settings::setOutputEscapingEnabled(true);
        \PhpOffice\PhpWord\Settings::setCompatibility(false);
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment;filename="'.$this->obtenerGrupoTema().'.docx"');
        $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($documento, 'Word2007');
        $objWriter->save('php://output');
    }
}
