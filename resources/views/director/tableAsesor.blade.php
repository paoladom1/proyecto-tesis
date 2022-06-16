<table class="table table-hover align-middle fuente-general" id="tablaAsesor">
    <thead class="thead-dark" style="background-color: #003C71; color: white; border-bottom: solid #E87B2A 8px; ">
        <tr>
            <th scope="col">NOMBRES</th>
            <th scope="col">APELLIDOS</th>
            <th scope="col">CORREO ELECTRÓNICO</th>
            <th scope="col">ACCIONES</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($asesores as $asesor)
            <tr>
                <td style="width: 26%">{{$asesor->nombre}}</td>
                <td style="width: 26%">{{$asesor->apellido}}</td>
                <td style="width: 26%">{{$asesor->correo}}</td>
                <td><button class="btn btn-primary" type="button" data-bs-target="#exampleModalToggle" onclick="datosModal(<?php echo $asesor->id ?>)" style="color: white">Editar</button></td>
            </tr>
        @endforeach
    </tbody>
</table>
<div class="paginacionAD">
    @if ($asesores->total() != 0)
        <div>
            <p>Resultados del {{$asesores->firstItem() }} al {{$asesores->lastItem() }} de {{$asesores->total() }}</p>
        </div>
    @endif
    <div id="paginacionAsesor">
        {{ $asesores->links('pagination::bootstrap-4') }}
    </div>
</div>