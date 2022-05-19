<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use PhpOffice\PhpWord\Style\Language;
use PhpOffice\PhpWord\Style\TOC;
use PhpOffice\PhpWord\TemplateProcessor;

use App\Models\SeccionCapitulo;
use App\Models\ContenidoSeccionCapitulo;
use App\Models\SubcontenidoSeccionCapitulo;

class PruebasController extends Controller
{
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

    //------------------------------------------Creación de documento------------------------------------------

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
        $section = $documento->addSection(PruebasController::margenes());

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
        $section = $documento->addSection(PruebasController::margenes());

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
        $section = $documento->addSection(array('pageNumberingStart' => 1), PruebasController::margenes());
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
        if($numCap == 1){
            $section = $documento->addSection(array('pageNumberingStart' => 1), PruebasController::margenes());
            $footer = $section->addFooter();
            $footer->addTextRun(array('alignment' => \PhpOffice\PhpWord\SimpleType\Jc::CENTER))->addField('PAGE', array('format'=>'roman'), array('PreserveFormat'));
        } else{
            $section = $documento->addSection(PruebasController::margenes());
        }

        $capitulo = SeccionCapitulo::findOrFail($numero);
        //$contenido = ContenidoCapitulo::orderBy("orden_contenido", 'asc')->where('id_capitulo', $capitulo->id)->get();
        $contenido = ContenidoSeccionCapitulo::with('contenidoCapitulo2')->orderBy("orden_contenido", 'asc')->where('seccion_capitulo_id', '=', $numero)->get();
        
        $section->addTitle(mb_strtoupper('Capitulo '.$capitulo->orden_capitulo.'. '.$capitulo->nombre_capitulo), 1);
        $numSegundo = 1;
        foreach($contenido as $con){
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
        }
        $section->addTextBreak(1);
    }

    public function seccionesDocumento(Request $request){
        $i = 0;
        $documento = PruebasController::crearDocumento();
        while (isset($_REQUEST['seccion'][$i])) {
            $dato = $request->input('seccion')[$i];
            if ($dato == 1) {
                PruebasController::portada($documento);
                PruebasController::segundo($documento);
            } else if($dato == 2){
                PruebasController::indice($documento);
            }
            ++$i;
        }
        $i = 0;
        while (isset($_REQUEST['seccion2'][$i])) {
            $dato = $request->input('seccion2')[$i];
            PruebasController::seccion($documento, $dato, $i+1);
            ++$i;
        }
        $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($documento, 'Word2007');
        $filename = "documentoPrueba.docx";
        $objWriter->save($filename);
    }

    //-----------------------------------Agregar temas y subtemas de capitulos-------------------------------------------

    public function formularioDinamico($id){ 
        $capitulo = SeccionCapitulo::with('contenidoSeccionCapitulo')->findOrFail($id);

        $contenido = ContenidoSeccionCapitulo::with('contenidoCapitulo2')->orderBy("orden_contenido", 'asc')->where('seccion_capitulo_id', '=', $id)->get();
        return view('formulariosDoc.dinamico', array(
            "capitulo" => $capitulo,
            "contenido" => $contenido
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
                echo $request->input('seccion5')[$i2]."<br>";
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
                $contenidoCapitulo->contenido = $request->input('seccion2')[$i];
                $contenidoCapitulo->orden_contenido = $i+1;
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

    //-------------------------------------Creación de capitulos-----------------------------------
    
    public function formCapitulos()
    {
        $capitulo = SeccionCapitulo::orderBy("orden_capitulo", 'asc')->get();
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
}
