<table class="table table-hover align-middle fuente-general" id="tablaGrupos">
<thead class="thead-dark" style="background-color: #003C71; color: white; border-bottom: solid #E87B2A 8px;">
    <tr>
        <th scope="col">NÚMERO DE INTEGRANTES</th>
        <th scope="col">TEMA DEL TRABAJO DE GRADUACIÓN</th>
        <th scope="col">ACCIONES</th>
    </tr>
</thead>
<tbody>
    @foreach ($grupos as $dato)
        <tr>
            @if ($configuraciones->numero_integrantes == count($dato->estudiante))
                <td style="width: 20%">{{count($dato->estudiante)}} (Lleno)</td>
            @else
                <td style="width: 20%">{{count($dato->estudiante)}}</td>
            @endif
            <td style="width: 60%">{{$dato->tema}}</td>
            <td style="width: 20%"><button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#exampleModalToggle" onclick="mostrarDatosModalPrincipal(<?php echo $dato->id ?>)" style="color: white">Editar</button>{{--  <button class="btn btn-danger ms-1" onclick="">Eliminar</button>--}}</td>
        </tr>
    @endforeach
</tbody>
</table>
<div id="paginacionGrupos">
    {{ $grupos->links('pagination::bootstrap-4') }}
</div>