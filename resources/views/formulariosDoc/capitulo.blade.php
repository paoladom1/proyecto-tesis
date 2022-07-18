@extends('plantillas.nav')
@section('content')

<script>
    var contAlert = 0;
    function modificarCapitulo(i, posicion) {
        let elements = document.getElementById("tituloN"+posicion);
        let elements2 = document.getElementById("idCapitulos"+posicion);
        document.getElementById('nombreCap').value = elements.textContent;
        document.getElementById('idCap').value = elements2.textContent;
        var boton = document.getElementById('btnTitulo');
        boton.textContent = "Modificar Capitulo";
        $('#btnQuitar').show();
    }

    function ordenarCapitulos() {
        let elements = document.getElementsByName("numeracion"); // numCapitulo
        let elements2 = document.getElementsByName("numCapitulo");
        i = 1;
        elements.forEach(element => {
            elements2[i-1].textContent = "Capitulo "+i+". ";
            element.textContent = i++;
        });
    }

    function quitarModificar() {
        idCap = document.getElementById('idCap');
        nombreCap = document.getElementById('nombreCap');
        nombreCap.value = "";
        idCap.value = "";
        var boton = document.getElementById('btnTitulo');
        boton.textContent = "Agregar Capitulo";
        $('#btnQuitar').hide();
    }

    var a = 0;

    function eliminarCapitulo(position, idCapi, eliminacion = 0){
        a = 0;
        document.getElementById("part-"+position).remove();
        ordenarCapitulos();
        eliminarCapituloBD(idCapi);
        modificarOrden();
    }

    function guardarOrdenCapitulo() {
        $('#guardarOrden').hide();
    }

    var idT;
    var idC;
    function obtenerNombreCapitulo(id, titulo, id2) {
        idT = id;  
        idC = id2;
        $("#tituloCap").text('¿Está seguro de eliminar el capítulo "'+titulo+'"?');
    }

    function seccion(nombreC, idC) {
        var id = document.getElementById('idCap').value;
        ++a;
        var nombre = document.getElementById('nombreCap');
        fragmento = `
                        <td class="align-middle" style="cursor: grab; text-align: center; width: 10%;"><i class="bi bi-list"></i></td>
                        <td scope="row" style="display:none;" class="align-middle" name="numeracion" id="num${a}">${a} </td><span name="idCap" id="idCapitulos${a}" style="display:none">${idC}</span>
                        <td class="align-middle" style="width: 45%;" name="titulacion"><span name="numCapitulo">Capítulo ${a}.</span> <span id="tituloN${a}">${nombreC}</span></td> 
                        <td style="width: 45%;">
                            <div class="btn-group" role="group" aria-label="Basic example">
                                <button type="button" onclick="window.location.href='/contenidoCapitulo/${idC}'" class="btn btn-primary">Modificar contenido</button>
                                <button type="button" onclick="modificarCapitulo(document.getElementById('num${a}').textContent, ${a})" class="btn btn-warning" style="color: white;">Modificar título</button>
                                <button type="button" onclick="obtenerNombreCapitulo(${a}, '${nombreC}', ${idC})" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-danger">Eliminar capítulo</button>
                            </div>
                        </td>
                    `;
        var div = document.createElement('tr');
        div.innerHTML = fragmento;
        div.setAttribute('id', 'part-'+a);
        document.getElementById('tablaCapitulo').appendChild(div);
        nombreCap.value = "";
    }

    $(document).ready(function(){
        $("tbody").sortable(
            {
                update: function(event, ui)
                {
                    ordenarCapitulos();
                    modificarOrden();
                    alertPersonalizado("¡Se cambió el orden con éxito!", 'success', 1, ++contAlert);
                }
            }
        );
    });

    function guardarCapitulo(id) {
        let nombre = $('#nombreCap').val();
        if(id == ""){
            if (nombre.trim() == "") {
                alertPersonalizado("¡No puede quedar el campo vacío!", 'danger', 2, ++contAlert);
            } else{
                $.ajax({
                    type : "POST",
                    "serverSide" : true,
                    url : "./insertarCapitulo",
                    data: {"_token": "{{ csrf_token() }}", "nombreTitulo": nombre, "orden_capitulo": a+1},
                    success : function(r) {
                        a = 0;
                        $('#tablaCapitulo').empty();
                        r.forEach(element => {
                            seccion(element["nombre_capitulo"], element["id"]);
                        });
                        if (document.querySelectorAll("tbody tr").length > 1) {
                            document.getElementById("mensajeNoHay").style.display = "none";
                        } 
                    },
                    error : function(data) {
                        console.log(data);
                    }
                })
                alertPersonalizado("¡Se guardó el capítulo con exito!", 'success', 1, ++contAlert);
            }
        } else{
            if (nombre.trim() == "") {
                alertPersonalizado("¡No puede quedar el campo vacío!", 'danger', 2, ++contAlert);
            } else{
                quitarModificar();
                $.ajax({
                    type : "POST",
                    "serverSide" : true,
                    url : "./modificar",
                    data: {"_token": "{{ csrf_token() }}", "id": id, "nombre": nombre},
                    success : function(r) {
                        a = 0;
                        $('#tablaCapitulo').empty();
                        r.forEach(element => {
                            seccion(element["nombre_capitulo"], element["id"]);
                        });
                    },
                    error : function(data) {
                        console.log(data);
                    }
                })
                alertPersonalizado("¡Se modificó el capítulo con exito!", 'success', 1, ++contAlert);
            }
        }
    }

    function modificarOrden() {
        let ids = document.getElementsByName("idCap"); //idCapitulos
        var arrayText = new Array();

        for(var i = 0; i < ids.length; i++){
            arrayText[i] = ids[i].textContent
        }

        $.ajax({
            type : "POST",
            "serverSide" : true,
            url : "./modificar",
            data: {"_token": "{{ csrf_token() }}", "idList": JSON.stringify(arrayText)},
            success : function(r) {
                guardarOrdenCapitulo();
            },
            error : function(data) {
                console.log(data);
            }
        })
    }

        function eliminarCapituloBD(id){
            datos = document.querySelectorAll("tbody tr");
            $.ajax({
                type : "POST",
                "serverSide" : true,
                url : "./eliminar",
                data: {"_token": "{{ csrf_token() }}", "id": id},
                success : function(r) {
                    guardarOrdenCapitulo();
                    alertPersonalizado("¡Se eliminó el capitulo con exito!", 'success', 1, ++contAlert);
                    if (datos.length == 1) {
                        document.getElementById("mensajeNoHay").style.display = "table-row";
                    }
                },
                error : function(data) {
                    console.log(data);
                }
            })
        }

        window.onload = function () {
            var toastTrigger2 = document.getElementById('btnBorrar')

            if (toastTrigger2) {
                toastTrigger2.addEventListener('click', function () {
                var toast2 = new bootstrap.Toast(toastLiveExample)
                    toast2.show()
                })
            }
        }

        $(document).ready(function(){
            if (document.querySelectorAll("tbody tr").length == 1) {
                document.getElementById("mensajeNoHay").style.display = "table-row";
            } 
        })
</script>

<style>
    table{
        table-layout: fixed;
        width: 250px;
    }

    td {
        width: 100px;
        word-wrap: break-word;
    }

    th{
        text-align: center;
    }
    
    .capitulos{
        background-color: #e3eef5;
        border: 1px #003C71 solid;
        padding: 0;
        width: 80%;
    }
</style>
<div class="capitulos fuente-general" >
    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
        </symbol>
        <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
        </symbol>
    </svg>
    <div class="col seccion_" id="titulosApp">
        <h2>CAPÍTULOS</h2>
    </div>
    <div class="row justify-content-center" style="margin-top: 20px;">
        <div class="col-md-9">
            <div id="liveAlertPlaceholder"></div>
            <label for="basic-url" style="display: none;" class="form-label">Nombre del capitulo</label>
            <div class="input-group mb-3 mt-3">
                <button style="display:none" class="btn btn-danger" id="btnQuitar" onclick="quitarModificar()">X</button>
                <input type="text" class="form-control" id="nombreCap" aria-describedby="basic-addon3" placeholder="Nombre del capítulo" style="font-style: italic;">
                <input hidden type="text" class="form-control" id="idCap" aria-describedby="basic-addon3">
                <button onclick="guardarCapitulo(document.getElementById('idCap').value)" class="btn btn-success"><i class="bi bi-save"></i> <span id="btnTitulo">Agregar Capítulo</span></button>
            </div>
        </div>
    </div>
    
    <div class="row justify-content-center">
        <div class="col-md-11">
            <table class="table table-hover" style="background-color: white; border-radius: 5px;">
                <thead class="encabezadoBitacora">
                    <tr>
                        <td style="width: 10%;"></td>
                        <th scope="col" style="width: 45%;">NOMBRE DEL CAPÍTULO</th>
                        <th scope="col" style="width: 45%;">ACCIONES</th>
                    </tr>
                </thead>
                <tbody id="tablaCapitulo">
                    @php
                        $cont = 0;
                        $contCapitulos = 0;
                    @endphp
                    @foreach ($capitulos as $capitulo)
                        <script>
                            seccion("<?php ++$contCapitulos; echo $capitulo->nombre_capitulo ?>", <?php echo $capitulo->id ?>);
                        </script>
                    @endforeach
                </tbody>
                <tr style="text-align: center; display: none;" id="mensajeNoHay">
                    <td colspan="3">No hay datos disponibles</td>
                </tr>
            </table>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
        <div class="modal-header" style="background-color: #003C71; border-bottom: solid #E87B2A 8px;">
            <h5 class="modal-title" id="exampleModalToggleLabel" style="color: white;">Eliminar capítulo</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close" onclick="desmarcar()"></button>
        </div>
        <div class="modal-body" style="text-align: center;">
            <p id="tituloCap"></p>
            <h5 style="font-weight: bold;">¡Todo el contenido de dicho capítulo se borrará permanentemente!</h5>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal" id="btnBorrar" onclick="eliminarCapitulo(idT, idC)">Eliminar</button>
        </div>
        </div>
    </div>
</div>
    
@if (session('status'))
        <script>
            alertPersonalizado('<?php echo session('status'); ?>', 'success', 1, ++contAlert);
        </script>
    @endif
    @if (session('statusError'))
        <script>
            alertPersonalizado('<?php echo session('statusError'); ?>', 'danger', 2, ++contAlert);
        </script>
    @endif
@endsection