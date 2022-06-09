<table class="table table-hover align-middle" id="tablaAsesor">
    <thead class="thead-dark" style="background-color: #003C71; color: white; border-bottom: solid #E87B2A 8px; ">
        <tr>
            <th scope="col">Nombres</th>
            <th scope="col">Apellidos</th>
            <th scope="col">Correo Electronico</th>
            <th scope="col">Acciones</th>
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
<div id="paginacionAsesor">
    {{ $asesores->links('pagination::bootstrap-4') }}
</div>