@extends('plantillas.nav')
@section('content')

    <div class="container containerBitacora">
        <div class="row" id="titulosApp" style="padding: 0;">
            <h3 class="mt-3">BITACORA DE CAMBIOS</h3>
        </div>
        <br>
            
    <fieldset>
        <legend>Filtros</legend>
        <form action="{{ url('/bitacora') }}" method="get" id="frmFiltroBitacora">
            <div class="row">
                <div class="col-md-4">
                    <label for="accion" class="form-label">Acción</label>
                    <select class="form-select" name="accion" aria-label="Default select example">
                        <option value='' @if($accion_id == '') selected @endif>Seleccione una acción</option>
                        @foreach ($acciones as $accion)
                            <option value="{{$accion->id}}" value='' @if($accion_id == $accion->id) selected @endif>{{$accion->nombre_modificacion}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-4">
                    <label for="seccion" class="form-label">Sección</label>
                    <select class="form-select" name="seccion" aria-label="Default select example">
                        <option selected value='' @if($seccion_id == '') selected @endif>Seleccione una sección</option>
                        @foreach ($secciones as $seccion)
                            <option value="{{$seccion->id}}" @if($seccion_id == $seccion->id) selected @endif>{{$seccion->nombre_seccion}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-4">
                    <label for="accion" class="form-label">Integrantes del equipo</label>
                    <select class="form-select" name="miembro" aria-label="Default select example">
                        <option selected value='' @if($miembro_id == '') selected @endif>Seleccione a un miembro del equipo</option>
                        @foreach ($miembros as $estudiante)
                            <option value="{{$estudiante->id}}" @if($miembro_id == $estudiante->id) selected @endif>{{$estudiante->nombre}} {{$estudiante->apellido}}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <br>
            <div class="botonesFiltro">
                <div>
                    <button type="submit" class="btn btn-success btn-sm" data-dismiss="modal"><i class="bi bi-search"></i> Filtrar</button>
                </div>
                <div>
                    <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal" onclick="restablecerFiltro()"><i class="bi bi-arrow-repeat"></i> Restablecer</button>
                </div>
            </div>
        </form>
    </fieldset>
        <br>
        <div>
            <table class="table table-hover align-middle" style="background: white;">
                <thead class="encabezadoBitacora">
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
                            <td>{{$datos->bitacora_seccion->nombre_seccion}}</td>
                            <td>{{$datos->bitacora_modificacion->nombre_modificacion}}</td>
                            <td>{{$datos->estudiante->nombre}} {{$datos->estudiante->apellido}}</td>
                            <td>{{$datos->fecha_modificacion}}</td>
                            <td id="botonBitacora">
                                <button class="btn btn-warning" onclick="abrirModal('<?php echo $datos->idBitacora; ?>')"><i class="bi bi-eye"></i> Ver</button>
                            </td>
                        </tr>
                    @endforeach
                        @if ($bitacora->total() == 0)
                            <tr>
                                <td colspan="5">No hay datos disponibles</td>
                            </tr>
                        @endif
                </tbody>
            </table>
            <div class="paginacionBitacora">
                @if ($bitacora->total() != 0)
                    <div>
                        <p>Resultados del {{$bitacora->firstItem() }} al {{$bitacora->lastItem() }} de {{$bitacora->total() }}</p>
                    </div>
                @endif
                <div>
                    {{ $bitacora->appends(['accion' => $accion_id, 'seccion' => $seccion_id, 'miembro' => $miembro_id])->links('pagination::bootstrap-4') }}
                </div>
            </div>
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
                    <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="borrarCampos()">Cerrar</button>
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
                descripcion.value = r['descripcion'].replaceAll("\\n", "\n");
                myModal.show();
            },
            error : function(data) {
                console.log(data);
            }
        })  
    }

    function borrarCampos() {
        document.getElementById('estudiante').value = "";
        document.getElementById('seccion').value = "";
        document.getElementById('accion').value = "";
        document.getElementById('fecha').value = "";
        document.getElementById('descripcion').value = "";
    }

    function restablecerFiltro() {
        location.href = "./bitacora";
    }
</script>

@endsection