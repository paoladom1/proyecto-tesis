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
        return editor;
    }

</script>
    <div class='container agradecimientosContainer'>
        <h1 class="mt-3">Abreviatura, Nomenclatura y Sigla</h1>
        <div id="liveAlertPlaceholder"></div>
        <hr class="mb-3">
            <div class="wrapper">
                <div class="buttonWrapper2">
                    <button class="tab-button active" style="border-top-left-radius: 10px;" data-id="abreviatura" type="button">Abreviaturas</button>
                    <button class="tab-button" data-id="nomenclatura" type="button">Nomenclaturas</button>
                    <button class="tab-button" style="border-top-right-radius: 10px;" data-id="sigla" type="button">Siglas</button>
                </div>
                <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                    <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                    </symbol>
                    <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                    </symbol>
                </svg>
                <?php
                    if (isset($abreviatura[0])) {
                        $idA = $abreviatura[0]->id; 
                        $contenidoA = $abreviatura[0]->contenido;
                    } else{
                        $idA = "";
                        $contenidoA = "";
                    }

                    if (isset($nomenclatura[0])) {
                        $idN = $nomenclatura[0]->id; 
                        $contenidoN = $nomenclatura[0]->contenido;
                    } else{
                        $idN = "";
                        $contenidoN = "";
                    }

                    if (isset($sigla[0])) {
                        $idS = $sigla[0]->id; 
                        $contenidoS = $sigla[0]->contenido;
                    } else{
                        $idS = "";
                        $contenidoS = "";
                    }
                ?>
                <div class="contentWrapper" >
                    <div class="content active" id="abreviatura">
                        <div class="agradecimientosContainer2">
                            <div class="row">
                                    <input hidden type="text" name="idA"  value="{{$idA}}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col textAgradecimientos">
                                        <textarea class="form-control" id="seccionTexto1" name="seccion2[]" aria-label="With textarea" >{{$contenidoA}}</textarea>
                                        <script>
                                            agregarEditor(1);
                                        </script>
                                    </div>
                                    <!--<button type="button" class="btn btn-success saveAgradecimientos">Guardar</button>-->
                                    <input type="button" onclick="registrarAbreviatura(1)" class="btn btn-success mt-3 saveAgradecimientos" value="Guardar abreviaturas" style="background-color: #003C71;" formaction="{{ url('/user') }}" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="content" id="nomenclatura"  >
                        <div class="dedicatoriaContainer">
                            <div class="row">
                                    <input hidden type="text" name="idN" value="{{$idN}}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col textAgradecimientos">
                                        <textarea class="form-control" id="seccionTexto2" name="seccion2[]" aria-label="With textarea" >{{$contenidoN}}</textarea>
                                        <script>
                                            agregarEditor(2);
                                        </script>
                                    </div>
                                    <!--<button type="button" class="btn btn-success saveAgradecimientos">Guardar</button>-->
                                    <input type="button" onclick="registrarAbreviatura(3)" class="btn btn-success mt-3 saveAgradecimientos" value="Guardar nomenclaturas" style="background-color: #003C71;" formaction="{{ url('/user') }}" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="content" id="sigla"  >
                        <div class="dedicatoriaContainer">
                            <div class="row">
                                    <input hidden type="text" name="idS" value="{{$idS}}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col textAgradecimientos">
                                        <textarea class="form-control" id="seccionTexto3" name="seccion2[]" aria-label="With textarea" >{{$contenidoS}}</textarea>
                                        <script>
                                            agregarEditor(3);
                                        </script>
                                    </div>
                                    <!--<button type="button" class="btn btn-success saveAgradecimientos">Guardar</button>-->
                                    <input type="button" onclick="registrarAbreviatura(2)" class="btn btn-success mt-3 saveAgradecimientos" value="Guardar siglas" style="background-color: #003C71;" formaction="{{ url('/user') }}" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>

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

    <script>
        const alertPlaceholder = document.getElementById('liveAlertPlaceholder')

        const alert = (message, type, icon) => {
            const wrapper = document.createElement('div')
            var icon_f;
            if (icon == 2) {
                icon_f = `   <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>`  
            } else if(icon == 1){
                icon_f = '   <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>'
            }
            wrapper.innerHTML = 
                `<div class="alert alert-${type} d-flex align-items-center" role="alert">`+
                icon_f+
                `   <div>${message}</div>`+
                '</div>';
                alertPlaceholder.append(wrapper)
                window.setTimeout(function() {
                    $(".alert").fadeTo(500, 0).slideUp(500, function(){
                        $(this).remove(); 
                    });
                }, 2500);
        }
        
        function registrarAbreviatura(tipo) {
            var id;
            var contenido;
            if(tipo == 1){
                id = document.getElementsByName('idA')[0].value;
                contenido = CKEDITOR.instances['seccionTexto1'].getData();
            } else if(tipo == 2){
                id = document.getElementsByName('idS')[0].value;
                contenido = CKEDITOR.instances['seccionTexto3'].getData();
            } else if(tipo == 3){
                id = document.getElementsByName('idN')[0].value;
                contenido = CKEDITOR.instances['seccionTexto2'].getData();
            }
            $.ajax({
                type : "POST",
                "serverSide" : true,
                url : "./guardarAbreviatura",
                data: {"_token": "{{ csrf_token() }}", "id": id, "contenido": contenido, "tipo": tipo},
                success : function(r) {
                    if (r['code'] == 200) {
                        alert(r['mensaje'], 'success', 1);   
                    } else{
                        alert(r['mensaje'], 'danger', 2);
                    }
                },
                error : function(data) {
                    console.log(data);
                }
            })
        }
    </script>
@endsection