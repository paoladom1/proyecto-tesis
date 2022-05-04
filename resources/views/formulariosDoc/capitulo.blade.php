@extends('plantillas.nav')
@section('content')

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



<script>
    function modificarCapitulo(i) {
        let elements = document.getElementsByName("tituloN");
        let elements2 = document.getElementsByName("idCapitulos");
        document.getElementById('nombreCap').value = elements[i-1].textContent;
        document.getElementById('idCap').value = elements2[i-1].textContent;
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

    function eliminarCapitulo(position, idCapi){
        a = 0;
        document.getElementById("part-"+position).remove();
        ordenarCapitulos();
        eliminarCapituloBD(idCapi);
        modificarOrden();
        $('.toast-body').text("Se eliminó exitosamente!");
    }

    function guardarOrdenCapitulo() {
        $('#guardarOrden').hide();
        $('.toast-body').text("Se guardó exitosamente!");
    }

    var idT;
    var idC;
    function obtenerNombreCapitulo(id, titulo, id2) {
        idT = id;  
        idC = id2;
        $("#tituloCap").text('¿Esta seguro de eliminar el capitulo "'+titulo+'"?');
    }

    function seccion(nombreC, idC) {
        var id = document.getElementById('idCap').value;
        ++a;
        var nombre = document.getElementById('nombreCap');
        fragmento = `
                        <th class="align-middle" style="cursor: grab;"><i class="bi bi-list"></i></td>
                        <th scope="row" style="display:none" class="align-middle" name="numeracion" id="num${a}">${a} </th><span name="idCapitulos" style="display:none">${idC}</span>
                        <td class="align-middle" name="titulacion"><span name="numCapitulo">Capitulo ${a}.</span> <span name="tituloN">${nombreC}</span></td> 
                        <td>
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <a class="btn btn-success" style="background-color: #003C71;" href="{{ url('/fdinamico/${idC}') }}">Modificar contenido</a>
                            <button type="button" onclick="modificarCapitulo(document.getElementById('num${a}').textContent)" class="btn btn-warning" style="color: white;">Modificar titulo</button>
                            <button type="button" onclick="obtenerNombreCapitulo(${a}, '${nombreC}', ${idC})" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-danger">Eliminar capitulo</button>
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
                    $('#guardarOrden').show();
                }
            }
        );
    });

    function guardarCapitulo(id) {
        let nombre = $('#nombreCap').val();
        if(id == ""){
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
                },
                error : function(data) {
                    console.log(data);
                }
            })
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
        }
    }

    function modificarOrden() {
        let nombre = $('#nombreCap').val();
        let ids = document.getElementsByName("idCapitulos"); //idCapitulos
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
            $.ajax({
                type : "POST",
                "serverSide" : true,
                url : "./eliminar",
                data: {"_token": "{{ csrf_token() }}", "id": id},
                success : function(r) {
                    guardarOrdenCapitulo();
                },
                error : function(data) {
                    console.log(data);
                }
            })
        }

        window.onload = function () {
            var toastTrigger = document.getElementById('guardarOrden')
            var toastTrigger2 = document.getElementById('btnBorrar')
            var toastLiveExample = document.getElementById('liveToast')
            if (toastTrigger) {
                toastTrigger.addEventListener('click', function () {
                var toast = new bootstrap.Toast(toastLiveExample)
                    toast.show()
                })
            }

            if (toastTrigger2) {
                toastTrigger2.addEventListener('click', function () {
                var toast2 = new bootstrap.Toast(toastLiveExample)
                    toast2.show()
                })
            }
        }
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
        border-top: 7px #003C71 solid; 
    }
</style>
<div class="container capitulos" >
    <br>
    <div class="row justify-content-center">
        <div class="col-md-8">
            <label for="basic-url" style="display: none;" class="form-label">Nombre del capitulo</label>
            <div class="input-group mb-3 mt-3">
                <button style="display:none" class="btn btn-danger" id="btnQuitar" onclick="quitarModificar()">X</button>
                <input type="text" class="form-control" id="nombreCap" aria-describedby="basic-addon3" placeholder="Nombre del capitulo" style="font-style: italic;">
                <input hidden type="text" class="form-control" id="idCap" aria-describedby="basic-addon3">
                <button onclick="guardarCapitulo(document.getElementById('idCap').value)" class="btn btn-success" style="background-color: #003C71;" id="btnTitulo">Agregar Capitulo</button>
            </div>
        </div>
    </div>
    
    <div class="row justify-content-center">
        <div class="col-md-8">
            <table class="table" style="background-color: white; border-radius: 5px;">
                <thead>
                    <tr>
                        <td></td>
                        <th scope="col">Nombre del capitulo</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody id="tablaCapitulo">
                    @php
                        $cont = 0;
                    @endphp
                    @foreach ($capitulos as $capitulo)
                        <script>
                            seccion("<?php echo $capitulo->nombre_capitulo ?>", <?php echo $capitulo->id ?>);
                        </script>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-8" style="display: flex; flex-direction: row; justify-content:end;">
            <button style="display:none" class="btn btn-success mb-3"  id="guardarOrden" onclick="modificarOrden()">Guardar orden</button>
        </div>
    </div>
</div>

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
            <p>TODO EL CONTENIDO DE DICHO CAPITULO SE BORRARÁ PERMANENTEMENTE!</p>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal" id="btnBorrar" onclick="eliminarCapitulo(idT, idC)">Eliminar</button>
        </div>
        </div>
    </div>
</div>


<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
    <div id="liveToast" class="toast align-items-center text-white bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body">
                Se guardo de manera exitosa!
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>
@endsection