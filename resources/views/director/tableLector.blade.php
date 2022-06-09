<table class="table table-hover align-middle" id="tablaLector">
    <thead class="thead-dark" style="background-color: #003C71; color: white; border-bottom: solid #E87B2A 8px; ">
        <tr>
            <th scope="col">Nombres</th>
            <th scope="col">Apellidos</th>
            <th scope="col">Correo Electronico</th>
            <th scope="col">Acciones</th>
        </tr>
    </thead>
    <tbody id="contenidoLector">
        @foreach ($lectores as $lector)
            <tr>
                <td style="width: 26%">{{$lector->nombre}}</td>
                <td style="width: 26%">{{$lector->apellido}}</td>
                <td style="width: 26%">{{$lector->correo}}</td>
                <td><button class="btn btn-primary" type="button" data-bs-target="#exampleModalToggle" onclick="datosModal(<?php echo $lector->id ?>)" style="color: white">Editar</button></td>
            </tr>
        @endforeach
    </tbody>
</table>
<div id="paginacionLector">
    {{ $lectores->links('pagination::bootstrap-4') }}
</div>