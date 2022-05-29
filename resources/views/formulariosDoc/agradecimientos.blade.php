@extends('plantillas.nav')
@section('content')
<script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>
<script>

function agregarEditor(n) {
        // Replace the <textarea id="editor1"> with a CKEditor 4 instance.
        // A reference to the editor object is returned by CKEDITOR.replace() allowing you to work with editor instances.
        CKEDITOR.plugins.addExternal( 'liststyle', '/js/liststyle/', 'plugin.js' );
        var editor = CKEDITOR.replace('contenido'+n, {
            height: 275,
            removeButtons: 'PasteFromWord,Image,Table,Format,HorizontalRule,About,Subscript,Superscript,RemoveFormat,Source,Anchor,Blockquote,Styles',
            extraPlugins: 'liststyle'
        });

        editor.config.contentsCss = "/css/content.css";
    }
    function addSeccion(id = 0, contenido = '', numIntegrante){
            fragmento = `<br>
                        <div class="accordion-item">
                            <div class="contenedorBotones">
                                <div class="btn-group btnEliminarAgregar" role="group" aria-label="Basic mixed styles example">
                                    <button type="button" class="btn btn-success btn-sm" id="add_seccion()" onClick=""><i class="bi bi-plus-circle"></i> Guardar</button>
                                </div>
                            </div>
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo${numIntegrante}" aria-expanded="false" aria-controls="collapseTwo${numIntegrante}">
                                    <span>Eduardo Alberto López Torres</span>
                                </button>
                            </h2>
                            <div id="collapseTwo${numIntegrante}" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <div class="row">
                                            <div class="col">
                                                <label>Estudiante</label>
                                                <input disabled type="text" id="nombreEstudiante${numIntegrante}" value="Eduardo Alberto López Torres" onkeyup="temasSubTemas(${numIntegrante}); bandera2 = 1" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                            </div>
                                            <div class="col">
                                                <label>Firma del estudiante</label>
                                                <input type="text" id="firma${numIntegrante}" value="Eduardo López" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                            </div>
                                            <input hidden type="text" id="idI${numIntegrante}" value="${id}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                            <input hidden type="text" id="seccionAD${numIntegrante}" value="1" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col">
                                                <label>Contenido</label>
                                                <textarea class="form-control" id="contenido${numIntegrante}" name="seccion2[]" aria-label="With textarea" rows=15>${contenido}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>`;

            var div = document.createElement('div');
            div.setAttribute('id', 'part-'+numIntegrante);
                div.innerHTML = fragmento;
                document.getElementById('accordionExample').appendChild(div);
            agregarEditor(numIntegrante);
    }

</script>
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
        margin-left: -130px;
        margin-top: 10px;
    }

    .contenedorBotones{
        float: right;
    }    
</style>
<div class='container agradecimientosContainer'>
    <h1 class="mt-3">Agradecimientos y dedicatoria</h1>
    <hr class="mb-3">
    <form class="col mt-3 mb-4"  action="{{ url('/crear') }}" method='POST'>
        {{ csrf_field() }}
        <div class="wrapper">
            <div class="buttonWrapper">
                <button class="tab-button active" style="border-top-left-radius: 10px;" data-id="agradecimientos" type="button">Agradecimientos</button>
                <button class="tab-button" style="border-top-right-radius: 10px;" data-id="dedicatoria" type="button">Dedicatoria</button>
            </div>
            <div class="contentWrapper" >
                <div class="content active" id="agradecimientos">
                    <div class="agradecimientosContainer2">
                        <div class="accordion" id="accordionExample">
                            <script>
                                addSeccion(1, `Hola`, 1);
                            </script>
                        </div>  
                    </div>
                </div>
            </div>
                <div class="content" id="dedicatoria"  >
                    <div class="dedicatoriaContainer">
                        <div class="row">
                                <input hidden type="text" name="seccion3[]"  value="$" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                <input hidden type="text" name="seccion4[]"  value="1" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                <input hidden type="text" name="seccion6[]"  value="0" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <br>
                            <div class="row">
                                <div class="col textAgradecimientos">
                                    <textarea class="form-control" id="seccionTexto2" name="seccion2[]" aria-label="With textarea" ></textarea>
                                    <script>
                                        //agregarEditor(2);
                                    </script>
                                </div>
                                <!--<button type="button" class="btn btn-success saveAgradecimientos">Guardar</button>-->
                                <input type="submit" class="btn btn-success mt-3 saveAgradecimientos" value="Guardar dedicatoria" style="background-color: #003C71;" formaction="{{ url('/user') }}" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>




    {{--  <div class="agradecimientosContainer">
        <div id="collapseTwo" aria-labelledby="headingTwo">
            <div class="accordion-body">
                <div class="row">
                        <div class="col seccion_">
                            <h1 class="mb-3 mt-3">Agradecimientos</h1>
                        </div>
                        <hr>
                        <input hidden type="text" name="seccion3[]"  value="$" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                        <input hidden type="text" name="seccion4[]"  value="1" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                        <input hidden type="text" name="seccion6[]"  value="0" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                    </div>
                    <br>
                    <div class="row">
                        <div class="col textAgradecimientos">
                            <textarea class="form-control" id="seccionTexto" name="seccion2[]" aria-label="With textarea" ></textarea>
                            <script>
                                agregarEditor();
                            </script>
                        </div>
                        <button type="button" class="btn btn-success saveAgradecimientos">Guardar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>--}}

<script>    
    const tabs = document.querySelector(".wrapper");
    const tabButton = document.querySelectorAll(".tab-button");
    const contents = document.querySelectorAll(".content");

    tabs.onclick = e => {
    const id = e.target.dataset.id;
    if (id) {
        tabButton.forEach(btn => {
        btn.classList.remove("active");
        });
        e.target.classList.add("active");

        contents.forEach(content => {
        content.classList.remove("active");
        });
        const element = document.getElementById(id);
        element.classList.add("active");
    }
    }
</script>

@endsection
