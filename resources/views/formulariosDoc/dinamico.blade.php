<!DOCTYPE html>
<html>
<head>

    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
    .contenedorBotones button:focus{
        outline: none;
        box-shadow: none;
    }

    /*#headingTwo > .accordion-button:not(.collapsed){
        background: #44A7FF;
        color: black;
        border: 1px solid black;
    }

    #headingTwo > .accordion-button{
        background: #44A7FF;
        border: 1px solid black;
    }*/

    #headingTwo > .accordion-button{
        border: 1px dotted black;
    }

    .accordion-button::after{
        content: none;
    }
    
    .accordion-button:not(.collapsed)::before{
        background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23212529'%3e%3cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");        
        transform: rotate(-180deg);
    }
    
    .accordion-button::before{
        flex-shrink: 0;
        width: 1.25rem;
        height: 1.25rem;
        margin-right: 10px;
        content: "";
        background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23212529'%3e%3cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");
        background-repeat: no-repeat;
        background-size: 1.25rem;
        transition: transform .2s ease-in-out;
    }

    .contenedorBotones > div{        
        position: absolute;
        z-index: 10;
        font-size: 1.5em;
    }

    .btnEliminarSub{
        margin-left: -100px;
        margin-top: 10px;
    }

    .btnEliminarAgregar{
        margin-left: -250px;
        margin-top: 10px;
    }

    .contenedorBotones{
        float: right;
    }    
</style>
<script>
    var contadorGlobal = 0;   
    var contadorTema = 0; 
    var numeracionTres;
    var idTitutlo;
    var idTemaB;
    var tipo;

    function agregarEditor(id) {
        // Replace the <textarea id="editor1"> with a CKEditor 4 instance.
        // A reference to the editor object is returned by CKEDITOR.replace() allowing you to work with editor instances.
        CKEDITOR.plugins.addExternal( 'liststyle', '/js/liststyle/', 'plugin.js' );
        var editor = CKEDITOR.replace('seccionTexto'+id, {
            height: 250,
            removeButtons: 'PasteFromWord,Image,Table,Format,HorizontalRule,About,Subscript,Superscript,RemoveFormat,Source,Anchor,Blockquote,Styles',
            extraPlugins: 'liststyle'
        });

        for (var i in CKEDITOR.instances) { 
            CKEDITOR.instances[i].on('change', function() {bandera2 = 1}); 
        }

        editor.config.contentsCss = "/css/content.css";  
    }

    function ordenarTemas() {
        let elements = document.getElementsByName("numeracionCaps"); 
        var cont = 1;
        elements.forEach(element => {
            element.textContent = cont++;
        });
        let tipoTema = document.getElementsByName("seccion4[]") 
        let elements2 = document.getElementsByName("numeracionCapSub");
        let contador = 0;
        let contador2 = 0;
        tipoTema.forEach(element => {
            if(element.value == 1){
                ++contador;
            } else if(element.value == 2){
                elements2[contador2].textContent = contador;
                ++contador2;
            }
        });
    }

    function ordenarSubTemas(num) {
        let elements = document.getElementsByName("numeracionCap2"+num); 
        var cont = 1;
        elements.forEach(element => {
            element.textContent = cont++;
        });
    }

    function borrarTemaSubTema(elemento, idContenido) {
        if(tipo == 1){
            if ($("#seccion3"+elemento).val() != 0){
                eliminarTema(idContenido);
            } 
        } else if(tipo == 2){
            if ($("#seccion3"+elemento).val() != 0){
                eliminarSubTema(idContenido);
            } 
        }
        document.getElementById("part-"+elemento).remove();
        if(numeracionTres != ''){
            numsSubTitulo = $("#seccion6"+numeracionTres).val();
            $("#seccion6"+numeracionTres).val(numsSubTitulo-1);
            ordenarSubTemas(numeracionTres);
        } 
        ordenarTemas();
    }

    function temasSubTemas(a) {
        if($( "#tituloB"+a ).val() == ""){
            $( "#tituloH"+a ).text("(Sin tema)");
        } else{
            $( "#tituloH"+a ).text($( "#tituloB"+a ).val());
        }
    }

    function obtenerTemaSubTema(id, titulo, idC, numSub = '') {
        idTitutlo = id;  
        idTemaB = idC;
        tipo = $("#seccion4"+id).val();
        numeracionTres = numSub;
        if (tipo == 1) {
            $("#tituloCap").text('¿Esta seguro de eliminar el titulo "'+$('#tituloH'+id).text()+'"?');   
        } else{
            $("#tituloCap").text('¿Esta seguro de eliminar el subtitulo "'+$('#tituloH'+id).text()+'"?');
        }
    }  
    
    function addSubSeccion(num, idTituloCapitulo, titulo = '(Sin sub-tema)', descripcion = '', id = 0){
            valorSegundo = $("#span1"+num).text();
            contadorGlobal++;
            numeracionTercera = $("#seccion6"+num).val();
            fragmento = `
                        
                        <div class="accordion-item">
                            <div class="contenedorBotones">
                                <div class="btn-group btnEliminarSub" role="group" aria-label="Basic mixed styles example">                            
                                    <button type="button" onclick="obtenerTemaSubTema(${contadorGlobal}, '${titulo}', ${id}, ${num})" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-danger btn-sm" id="add_seccion()"><i class="bi bi-x-circle"></i> Eliminar</button>
                                </div>
                            </div>
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne${contadorGlobal}" aria-expanded="false" aria-controls="collapseTwo${contadorGlobal}">
                                    <span style="margin-left: 5px;"><?php echo $capitulo->orden_capitulo; ?>.<span name="numeracionCapSub">${valorSegundo}</span>.<span name="numeracionCap2${num}">${++numeracionTercera}</span></span><span style="margin-left: 5px;" id="tituloH${contadorGlobal}">${titulo}</span>                                </button>
                            </h2>
                            <div id="collapseOne${contadorGlobal}" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample2">
                                <div class="accordion-body">
                                    
                                    <div class="row">
                                            <div class="col seccion_${contadorGlobal}">
                                                <span class="input-group-text" id="basic-addon3">Titulo</span>
                                                <input type="text" name="seccion1[]" id="tituloB${contadorGlobal}" value="${titulo}" onkeyup="temasSubTemas(${contadorGlobal}); bandera2 = 1" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                            </div>
                                            <input hidden type="text" name="seccion3[]" id="seccion3${contadorGlobal}" value="${id}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                            <input hidden type="text" name="seccion4[]" id="seccion4${contadorGlobal}" value="2" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">    
                                            <input hidden type="text" name="seccion5[]" id="seccion5${contadorGlobal}" value="${idTituloCapitulo}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">    
                                            <input hidden type="text" id="seccion8" value="${num}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">    
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col seccion_${contadorGlobal}">
                                                <span class="input-group-text">Parrafo</span>
                                                <textarea class="form-control" id="seccionTexto${contadorGlobal}" name="seccion2[]" aria-label="With textarea" rows=15>${descripcion}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>`;

            $("#seccion6"+num).val(numeracionTercera);

            var div = document.createElement('div');
            div.setAttribute('id', 'part-'+contadorGlobal);
                div.innerHTML = fragmento;
                document.getElementById('accordionExample2'+num).appendChild(div);
            agregarEditor(contadorGlobal);
    }

    function addSeccion(titulo = '(Sin tema)', descripcion = '', id = 0){
            contadorGlobal++;
            contadorTema++;
            fragmento = `<br>
                        <div class="accordion-item">
                            <div class="contenedorBotones">
                                <div class="btn-group btnEliminarAgregar" role="group" aria-label="Basic mixed styles example">
                                    <button type="button" class="btn btn-primary btn-sm" id="add_seccion()" onClick="addSubSeccion(${contadorTema}, ${id}); bandera2 = 1"><i class="bi bi-plus-circle"></i> Agregar Sub-Tema</button>
                                    <button class="btn btn-danger btn-sm" type="button" onclick="obtenerTemaSubTema(${contadorGlobal}, '${titulo}', ${id}, ${contadorTema})" data-bs-toggle="modal" data-bs-target="#exampleModal" id="add_seccion()"><i class="bi bi-x-circle"></i> Eliminar</button>
                                </div>
                            </div>
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo${contadorGlobal}" aria-expanded="false" aria-controls="collapseTwo${contadorGlobal}">
                                    <span><?php echo $capitulo->orden_capitulo; ?>.<span name="numeracionCaps" id="span1${contadorTema}">${contadorTema}</span></span><span style="margin-left: 5px;" id="tituloH${contadorGlobal}">${titulo}</span>
                                </button>
                            </h2>
                            <div id="collapseTwo${contadorGlobal}" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <div class="row">
                                            <div class="col seccion_${contadorGlobal}">
                                                <span class="input-group-text" id="basic-addon3">Titulo</span>
                                                <input type="text" name="seccion1[]" id="tituloB${contadorGlobal}" value="${titulo}" onkeyup="temasSubTemas(${contadorGlobal}); bandera2 = 1" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                            </div>
                                            <input hidden type="text" name="seccion3[]" id="seccion3${contadorGlobal}" value="${id}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                            <input hidden type="text" name="seccion4[]" id="seccion4${contadorGlobal}" value="1" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                            <input hidden type="text" name="seccion6[]" id="seccion6${contadorTema}" value="0" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col seccion_${contadorGlobal}">
                                                <span class="input-group-text">Parrafo</span>
                                                <textarea class="form-control" id="seccionTexto${contadorGlobal}" name="seccion2[]" aria-label="With textarea" rows=15>${descripcion}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row justify-content-end" style="margin-top: 10px;">
                            <div class="col-md-11">
                                <div class="accordion" id="accordionExample2${contadorTema}">

                                <div>
                            </div>
                        </div>`;

            var div = document.createElement('div');
            div.setAttribute('id', 'part-'+contadorGlobal);
                div.innerHTML = fragmento;
                document.getElementById('accordionExample').appendChild(div);
            agregarEditor(contadorGlobal);
    }

    function eliminarTema(id){
        $.ajax({
            type : "POST",
            "serverSide" : true,
            url : "./eliminarTema",
            data: {"_token": "{{ csrf_token() }}", "id": id},
            success : function(r) {
                
            },
            error : function(data) {
                console.log(data);
            }
        })
    }

    function eliminarSubTema(id){
        $.ajax({
            type : "POST",
            "serverSide" : true,
            url : "./eliminarSubTema",
            data: {"_token": "{{ csrf_token() }}", "id": id},
            success : function(r) {

            },
            error : function(data) {
                console.log(data);
            }
        })
    }
    var bandera2 = 0;

    $(document).ready(function(){
        $(".accordion").sortable(
                {
                    update: function(event, ui)
                    {
                        console.log(ui.item.attr('data-id-cancion')+" en "+ui.item.index());
                        bandera2 = 1;
                        var ordenElementos = $(this).sortable("toArray"); 
                        tipo = $('#'+ordenElementos[1]+' input[name="seccion4[]"]').val();
                        if(tipo == 1){
                            ordenarTemas();
                        } else if(tipo == 2){
                            valor = $('#'+ordenElementos[1]+' #seccion8').val();
                            ordenarSubTemas(valor);
                        }
                    }
                },
                {

                handle: 'button',

                cancel: ''

                }
            );
            var exampleEl = document.getElementById('add_seccion()')
            var tooltip = new bootstrap.Tooltip(exampleEl, {
                boundary: document.body 
            })
        });

        window.onload = function () {
            var toastTrigger = document.getElementById('btnBorrar')
            var toastLiveExample = document.getElementById('liveToast')
            if (toastTrigger) {
            toastTrigger.addEventListener('click', function () {
                var toast = new bootstrap.Toast(toastLiveExample)
                    toast.show()
                })
            }
        }
        window.addEventListener('beforeunload', function (e) {
            if(bandera2 == 1){
                e.preventDefault();
                e.returnValue = '';
            }
        });
</script>
    
</head>

<body>
<div class="container">
    <br>
    <h3>Capitulo {{$capitulo->orden_capitulo}}. {{$capitulo->nombre_capitulo}}</h3>
    <br>
    @if (session('status'))
        <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
            <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
            </symbol>
        </svg>
        <div class="alert alert-success d-flex align-items-center" role="alert">
            <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
            <div>
                {{ session('status') }}
            </div>
        </div>
        <script>
            window.setTimeout(function() {
                $(".alert").fadeTo(500, 0).slideUp(500, function(){
                    $(this).remove(); 
                });
            }, 2500);
        </script>
    @endif
    <form action="{{ url('/fdinamico/guardarTemas') }}" id="formulario" method="POST">
        {{ csrf_field() }}
        <div class="accordion3" id="accordionExample34">
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    Introducción del capitulo "{{$capitulo->nombre_capitulo}}"
                </button>
                </h2>
                <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        <div class="row">
                            <input hidden type="text" name="seccion1[]" value="Introducción del capitulo" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            <input hidden type="text" name="seccion4[]" value="1" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            <?php
                                if (isset($introduccion[0])) {
                                    $idI = $introduccion[0]->id; 
                                    if ($introduccion[0]->contenido == "<p>null</p>") {
                                        $contenidoI = "";
                                    } else{
                                        $contenidoI = $introduccion[0]->contenido;
                                    }
                                } else{
                                    $idI = "";
                                    $contenidoI = "";
                                }
                            ?>
                            <input hidden type="text" name="seccion3[]" value="{{$idI}}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            <div class="col seccion_0">
                                <textarea class="form-control" id="seccionTexto0" name="seccion2[]" aria-label="With textarea" rows=10>{{$contenidoI}}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <script>
            agregarEditor(0);
        </script>
        <div class="row justify-content-start">
            <div class="">
                <button type="button" class="btn btn-success btn-sm" id="add_seccion()" onClick="addSeccion(); bandera2 = 1"> <i class="bi bi-plus-circle"></i> Agregar Tema</button>
            </div>
        </div>
        
        <!-- El id="canciones" indica que la función de JavaScript dejará aquí el resultado -->

        <div class="accordion" id="accordionExample">
            
        </div>

        <input type="text" hidden value="{{$capitulo->id}}" name="idCapitulo">

        @php
            $numSeccion = 0;
        @endphp
        @foreach ($contenido as $cont)
            <script>
                addSeccion("<?php echo $cont->tema; ?>", `<?php echo $cont->contenido; ?>`, <?php echo $cont->id; ?>);
            </script>
            @php
                ++$numSeccion;
            @endphp
            @foreach ($cont->contenidoCapitulo2 as $subtitulos)
                <script>
                    addSubSeccion(<?php echo $numSeccion; ?>, <?php echo $cont->id; ?>, "<?php echo $subtitulos->subtema; ?>", `<?php echo $subtitulos->contenido; ?>`, <?php echo $subtitulos->id; ?>);
                </script>
            @endforeach
        @endforeach
        <br>
        <input type="submit" class="btn btn-warning" value="Guardar" onclick="bandera2 = 0">
    </form>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Confirmación</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p id="tituloCap"></p>
                <p>La información referente a este será borrado</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal" id="btnBorrar" onclick="borrarTemaSubTema(idTitutlo, idTemaB);">Eliminar</button>
            </div>
            </div>
        </div>
    </div>
    
    <br>
</div>

<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
  <div id="liveToast" class="toast align-items-center text-white bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="d-flex">
        <div class="toast-body">
            Se elimino de forma exitosa!
        </div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
  </div>
</div>

</body>
</html>