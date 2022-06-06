@extends('plantillas.nav')
@section('content')

    <div class="container containerBitacora">
        <div class="row" id="titulosApp" style="padding: 0;">
            <h3 class="mt-3">ULTIMOS CAMBIOS</h3>
        </div>
        <div>
            <table class="table table-bordered border-primary">
                <thead>
                    <tr id="bitacoraEncabezado">
                        <th scope="col">Sección</th>
                        <th scope="col">Acción</th>
                        <th scope="col">Autor</th>
                        <th scope="col">Fecha</th>
                        <th scope="col">Información</th>
                    </tr>
                </thead>
                <tbody id="contenidoTablaBi">
                    @foreach ($bitacora as $datos)
                        <tr>
                            <th scope="row">{{$datos->bitacora_seccion->nombre_seccion}}</th>
                            <td>{{$datos->bitacora_modificacion->nombre_modificacion}}</td>
                            <td>{{$datos->estudiante->nombre}} {{$datos->estudiante->apellido}}</td>
                            <td>{{$datos->fecha_modificacion}}</td>
                            <td id="botonBitacora">
                                <button class="btn btn-success" style="color: white;" onclick="abrirModal('<?php echo $datos->id; ?>')"><i class="bi bi-eye"></i> Ver</button>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
            {{ $bitacora->links('pagination::bootstrap-4') }}
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="true" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #003C71; border-bottom: solid #E87B2A 8px;">
                    <h5 class="modal-title" style="color: white; font-size: 1.75em;" id="exampleModalLongTitle">Información de bitacora</h5> <!-- cambiar esta parte-->
                    <button type="button" class="btn-close btn-close-white" style="width: 1em;" data-dismiss="modal" aria-label="Close" onclick="borrarCampos()">
                    </button>
                </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col">
                        <label for="estudiante" class="form-label">Estudiante</label>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" id="estudiante" aria-describedby="basic-addon3" readonly>
                        </div>
                    </div>
                    <div class="col">
                        <label for="seccion" class="form-label">Sección</label>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" id="seccion" aria-describedby="basic-addon3" readonly>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <label for="accion" class="form-label">Accion</label>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" id="accion" aria-describedby="basic-addon3" readonly>
                        </div>
                    </div>
                    <div class="col">
                        <label for="fecha" class="form-label">Fecha/Hora de modificación</label>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" id="fecha" aria-describedby="basic-addon3" readonly>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <label for="descripcion" class="form-label">Descripción</label>
                    <div class="input-group">
                        <textarea class="form-control" id="descripcion" aria-label="descripcion" readonly rows="6" style="resize:none;"></textarea>
                    </div>
                </div>
            </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="borrarCampos()">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

<script>
    var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'), {
        keyboard: false
    });
    function abrirModal(idBitacora) {
        estudiante = document.getElementById('estudiante');
        seccion = document.getElementById('seccion');
        accion = document.getElementById('accion');
        fecha = document.getElementById('fecha');
        descripcion = document.getElementById('descripcion');
        $.ajax({
            type : "POST",
            "serverSide" : true,
            url : "./obtenerInfo",
            data: {"_token": "{{ csrf_token() }}", "id": idBitacora},
            success : function(r) {
                console.log(r);
                estudiante.value = r['estudiante']['nombre']+' '+r['estudiante']['apellido'];
                seccion.value = r['bitacora_seccion']['nombre_seccion'];
                accion.value = r['bitacora_modificacion']['nombre_modificacion'];
                fecha.value = r['fecha_modificacion'];
                descripcion.value = r['descripcion'];
            },
            error : function(data) {
                console.log(data);
            }
        })  
        myModal.show();
    }

    function borrarCampos() {
        document.getElementById('estudiante').value = "";
        document.getElementById('seccion').value = "";
        document.getElementById('accion').value = "";
        document.getElementById('fecha').value = "";
        document.getElementById('descripcion').value = "";
    }
</script>

@endsection