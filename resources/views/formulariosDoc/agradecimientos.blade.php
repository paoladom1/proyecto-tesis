@extends('plantillas.nav')
@section('content')
<script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>
<script>

function agregarEditor(n) {
        // Replace the <textarea id="editor1"> with a CKEditor 4 instance.
        // A reference to the editor object is returned by CKEDITOR.replace() allowing you to work with editor instances.
        CKEDITOR.plugins.addExternal( 'liststyle', '/js/liststyle/', 'plugin.js' );
        var editor = CKEDITOR.replace('seccionTexto'+n, {
            height: 275,
            removeButtons: 'PasteFromWord,Image,Table,Format,HorizontalRule,About,Subscript,Superscript,RemoveFormat,Source,Anchor,Blockquote,Styles',
            extraPlugins: 'liststyle'
        });

        editor.config.contentsCss = "/css/content.css";
    }


</script>
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
                                    <textarea class="form-control" id="seccionTexto1" name="seccion2[]" aria-label="With textarea" ></textarea>
                                    <script>
                                        agregarEditor(1);
                                    </script>
                                </div>
                                <!--<button type="button" class="btn btn-success saveAgradecimientos">Guardar</button>-->
                                <input type="submit" class="btn btn-success mt-3 saveAgradecimientos" value="Guardar agradecimientos" style="background-color: #003C71;" formaction="{{ url('/user') }}" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content" id="dedicatoria"  >
                    <div class="dedicatoriaContainer">
                        <div class="row">
                                <div class="col seccion_">
                                    <h1 class="mb-3 mt-3">Dedicatoria</h1>
                                </div>
                                <hr>
                                <input hidden type="text" name="seccion3[]"  value="$" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                <input hidden type="text" name="seccion4[]"  value="1" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                <input hidden type="text" name="seccion6[]"  value="0" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <br>
                            <div class="row">
                                <div class="col textAgradecimientos">
                                    <textarea class="form-control" id="seccionTexto2" name="seccion2[]" aria-label="With textarea" ></textarea>
                                    <script>
                                        agregarEditor(2);
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
