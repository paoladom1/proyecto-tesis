@extends('plantillas.nav')
@section('content')
<script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>
<script>

function agregarEditor() {
        // Replace the <textarea id="editor1"> with a CKEditor 4 instance.
        // A reference to the editor object is returned by CKEDITOR.replace() allowing you to work with editor instances.
        CKEDITOR.plugins.addExternal( 'liststyle', '/js/liststyle/', 'plugin.js' );
        var editor = CKEDITOR.replace('seccionTexto', {
            height: 250,
            removeButtons: 'PasteFromWord,Image,Table,Format,HorizontalRule,About,Subscript,Superscript,RemoveFormat,Source,Anchor,Blockquote,Styles',
            extraPlugins: 'liststyle'
        });

        editor.config.contentsCss = "/css/content.css";
    }

</script>
    <div class="agradecimientosContainer">
        <div id="collapseTwo" aria-labelledby="headingTwo">
            <div class="accordion-body">
                <div class="row">
                        <div class="col seccion_">
                            <h1 class="mb-3 mt-3">Glosario</h1>
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
    </div>

    <div class="row justify-content-end" style="margin-top: 10px;">
        <div class="col-md-11">
            <div class="accordion" id="accordionExample2">

            <div>
        </div>
    </div>
@endsection
