@extends('plantillas.nav')
@section('content')
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

    num = 0;

    function addSeccion(nombreIntegrante, id = '', idE = '', contenido = '', numIntegrante, firma, contenedor, tipo){
            var etiqueta = '';
            if (tipo == 1) {
                etiqueta = 'Agradecimiento de';
            } else if(tipo == 2){
                etiqueta = 'Dedicatoria de';
            }
            var desabilitar = "";
            if (id == "") {
                desabilitar = "disabled";
            }
            fragmento = `<br>
                        <div class="accordion-item">
                            <div class="contenedorBotones">
                                <div class="btn-group btnEliminarAgregar" role="group" aria-label="Basic mixed styles example">
                                    <button type="button" class="btn btn-success btn-sm" id="add_seccion()" onClick="guardarDA('${tipo}', '${numIntegrante}')"><i class="bi bi-save"></i> Guardar</button>
                                    <button ${desabilitar} type="button" class="btn btn-danger btn-sm" id="btnEliminarDA${numIntegrante}" onClick="abrirModal('${tipo}', '${numIntegrante}')"><i class="bi bi-x-circle"></i> Eliminar</button>
                                </div>
                            </div>
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo${numIntegrante}" aria-expanded="false" aria-controls="collapseTwo${numIntegrante}">
                                    <span>${etiqueta} <span id="spanNombreI${numIntegrante}">${nombreIntegrante}</span></span>
                                </button>
                            </h2>
                            <div id="collapseTwo${numIntegrante}" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <div class="row">
                                            <div class="col">
                                                <label>Firma del estudiante</label>
                                                <input type="text" id="firma${numIntegrante}" value="${firma}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                            </div>
                                            <input hidden type="text" id="idDA${numIntegrante}" value="${id}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                            <input hidden type="text" id="idEstudiante${numIntegrante}" value="${idE}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
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
                document.getElementById(contenedor).appendChild(div);
            agregarEditor(numIntegrante);
    }

</script>
<style>
    .contenedorBotones button:focus{
        outline: none;
        box-shadow: none;
    }

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
        margin-left: -235px;
        margin-top: 10px;
    }

    .contenedorBotones{
        float: right;
    }    
</style>
<div class='container agradecimientosContainer'>
    <div class="col seccion_" id="titulosApp">
        <h2>AGRADECIMIENTOS Y DEDICATORIA</h2>
    </div>
    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
        </symbol>
        <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
        </symbol>
    </svg>
    <form class="col mt-3 mb-4"  action="{{ url('/crear') }}" method='POST' id="formAgradecimientos">
        {{ csrf_field() }}
        <div id="liveAlertPlaceholder"></div>
        <div class="wrapper">
            <div class="buttonWrapper">
                <button class="tab-button active" style="border-top-left-radius: 10px;" data-id="agradecimientos" type="button">Agradecimientos</button>
                <button class="tab-button" style="border-top-right-radius: 10px;" data-id="dedicatoria" type="button">Dedicatoria</button>
            </div>
            <div class="contentWrapper" >
                <div class="content active" id="agradecimientos">
                    <br>
                    <div class="row">
                        <div class="col">
                            <div class="form-check form-switch form-check-reverse">
                                <input class="form-check-input" value="1" name="opcional" type="checkbox" id="opcional1" onclick="cambioEstado(1)" {{$desabilitarAgradecimiento}} {{$agradecimientoEstado}}>
                                <label class="form-check-label" for="flexSwitchCheckReverse">Opcional</label>
                            </div>
                        </div>
                    </div>
                    <div class="agradecimientosContainer2">
                        <div class="accordion" id="accordionExample">
                            @foreach ($agradecimiento as $integrante)
                                <script>
                                    addSeccion("<?php echo $integrante->nombre.' '.$integrante->apellido; ?>",'<?php echo $integrante->idAgradecimiento; ?>', '<?php echo $integrante->idEstudiante; ?>', `<?php echo $integrante->contenido?>`, ++num, '<?php 
                                    if (!$integrante->autor) {
                                        echo $integrante->nombre.' '.$integrante->apellido;
                                    } else{
                                        echo $integrante->autor;
                                    } ?>', 'accordionExample', '1');
                                </script>
                            @endforeach
                        </div>  
                    </div>
                </div>
            </div>
                <div class="content" id="dedicatoria">
                    <br>
                    <div class="row">
                        <div class="col">
                            <div class="form-check form-switch form-check-reverse">
                                <input class="form-check-input" value="1" name="opcional" type="checkbox" id="opcional2" onclick="cambioEstado(2)" {{$desabilitarDedicatoria}} {{$dedicatoriaEstado}}>
                                <label class="form-check-label" for="flexSwitchCheckReverse">Opcional</label>
                            </div>
                        </div>
                    </div>
                    <div class="dedicatoriaContainer">
                        <div class="row">
                                <input hidden type="text" name="seccion3[]"  value="$" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                <input hidden type="text" name="seccion4[]"  value="1" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                <input hidden type="text" name="seccion6[]"  value="0" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div class="row">
                                <div class="accordion" id="accordionExample2">
                                    @foreach ($dedicatoria as $integrante)
                                        <script>
                                            addSeccion("<?php echo $integrante->nombre.' '.$integrante->apellido; ?>", '<?php echo $integrante->idDedicatoria; ?>', '<?php echo $integrante->idEstudiante; ?>', `<?php echo $integrante->contenido?>`, ++num, '<?php 
                                            if (!$integrante->autor) {
                                                echo $integrante->nombre.' '.$integrante->apellido;
                                            } else{
                                                echo $integrante->autor;
                                            } ?>', 'accordionExample2', 2);
                                        </script>
                                    @endforeach
                                </div>  
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

    <!-- Modal -->
    <div class="modal fade" id="modal-profile" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #003C71; border-bottom: solid #E87B2A 8px;">
                    <h5 class="modal-title" style="color: white; font-size: 1.75em;" id="exampleModalLongTitle">Eliminar <span id="tipoEliTi"></span></h5> <!-- cambiar esta parte-->
                    <button type="button" class="btn-close btn-close-white" style="width: 1em;" data-dismiss="modal" aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">
                    <input hidden type="text" id="idModal">
                    <input hidden type="text" id="idEtiquetaModal">
                    <p>¿Desea eliminar <span id="tipoEli"></span> de <span id="nombreIE"></span>?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-danger" onclick="eliminarDA()" data-dismiss="modal">Aceptar</button>
                </div>
            </div>
        </div>
    </div>

<script>    
    var contAlert = 0; 
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

    function guardarDA(tipo, idEtiqueta) {
        var id = document.getElementById('idDA'+idEtiqueta).value; 
        var idE = document.getElementById('idEstudiante'+idEtiqueta).value;
        var autor = document.getElementById('firma'+idEtiqueta).value;
        var contenido = CKEDITOR.instances['contenido'+idEtiqueta].getData();
        var tipoURL = "";
        var opcional = 0;
        
        if (tipo == 1) {
            tipoURL = "./guardarAgradecimiento";
            if ($('#opcional1').is(':checked') ) {
                opcional = 1;
            }
        } else if(tipo == 2){
            tipoURL = "./guardarDedicatoria";
            if ($('#opcional2').is(':checked') ) {
                opcional = 1;
            }
        }

        $.ajax({
            type : "POST",
            "serverSide" : true,
            url : tipoURL,
            data: {"_token": "{{ csrf_token() }}", "id": id, "idEstudiante": idE, "contenido": contenido, "autor": autor, "opcional": opcional},
            success : function(r) {
                if (r['code'] == 200) {
                    alertPersonalizado(r['mensaje'], 'success', 1, ++contAlert);   
                    document.getElementById('idDA'+idEtiqueta).setAttribute("value", r['id']);
                    document.getElementById('btnEliminarDA'+idEtiqueta).disabled = false;
                    if (tipo == 1) {
                        document.getElementById('opcional1').disabled = false;
                    } else if (tipo == 2) {
                        document.getElementById('opcional2').disabled = false;
                    }
                } else{
                    alertPersonalizado(r['mensaje'], 'danger', 2, ++contAlert);
                }
            },
            error : function(data) {
                console.log(data);
            }
        })
    }
    var myModal = new bootstrap.Modal(document.getElementById('modal-profile'), {
        keyboard: false
    });
    
    function abrirModal(tipo, idEtiqueta) {
        var tipoNombre = "";
        var tipoNombreTi = "";
        if (tipo == 1) {
            tipoNombre = "el agradecimiento";
            tipoNombreTi = "agradecimiento";
        } else{
            tipoNombre = "la dedicatroria";
            tipoNombreTi = "dedicatoria";
        }
        var nombreIntegrante = document.getElementById('spanNombreI'+idEtiqueta).innerText;
        document.getElementById("nombreIE").innerText = nombreIntegrante;
        document.getElementById("tipoEli").innerText = tipoNombre;
        document.getElementById("tipoEliTi").innerText = tipoNombreTi;
        document.getElementById("idModal").value = tipo;
        document.getElementById("idEtiquetaModal").value = idEtiqueta;
        myModal.show();
    }

    // Agregar la ventana modal para eliminación.
    function eliminarDA() {
        tipo = document.getElementById('idModal').value;
        idEtiqueta = document.getElementById('idEtiquetaModal').value;
        var id = document.getElementById('idDA'+idEtiqueta).value; 
        var nombreIntegrante = document.getElementById('spanNombreI'+idEtiqueta).innerText;
        $.ajax({
            type : "POST",
            "serverSide" : true,
            url : './eliminarDedicatoriaAgradecimiento',
            data: {"_token": "{{ csrf_token() }}", "id": id, "tipo": tipo, "nombre": nombreIntegrante},
            success : function(r) {
                if (r['code'] == 200) {
                    alertPersonalizado(r['mensaje'], 'success', 1, ++contAlert);   
                    document.getElementById('idDA'+idEtiqueta).setAttribute("value", '');
                    document.getElementById('btnEliminarDA'+idEtiqueta).disabled = true;
                    CKEDITOR.instances['contenido'+idEtiqueta].setData("");
                    document.getElementById('firma'+idEtiqueta).value = nombreIntegrante;
                    if (tipo == 1) {
                        if (r['total'] == 0)  {
                            document.getElementById('opcional1').disabled = true; 
                            document.getElementById('opcional1').checked = false;   
                        }
                    } else if (tipo == 2) {
                        if (r['total'] == 0)  {
                            document.getElementById('opcional2').disabled = true;
                            document.getElementById('opcional2').checked = false;
                        }
                    }
                } else{
                    alertPersonalizado(r['mensaje'], 'danger', 2, ++contAlert);
                }
            },
            error : function(data) {
                console.log(data);
            }
        })
    }

    function cambioEstado(tipo) {
        var opcional = 0;

        if (tipo == 1) {
            if ($('#opcional1').is(':checked') ) {
                opcional = 1;
            }
        } else if (tipo == 2) {
            if ($('#opcional2').is(':checked') ) {
                opcional = 1;
            }
        }

        $.ajax({
            type : "POST",
            "serverSide" : true,
            url : "./cambiarEstado",
            data: {"_token": "{{ csrf_token() }}", "opcional": opcional, "tipo": tipo},
            success : function(r) {
                if (r['code'] == 200) {
                    alertPersonalizado(r['mensaje'], 'success', 1, ++contAlert);   
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
