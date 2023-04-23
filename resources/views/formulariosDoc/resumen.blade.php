@extends('plantillas.nav')
@section('content')

<meta name="csrf-token" content="{{ csrf_token() }}">



    <div class="resumenContainer fuente-general">
        <div class="col seccion_" id="titulosApp">
            <h2>RESUMEN</h2>
        </div>
        <form action="{{ url('/guardarResumen') }}" method="post">
            {{ csrf_field() }}
            <div id="collapseTwo" aria-labelledby="headingTwo">
                <div class="accordion-body">
                    <div class="row">
                            <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                                <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                                </symbol>
                                <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                </symbol>
                            </svg>

                            <?php
                                if (isset($resumen[0])) {
                                    $idR = $resumen[0]->id; 
                                    $contenidoR = $resumen[0]->contenido;
                                } else{
                                    $idR = "";
                                    $contenidoR = "";
                                }
                            ?>
                            <input hidden type="text" name="id"  value="{{$idR}}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                        </div>
                        <div id="liveAlertPlaceholder"></div>
                        <div class="row">
                            <div class="col">
                                <textarea class="form-control" id="seccionTexto" name="contenido" aria-label="With textarea" rows=15>{{$contenidoR}}</textarea>

                                <script>
                                    window.addEventListener('load',(e) => {
                                        CKEDITOR.ClassicEditor
                                        .create( document.querySelector( '#seccionTexto' ),{
                                            plugins: ['Alignment',
                                                'Autoformat',
                                                'BlockQuote',
                                                'Bold',
                                                'Essentials',
                                                'FindAndReplace',
                                                'FontColor',
                                                'FontSize',
                                                'Heading',
                                                'Image',
                                                'ImageCaption',
                                                'ImageInsert',
                                                'ImageStyle',
                                                'ImageToolbar',
                                                'ImageUpload',
                                                'Indent',
                                                'Italic',
                                                'Link',
                                                'List',
                                                'ListProperties',
                                                'MediaEmbed',
                                                'Paragraph',
                                                'PasteFromOffice',
                                                'Table',
                                                'TableToolbar',],
                                                simpleUpload: {
                                                    // The URL that the images are uploaded to.
                                                    uploadUrl: '/upload',

                                                    // Enable the XMLHttpRequest.withCredentials property.
                                                    withCredentials: true,

                                                    // Headers sent along with the XMLHttpRequest to the upload server.
                                                    headers: {
                                                        'X-CSRF-TOKEN': 'CSRF-Token',
                                                        Authorization: 'Bearer <JSON Web Token>'
                                                    }
                                                },
                                        toolbar: {
                                            items: [
                                                'heading',
                                                '|',
                                                'bold',
                                                'italic',
                                                'link',
                                                'bulletedList',
                                                'numberedList',
                                                '|',
                                                'outdent',
                                                'indent',
                                                '|',
                                                'alignment',
                                                'imageUpload',
                                                'imageInsert',
                                                'blockQuote',
                                                'insertTable',
                                                'mediaEmbed',
                                                'undo',
                                                'redo',
                                                'findAndReplace',
                                                'fontColor',
                                                'fontSize'
                                            ]
                                        },
                                        language: 'es',
                                        image: {
                                            toolbar: [
                                                'imageTextAlternative',
                                                'toggleImageCaption',
                                                'imageStyle:inline',
                                                'imageStyle:block',
                                                'imageStyle:side'
                                            ]
                                        },
                                        table: {
                                            contentToolbar: [
                                                'tableColumn',
                                                'tableRow',
                                                'mergeTableCells'
                                            ]
                                        }
                                        } )
                                        .then(editor => {

                                            
                                           
                                            // CKEDITOR.ClassicEditor.replace('seccionTexto', {
                                            //     height: 350,
                                              
                                            //     //------ para cargar imagen a documento ---------
                                            //     filebrowserUploadUrl: "{{route('upload', ['_token' => csrf_token() ])}}",
                                            //     filebrowserUploadMethod: 'form'
                                            // });

                                            editor.config.contentsCss = "/css/content.css";
                                        })
                                        .catch( error => {
                                            console.error( error );
                                        } );
                                        
                                        
                                    });
                                  
                                </script>

                                
                            </div>
                            <button type="button" onclick="registrarResumen()" class="btn btn-success saveResumen"><i class="bi bi-save"></i> Guardar Resumen</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <div class="row justify-content-end" style="margin-top: 10px;">
        <div class="col-md-11">

            <div class="accordion" id="accordionExample2">

            <div>
        </div>
    </div>

    <script>
        var contAlert = 0;
        function registrarResumen() {
            var id = document.getElementsByName('id')[0].value;
            var contenidoR = CKEDITOR.instances['seccionTexto'].getData();
            $.ajax({
                type : "POST",
                "serverSide" : true,
                url : "./guardarResumen",
                data: {"_token": "{{ csrf_token() }}", "id": id, "contenido": contenidoR},
                success : function(r) {
                    if (r['code'] == 200) {
                        alertPersonalizado(r['mensaje'], 'success', 1, ++contAlert);   
                        document.getElementsByName('id')[0].setAttribute("value", r['id']);
                    } else{
                        alertPersonalizado(r['mensaje'], 'danger', 2, ++contAlert);
                    }
                },
                error : function(data) {
                    console.log(data);
                }
            })
        }
    </script>


@endsection







