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

class DocumentoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    //Arreglar

    public function formularioModal(){
        /*
            -1 => Significa que es una sección obligatoria parte 1.
            -2 => Significa que es una sección obligatoria parte 2.
            -3 => Significa que es una sección que no tiene datos.
            -4 => Significa que no hay capitulos ingresados.
            numeros naturales => Significa que es un capitulo y se le pasa el respectivo ID.
        */ 
        $glosario = SeccionGlosario::where('grupo_trabajo_id', '=', 1)->get();
        $resumen = SeccionResumen::where('grupo_trabajo_id', '=', 1)->get();
        $abreviatura = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', 1)->where('tipo_abreviatura_id', '=', 1)->get();
        $nomenclatura = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', 1)->where('tipo_abreviatura_id', '=', 3)->get();
        $sigla = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', 1)->where('tipo_abreviatura_id', '=', 2)->get();
        $referencia = SeccionReferencia::where('grupo_trabajo_id', '=', 1)->get();

        $cont = 0;
        $array[$cont][0] = 'Portada y Segunda Portada (Autogenerado)'; $array[$cont++][1] = '-1'; 
        $array[$cont][0] = 'Agradecimiento (seccion opcional)'; $array[$cont++][1] = '-1';;
        $array[$cont][0] = 'Dedicatoria (seccion opcional)'; $array[$cont++][1] = '-1'; ;

        if ($resumen == "[]") {
            $array[$cont][0] = 'Resumen (No tiene datos)'; $array[$cont++][1] = '-3';    
        } else{
            $array[$cont][0] = 'Resumen'; $array[$cont++][1] = '-1'; 
        }

        $array[$cont][0] = 'Indice (Autogenerado)'; $array[$cont++][1] = '-1'; 

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

        $capitulo = SeccionCapitulo::orderBy("orden_capitulo", 'asc')->get();
        $numCap = 1;

        if (count($capitulo) == 0) {
            $array[$cont][0] = 'No hay capitulos ingresados'; $array[$cont++][1] = -4;
        }

        foreach($capitulo as $cap){
            $array[$cont][0] = 'Capitulo '.$numCap++.'. '.$cap->nombre_capitulo; $array[$cont++][1] = $cap->id; 
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

        return view('plantillas.plantillaMenuC', array(
            'secciones' => $array
        ));
    }

    public function margenes(){
        return array(
            'marginLeft' => \PhpOffice\PhpWord\Shared\Converter::cmToTwip(2.5), 
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

        $phpWord->addNumberingStyle(
            'hNum',
            array('type' => 'multilevel', 'levels' => array(
                array('pStyle' => 'Heading1', 'format' => 'lowerRoman', 'text' => '%1'),
                array('pStyle' => 'Heading2', 'format' => 'lowerRoman', 'text' => '%1.%2'),
                array('pStyle' => 'Heading3', 'format' => 'lowerRoman', 'text' => '%1.%2.%3'),
                )
            )
        );

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
        $grupo_trabajo = GrupoTrabajo::where('id', '=', 1)->get();
        $estudiantes = Estudiante::where('grupo_trabajo_id', '=', 1)->orderBy("apellido", 'asc')->get();
        $carrera_id = Estudiante::where('grupo_trabajo_id', '=', 1)->groupBy("carrera_id")->get("carrera_id");
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
        $section->addText(mb_strtoupper($configuracion_sistema[0]->fecha_entrega), $estilo, 'portadaStyle');
        $section->addText("ANTIGUO CUSCATLÁN, EL SALVADOR, C.A.", $estilo, 'portadaStyle');
    }

    private function segundo($documento){
        $section = $documento->addSection(DocumentoController::margenes());
        $secretaria = Empleado::where('cargo_id', '=', 2)->first();
        $carrera_id = Estudiante::where('grupo_trabajo_id', '=', 1)->groupBy("carrera_id")->first("carrera_id");
        $DirectorCarrera = DirectorCarrera::where('carrera_id', '=', $carrera_id->carrera_id)->with("empleado")->first();
        $grupo_trabajo = GrupoTrabajo::where('id', '=', 1)->with("lector_interno")->with("asesor_interno")->with("lector_externo")->with("asesor_externo")->first();
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
                $section = $documento->addSection(array('pageNumberingStart' => 1), DocumentoController::margenes());
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
        $numSegundo = 1;
        foreach($contenido as $con){
            if ($con->orden_contenido > 0) {
                $section->addTextBreak(1);
                $section->addTitle($capitulo->orden_capitulo.'.'.$numSegundo.' '.$con->tema,2);
                $section->addTextBreak(1);
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
                    $section->addTextBreak(1);
                    \PhpOffice\PhpWord\Shared\Html::addHtml($section, $con->contenido, false, false);
                }
            }
        }
    }

    private function seccionResumen($documento, $documentoTodo){
        $resumen = SeccionResumen::where('grupo_trabajo_id', '=', 1)->get();
        if($documentoTodo == null){
            $section = $documento->addSection(DocumentoController::margenes());
        } else{
            $section = $documento->addSection(array('pageNumberingStart' => "i"), DocumentoController::margenes());
            $footer = $section->addFooter();
            $footer->addTextRun(array('alignment' => \PhpOffice\PhpWord\SimpleType\Jc::CENTER))->addField('PAGE', array('format' => 'roman'));
        }
        $section->addTitle(mb_strtoupper('Resumen'), 1);
        $section->addTextBreak(1);
        \PhpOffice\PhpWord\Shared\Html::addHtml($section, $resumen[0]->contenido, false, false);
    }

    private function seccionSiglas($documento){
        $sigla = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', 1)->where('tipo_abreviatura_id', '=', 2)->get();
        $section = $documento->addSection(DocumentoController::margenes());
        $section->addTitle(mb_strtoupper('Siglas'), 1);
        $section->addTextBreak(1);
        \PhpOffice\PhpWord\Shared\Html::addHtml($section, $sigla[0]->contenido, false, false);
    }

    private function seccionAbreviaturas($documento){
        $abreviatura = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', 1)->where('tipo_abreviatura_id', '=', 1)->get();
        $section = $documento->addSection(DocumentoController::margenes());
        $section->addTitle(mb_strtoupper('Abreviaciones'), 1);
        $section->addTextBreak(1);
        \PhpOffice\PhpWord\Shared\Html::addHtml($section, $abreviatura[0]->contenido, false, false);
    }

    private function seccionNomenclaturas($documento){
        $nomenclatura = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', 1)->where('tipo_abreviatura_id', '=', 3)->get();
        $section = $documento->addSection(DocumentoController::margenes());
        $section->addTitle(mb_strtoupper('Nomenclaturas'), 1);
        $section->addTextBreak(1);
        \PhpOffice\PhpWord\Shared\Html::addHtml($section, $nomenclatura[0]->contenido, false, false);
    }

    private function seccionGlosario($documento){
        $glosario = SeccionGlosario::where('grupo_trabajo_id', '=', 1)->get();
        $section = $documento->addSection(DocumentoController::margenes());
        $section->addTitle(mb_strtoupper('Glosario'), 1);
        $section->addTextBreak(1);
        \PhpOffice\PhpWord\Shared\Html::addHtml($section, $glosario[0]->contenido, false, false);
    }

    private function seccionReferencia($documento){
        $referencia = SeccionReferencia::where('grupo_trabajo_id', '=', 1)->get();
        $section = $documento->addSection(DocumentoController::margenes());
        $section->addTitle(mb_strtoupper('Referencias'), 1);
        $section->addTextBreak(1);
        \PhpOffice\PhpWord\Shared\Html::addHtml($section, $referencia[0]->contenido, false, false);
    }

    public function seccionesDocumento(Request $request){
        $resumen = SeccionResumen::where('grupo_trabajo_id', '=', 1)->get();
        $abreviatura = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', 1)->where('tipo_abreviatura_id', '=', 1)->get();
        $nomenclatura = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', 1)->where('tipo_abreviatura_id', '=', 3)->get();
        $sigla = SeccionAbreviaturaNomenclaturaSigla::where('grupo_trabajo_id', '=', 1)->where('tipo_abreviatura_id', '=', 2)->get();
        $referencia = SeccionReferencia::where('grupo_trabajo_id', '=', 1)->get();
        $capitulo = SeccionCapitulo::where('grupo_trabajo_id', '=', 1)->get();

        $i = 0;
        $documento = DocumentoController::crearDocumento();

        if ($resumen != "[]" and $abreviatura != "[]" and $nomenclatura != "[]" and $sigla != "[]" and $referencia != "[]" and $capitulo != "[]") {
            $documentoTodo = $request->input('seccionToda');    
        } else{
            $documentoTodo = null;
        }

        while (isset($_REQUEST['seccion'][$i])) {
            $dato = $request->input('seccion')[$i];
            if ($dato == 1) {
                DocumentoController::portada($documento);
                DocumentoController::segundo($documento);
            } else if($dato == 2){ 
                // Agradecimiento
            } else if($dato == 3){ 
                // Dedicatoria
            } else if($dato == 4){ 
                DocumentoController::seccionResumen($documento, $documentoTodo);
            } else if($dato == 5){ 
                DocumentoController::indice($documento);
            } else if($dato == 6){ 
                DocumentoController::seccionSiglas($documento);
            } else if($dato == 7){ 
                DocumentoController::seccionAbreviaturas($documento);
            } else if($dato == 8){ 
                DocumentoController::seccionNomenclaturas($documento);
            }
            ++$i;
        }
        $i = 0;
        while (isset($_REQUEST['seccion2'][$i])) {
            $dato = $request->input('seccion2')[$i];
            DocumentoController::seccion($documento, $dato, $i+1, $documentoTodo);
            ++$i;
        }
        $i = 0;
        while (isset($_REQUEST['seccion3'][$i])) {
            $dato = $request->input('seccion3')[$i];
            if ($dato == 9) {
                DocumentoController::seccionGlosario($documento);
            } else if($dato == 10){ 
                DocumentoController::seccionReferencia($documento);
            } 
            ++$i;
        }
        $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($documento, 'Word2007');
        $filename = "documentoPrueba.docx";
        $objWriter->save($filename);
    }
}
