<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use PhpOffice\PhpWord\Style\Language;
use PhpOffice\PhpWord\Style\TOC;
use PhpOffice\PhpWord\TemplateProcessor;

use App\Models\SeccionCapitulo;
use App\Models\ContenidoSeccionCapitulo;
use App\Models\SubcontenidoSeccionCapitulo;

class DocumentoController extends Controller
{
    public function formularioModal(){
        /*
            -1 => Significa que es una sección obligatoria.
            -2 => Significa que es una sección opcional.
            numeros naturales => Significa que es un capitulo y se le pasa el respectivo ID.
        */ 
        $cont = 0;
        $array[$cont][0] = 'Portada y Segunda Portada'; $array[$cont++][1] = '-1'; 
        $array[$cont][0] = 'Indice'; $array[$cont++][1] = '-1'; 

        $capitulo = SeccionCapitulo::orderBy("orden_capitulo", 'asc')->get();
        $numCap = 1;
        
        foreach($capitulo as $cap){
            $array[$cont][0] = 'Capitulo '.$numCap++.'. '.$cap->nombre_capitulo; $array[$cont++][1] = $cap->id; 
        }
        $array[$cont][0] = 'Referencias'; $array[$cont++][1] = '-1'; 
        $array[$cont][0] = 'Anexos'; $array[$cont++][1] = '-1'; 
        //return view('formulariosDoc.secciones', array(
        //    'secciones' => $array
        //));

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
        $section->addText("DESARROLLO DE APLICACIÓN PARA FACILITAR LA ESCRITURA DE LOS TRABAJOS DE GRADUACIÓN PARA LOS ESTUDIANTES EGRESADOS DE LA FACULTAD DE INGENIERÍA Y ARQUITECTURA DE LA UNIVERSIDAD CENTROAMERICANA JOSÉ SIMEÓN CAÑAS", $estilo, 'portadaStyle');
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addText("TRABAJO DE GRADUACIÓN PREPARADO PARA", $estilo, 'portadaStyle');
        $section->addText("LA FACULTAD DE INGENIERÍA Y ARQUITECTURA", $estilo, 'portadaStyle');
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addText("PARA OPTAR AL GRADO DE", $estilo, 'portadaStyle');
        $section->addText("INGENIERIO INFORMÁTICO", $estilo, 'portadaStyle');
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addText("POR", $estilo, 'portadaStyle');
        $section->addText("LÓPEZ TORRES, EDUARDO ALBERTO", $estilo, 'portadaStyle');
        $section->addText("SHARP REYES, JOSHUA STEVEN", $estilo, 'portadaStyle');
        $section->addText("SIGÜENZA ARGUETA, RUBEN ALEXANDER", $estilo, 'portadaStyle');
        $section->addText("", $estilo, 'portadaStyle');
        $section->addTextBreak(1);
        $section->addText("JULIO 2022", $estilo, 'portadaStyle');
        $section->addText("ANTIGUO CUSCATLÁN, EL SALVADOR, C.A.", $estilo, 'portadaStyle');
    }

    private function segundo($documento){
        $section = $documento->addSection(DocumentoController::margenes());

        $estilo = array(
            "name" => "Times New Roman",
            "size" => 14,
        );

        $section->addText("RECTOR", $estilo, 'portadaStyle');
        $section->addText("ANDREU OLIVA, S.J.", $estilo, 'portadaStyle');
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addText("SECRETARIA GENERAL", $estilo, 'portadaStyle');
        $section->addText("SILVIA ELINOR AZUCENA DE FERNÁNDEZ", $estilo, 'portadaStyle');
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addText("DECANO DE LA FACULTAD DE INGENIERÍA Y ARQUITECTURA", $estilo, 'portadaStyle');
        $section->addText("CARLOS GONZALO CAÑAS", $estilo, 'portadaStyle');
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addText("DIRECTOR DE LA CARRERA DE INGENIERÍA INFORMÁTICA", $estilo, 'portadaStyle');
        $section->addText("JOSE ENMANUEL AMAYA ARAUJO", $estilo, 'portadaStyle');
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addText("DIRECTOR DEL TRABAJO", $estilo, 'portadaStyle');
        $section->addText("ELISA CRISTINA ALDANA CALDERON", $estilo, 'portadaStyle');
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addTextBreak(1);
        $section->addText("LECTOR", $estilo, 'portadaStyle');
        $section->addText("JOSE ENMANUEL AMAYA ARAUJO", $estilo, 'portadaStyle');
    }

    private function indice($documento){
        $section = $documento->addSection(array('pageNumberingStart' => 1), DocumentoController::margenes());
        $section->addText("Índice");
        $fuenteTablaContenidos = [
            "name" => "Times New Roman ",
            "size" => 11,
        ];
        
        $section->addTOC($fuenteTablaContenidos);
        $footer = $section->addFooter();
        $footer->addTextRun(array('alignment' => \PhpOffice\PhpWord\SimpleType\Jc::CENTER))->addField('PAGE', array('format' => 'roman'));
    }

    private function seccion($documento, $numero, $numCap){
        //$seccion->addPageBreak(); -> salto de pagina
        if($numCap == 1){
            $section = $documento->addSection(array('pageNumberingStart' => 1), DocumentoController::margenes());
            $footer = $section->addFooter();
            $footer->addTextRun(array('alignment' => \PhpOffice\PhpWord\SimpleType\Jc::CENTER))->addField('PAGE', array('format'=>'roman'), array('PreserveFormat'));
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
        $section->addTextBreak(1);
    }

    public function seccionesDocumento(Request $request){
        $i = 0;
        $documento = DocumentoController::crearDocumento();
        while (isset($_REQUEST['seccion'][$i])) {
            $dato = $request->input('seccion')[$i];
            if ($dato == 1) {
                DocumentoController::portada($documento);
                DocumentoController::segundo($documento);
            } else if($dato == 2){
                DocumentoController::indice($documento);
            }
            ++$i;
        }
        $i = 0;
        while (isset($_REQUEST['seccion2'][$i])) {
            $dato = $request->input('seccion2')[$i];
            DocumentoController::seccion($documento, $dato, $i+1);
            ++$i;
        }
        $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($documento, 'Word2007');
        $filename = "documentoPrueba.docx";
        $objWriter->save($filename);
    }
}
