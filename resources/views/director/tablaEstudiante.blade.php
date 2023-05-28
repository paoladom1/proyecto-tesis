<table class="table tableE table-hover align-middle">
<thead>
    <tr>
        <th scope="col"></th>
        <th scope="col">Carnet</th>
        <th scope="col">Nombres</th>
        <th scope="col">Apellido</th>
    </tr>
</thead>
<tbody id="estudiantes">
    <?php $contEstudiantes = 0; ?>
    @foreach ($estudiantes as $estudiante)
        <tr>
            <td>
                <div class="form-check">
                    <input class="form-check-input checkEstudiantes" type="checkbox" onclick="reservarEstudiante(<?php echo $contEstudiantes ?>, <?php echo $estudiante->id ?>)" value="{{$estudiante->id}}" id="checkEstudiante{{$estudiante->id}}">
                </div>
            </td>
            <td id = "carnetEstudiante{{$contEstudiantes}}">{{$estudiante->carnet}}</td>
            <td id = "nombreEstudiante{{$contEstudiantes}}">{{$estudiante->nombre}}</td>
            <td id = "apellidoEstudiante{{$contEstudiantes++}}">{{$estudiante->apellido}}</td>
        </tr>
    @endforeach
    <tr id="noDatos3">
        <td colspan="4">¡No hay datos disponibles!</td>
    </tr>
</tbody>
</table>
<div class="paginacionBitacora paginacionEstudiantes">
@if ($estudiantes->total() != 0)
    <div>
        <p>Resultados del {{$estudiantes->firstItem() }} al {{$estudiantes->lastItem() }} de {{$estudiantes->total() }}</p>
    </div>
@endif
<div>
    {{ $estudiantes->links('pagination::bootstrap-4') }}
</div>
</div>