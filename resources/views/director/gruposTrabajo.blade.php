@extends('plantillas.nav')
@section('content')

<style>
    .dropbtn {
    background-color: #04AA6D;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
    }

    .dropbtn:hover, .dropbtn:focus {
    background-color: #3e8e41;
    }

    #myInput, #myInput2 {
    box-sizing: border-box;
    background-image: url('searchicon.png');
    background-position: 14px 12px;
    background-repeat: no-repeat;
    font-size: 16px;
    padding: 10px;
    border: none;
    border-bottom: 1px solid #ddd;
    width: 100%;
    }

    #myInput, #myInput2 {outline: 3px solid #ddd;}

    .dropdown-content {
    display: none;
    position: absolute;
    background-color: #f6f6f6;
    min-width: 230px;
    overflow: auto;
    border: 1px solid #ddd;
    z-index: 1;
    }

    .dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    }

    .dropdown a:hover {background-color: #ddd;}
    
    .show {display: block;}

    .scrollable-menu {
        height: auto;
        max-height: 200px;
        overflow-x: hidden;
    }

    .containerToogle{
        display: flex;
        align-items: 
    }

    .containerToogle > div:nth-child(1){
        width: 30%;
    } 

    .containerToogle > div:nth-child(2){
        width: 70%;
    }

    .containerToogle > div:nth-child(1) > .dropdown > button{
        width: 100%;
        display:flex;
        justify-content: space-between;
        align-items: center;
    } 
    .containerToogle > div:nth-child(1) > .dropdown > button:focus{
        outline: none;
        box-shadow: none;
    }
</style>
   
    <br>
    <div class="container">

    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
        </symbol>
        <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
        </symbol>
    </svg>

    <!--------------------------------------------------Modal para Asesor o Lector UCA----------------------------------------->

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="tituloModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            <div class="modal-header" style="background-color: #003C71; border-bottom: solid #E87B2A 8px;">
                <h5 class="modal-title" id="tituloModal" style="color: white;"></h5>
                <button type="button" class="btn-close btn-close-white" style="width: 1em;" data-bs-dismiss="modal" aria-label="Close" onclick="cancelar(); limpiarModalPrincipal();"></button>
            </div>
            <div class="modal-body">
            <div id="liveAlertPlaceholder2"></div>
            <div class='container'>
            <div class='row'>
                <div class="col">
                    <div class="form-group">
                        <label for="cmb1">Facultad</label> 
                        <select class="form-control" id="cmb1">
                            <option value="0">Seleccione una Facultad</option>
                            @foreach ($facultades as $facultad)
                                <option value="{{$facultad->id}}">{{$facultad->nombre_facultad}}</option>
                            @endforeach
                            <option value="-1">No aplica</option>
                        </select>
                    </div>
                </div>
            </div>
            <br>
            <div class='row'>
                <div class="col">
                    <div class="form-group">
                        <label for="cmb2">Departamento</label> 
                        <select class="form-control" id="cmb2">
                            <option value="0">Seleccione una opción</option>
                            @php
                                $cont = 0;
                            @endphp
                            @foreach ($departamentos as $departamento)
                                @php
                                    ++$cont;
                                @endphp
                                <option value="{{$cont}}">{{$departamento->nombre_departamento}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
            <br>

            <div class="row">
                <form action="{{ url('/asignarDocente') }}" method="post">
                    {{ csrf_field() }}
                    <label>Empleado</label> 
                    <div class="row">
                        <div class="col-md-4">
                            <div class="dropdown">
                                <button onclick="myFunction(3)" type="button" class="btn btn-warning dropdown-toggle">Seleccionar</button>
                                <div id="myDropdown3" class="dropdown-content">
                                    <input type="text" placeholder="Buscar.." id="myInput" onkeyup="filterFunction('myDropdown3', 'myInput')">
                                    <div id="Tdocentes" class="scrollable-menu">
                                        @foreach ($empleados as $empleado)
                                            <a href="#about" onclick="seleccionarEmpleado('<?php echo $empleado->nombre.' '.$empleado->apellido ?>', <?php echo $empleado->id ?>, 3)">{{$empleado->nombre}} {{$empleado->apellido}}</a>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="input-group">                                    
                                <input type="text" disabled class="form-control ms-3" id="nombres" aria-label="Username" aria-describedby="basic-addon1">
                                <input type="text" hidden disabled class="form-control" id="id" aria-label="Username" aria-describedby="basic-addon1">
                            </div>
                        </div>
                    </div>
                    <br>
                </form>
            </div>
        </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="cancelar()" data-bs-target="#exampleModalToggle" data-bs-toggle="modal"><i class="bi bi-x-circle"></i> Cancelar</button>
            <button type="button" class="btn btn-success" data-bs-dismiss="modal" onclick="asignarDirector()" data-bs-target="#exampleModalToggle"><i class="bi bi-person-plus-fill"></i> Asignar</button>
        </div> 
 
        </div>
    </div>
    </div>
    
    <!------------------------------------------------Modal para Asesores o Lector externo-------------------------------------->
    
    <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="false">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            <div class="modal-header" style="background-color: #003C71; border-bottom: solid #E87B2A 8px;">
                <h5 class="modal-title" id="tituloModal2" style="color: white;"></h5>
                <button type="button" class="btn-close btn-close-white" style="width: 1em;" data-bs-dismiss="modal" aria-label="Close" onclick="cancelar(); limpiarModalPrincipal()"></button>
            </div>
            <div class="modal-body">
                <div id="liveAlertPlaceholder3"></div>
                <div class="row">
                    <div class="col">
                        <div class="dropdown">
                            <button onclick="myFunction(4)" type="button" class="btn btn-warning dropdown-toggle">Seleccionar</button>
                            <div id="myDropdown4" class="dropdown-content">
                                <input type="text" placeholder="Buscar.." id="myInput2" onkeyup="filterFunction('myDropdown4', 'myInput2')">
                                <div id="Texterno" class="scrollable-menu">
 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <input hidden type="text" class="form-control" id="idExterno" aria-describedby="basic-addon3">
                <div class="row">
                    <div class="col">
                        <label for="nombre" class="form-label">Nombre</label>
                        <div class="input-group mb-3">
                            <input disabled type="text" class="form-control" id="nombre" aria-describedby="basic-addon3">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <label for="correo" class="form-label">Correo</label>
                        <div class="input-group mb-3">
                            <input disabled type="text" class="form-control" id="correo" aria-describedby="basic-addon3">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <label for="descripcion" class="form-label">Descripción</label>
                        <div class="input-group mb-3">
                            <textarea disabled style="resize: none;" class="form-control" placeholder="" rows=5 id="descripcion"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" onclick="cancelar()"><i class="bi bi-x-circle"></i> Cancelar</button>
                <button type="button" class="btn btn-success" data-bs-dismiss="modal" data-bs-target="#exampleModalToggle" onclick="asignarExterno()"><i class="bi bi-person-plus-fill"></i> Asignar</button>
            </div>
            </div>
        </div>
    </div>

    <!--------------------------------------------------Modal para crear grupo----------------------------------------->

    <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1" data-backdrop="false">
        <div class="modal-dialog modal-dialog-centered modal-xl">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #003C71; border-bottom: solid #E87B2A 8px;">
                    <h5 class="modal-title" id="exampleModalToggleLabel" style="color: white;">Grupo de trabajo de graduación</h5>
                    <button type="button" class="btn-close btn-close-white" style="width: 1em;" data-bs-dismiss="modal" aria-label="Close" style="color: white" onclick="limpiarModalPrincipal()"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col">
                            <div class="form-check form-switch form-check-reverse">
                                <input class="form-check-input" value="0" type="checkbox" id="prorroga">
                                <label class="form-check-label" for="flexSwitchCheckReverse">Prorroga</label>
                            </div>
                        </div>
                    </div>
                    <br>
                    <input hidden type="text" id="idGrupo">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group form-floating">
                                <input type="text" id="tema" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="Ingrese el tema de trabajo de graduacion">
                                <label for="tema">Tema de trabajo de graduación</label>
                            </div>
                            <br>
                            <label>Asesor</label> 
                            <div class="containerToogle">
                                <div>
                                    <div class="dropdown">
                                        <button onclick="myFunction(1)" type="button" id="seleccionar1" class="btn btn-warning dropdown-toggle">Seleccionar</button>
                                        <div id="myDropdown1" class="dropdown-content" style="width: 100%;">
                                            <div class="scrollable-menu">
                                                <a href="#" onclick="eliminarLector(1); myFunction(1)">Quitar Elección</a>
                                                <a data-bs-toggle="modal" data-bs-target="#exampleModal" href="#" onclick="cambiarBoton(1, 1); restablecerCmb();">UCA</a>
                                                <a data-bs-toggle="modal" data-bs-target="#exampleModal2" href="#" onclick="cambiarBoton(2, 1); datosExterno(0);">Externo</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="input-group">
                                        <input hidden type="text" id="tipoAsesor">
                                        <input type="text" readonly class="form-control" id="nombresD" name="nombresD" aria-label="Username" aria-describedby="basic-addon1" style="background-color: white">
                                        <input type="text" readonly style='display: none' class="form-control" id="idD" name="idD" aria-label="Username" aria-describedby="basic-addon1">
                                    </div>
                                </div>
                            </div>
                            <br>
                            <label>Lector</label> 
                            <div class="containerToogle">
                                <div>
                                    <div class="dropdown">
                                        <button onclick="myFunction(2)" type="button" id="seleccionar2" class="btn btn-warning dropdown-toggle" >Seleccionar</button>
                                        <div id="myDropdown2" class="dropdown-content">
                                            <div class="scrollable-menu">
                                                <a href="#" onclick="eliminarLector(2); myFunction(2)">Quitar Elección</a>
                                                <a data-bs-toggle="modal" data-bs-target="#exampleModal" href="#" onclick="cambiarBoton(3, 2); restablecerCmb();">UCA</a>
                                                <a data-bs-toggle="modal" data-bs-target="#exampleModal2" href="#" onclick="cambiarBoton(4, 2); datosExterno(1);">Externo</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="input-group">
                                        <input hidden type="text" id="tipoLector">
                                        <input type="text" readonly class="form-control" id="nombresL" name="nombresL" aria-label="Username" aria-describedby="basic-addon1" style="background-color: white">
                                        <input type="text" readonly style='display: none' class="form-control" id="idL" name="idL" aria-label="Username" aria-describedby="basic-addon1">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal45"><i class="bi bi-people"></i> Asignar estudiantes</button>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">Carnet</th>
                                        <th scope="col">Nombres</th>
                                        <th scope="col">Apellido</th>
                                    </tr>
                                </thead>
                                <tbody id="asignados">
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="cancelar(); limpiarModalPrincipal()"><i class="bi bi-x-circle"></i> Cancelar</button>
                    <button class="btn btn-success" data-bs-dismiss="modal" onclick="registrarDatosGrupos()"><i class="bi bi-save"></i> <span id="btnCrearGrupo">Crear grupo</span></button>
                </div>
            </div>
        </div>
    </div>

    <!-- Pantalla de grupos de tesis CRUD -->

    <div class="table-responsive">
        <div id="liveAlertPlaceholder"></div>
        <div id="tablaGruposContainer">
            <table class="table table-hover align-middle" id="tablaGrupos">
                <thead class="thead-dark" style="background-color: #003C71; color: white; border-bottom: solid #E87B2A 8px;">
                    <tr>
                        <th scope="col">Tema del trabajo de graduación</th>
                        <th scope="col">Numero de integrantes</th>
                        <th scope="col">Acciones</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($grupos as $dato)
                        <tr>
                            <td style="width: 60%">{{$dato->tema}}</td>
                            @if ($configuraciones->numero_integrantes == count($dato->estudiante))
                                <td style="width: 30%">{{count($dato->estudiante)}} (Lleno)</td>
                            @else
                                <td style="width: 30%">{{count($dato->estudiante)}}</td>
                            @endif
                            <td><button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#exampleModalToggle" onclick="mostrarDatosModalPrincipal(<?php echo $dato->id ?>)" style="color: white">Editar</button>{{--  <button class="btn btn-danger ms-1" onclick="">Eliminar</button>--}}</td>
                            <td></td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
            <div id="paginacionGrupos">
                {{ $grupos->links('pagination::bootstrap-4') }}
            </div>
        </div>
    </div>
    <div class="row d-flex flex-row-reverse mt-3">
        <a class="float-button" data-bs-toggle="modal" href="#exampleModalToggle" role="button" data-backdrop="false" style="width: 15%; right: 0px;" onclick="$('#btnCrearGrupo').text('Crear Grupo')"><i class="bi bi-people-fill float-icon" style="border-radius: 100%"></i></a>
    </div>
    <br>

    <!--------------------------------------------------Modal para estudiantes----------------------------------------->

    <div class="modal fade" id="exampleModal45" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog modal-dialog-centered">
            <div class="modal-content">
            <div class="modal-header" style="background-color: #003C71; border-bottom: solid #E87B2A 8px;">
                <h5 class="modal-title" id="exampleModalLabel" style="color: white">Estudiantes</h5>
                <button type="button" class="btn-close btn-close-white" style="width: 1em;" data-bs-dismiss="modal" aria-label="Close" onclick="limpiarModalPrincipal()"></button>
            </div>
            <div class="modal-body">
                <div class="input-group input-group-sm">
                    <span class="input-group-text" id="inputGroup-sizing-sm">Buscar</span>
                    <input type="text" class="form-control" id="buscadorTabla" onkeyup="filterTable()" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                </div>
                <br>
                <p>Puede seleccionar a <span id="numEstudiante">4</span> estudiantes</p>
                <table class="table tableE">
                    <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">Carnet</th>
                            <th scope="col">Nombres</th>
                            <th scope="col">Apellido</th>
                        </tr>
                    </thead>
                    <tbody id="estudiantes">
                        <tr>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input checkEstudiantes" type="checkbox" value="1" id="flexCheckDefault">
                                </div>
                            </td>
                            <th scope="row">00092117</th>
                            <td>Mark</td>
                            <td>Otto</td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input checkEstudiantes" type="checkbox" value="2" id="flexCheckDefault">
                                </div>
                            </td>
                            <th scope="row">00092117</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input checkEstudiantes" type="checkbox" value="3" id="flexCheckDefault">
                                </div>
                            </td>
                            <th scope="row">00092117</th>
                            <td>Jacob</td>
                            <td >Larry the Bird</td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input checkEstudiantes" type="checkbox" value="4" id="flexCheckDefault">
                                </div>
                            </td>
                            <th scope="row">00092117</th>
                            <td>Jacob</td>
                            <td>Larry the Bird</td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input checkEstudiantes" type="checkbox" value="4" id="flexCheckDefault">
                                </div>
                            </td>
                            <th scope="row">00092117</th>
                            <td>Jacob</td>
                            <td>Larry the Bird</td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input checkEstudiantes" type="checkbox" value="4" id="flexCheckDefault">
                                </div>
                            </td>
                            <th scope="row">00092117</th>
                            <td>Jacob</td>
                            <td>Larry the Bird</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">Atras</button>
                <button type="button" class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" onclick="asignarEstudiante()"><i class="bi bi-person-plus-fill"></i> Asignar</button>
            </div>
            </div>
        </div>
    </div>
    </div>

<script type="text/javascript">
    restablecerCmb();
    $("#exampleModalToggle").on("hidden.bs.modal", function () { 
        limpiarModalPrincipal();
    });
    var contadorAlerta = 0;
    const alertError = (message, type, icon, idElementoAlerta, cont=0) => {
        const alertPlaceholder = document.getElementById(idElementoAlerta);
        const wrapper = document.createElement('div')
        $(".alert1").remove(); 
        var icon_f;
        if (icon == 2) {
            icon_f = `   <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>`  
        } else if(icon == 1){
            icon_f = '   <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>'
        }
        wrapper.innerHTML = 
            `<div class="alert alert${cont} alert-${type} d-flex align-items-center" role="alert">`+
            icon_f+
            `   <div>${message}</div>`+
            '</div>';
            window.setTimeout(function() {
                $(`.alert${cont}`).fadeTo(500, 0).slideUp(500, function(){
                    $(this).remove(); 
                });
            }, 2000);
            alertPlaceholder.append(wrapper)
    }

    // ------------------------------ Funciones de paginación-------------------------------

    var paginacionActual = 1;
    const grupos = (page) => {
        $.ajax({
            type : "GET",
            "serverSide" : true,
            url : "./grupoTrabajo",
            data: { "page": page},
            dataType: 'json',
            success : function(r) {
                $("#tablaGruposContainer").html(r);
            },
            error : function(data) {
                console.log(data);
            }
        })
    }

    $(document).on('click', '#paginacionGrupos .pagination a', function(e){
        e.preventDefault();
        var page = $(this).attr('href').split('page=')[1];
        paginacionActual = page;
        grupos(page);
    })

    // ------------------------------------------------ Funciones de limpieza de campos-----------------------------

    function limpiar() {
        $('#cmb2').empty();
        var select = document.getElementById("cmb2");
		$("<option/>").val(0).text("Seleccione una opción").appendTo("#cmb2");
    }

    function restablecerCmb() {
        $("#cmb1").val('<?php echo $idFacultad; ?>');
        $("#cmb2").val('<?php echo $idDepartamento; ?>');
    }

    function limpiarModal() {
        $("#nombres").val("");
        $("#id").val("");
        
        $('#Tdocentes').empty();
        
        $("#nombre").val("");
        $("#correo").val("");
        $("#idExterno").val("");
        $("#descripcion").val("");

        filtroDepartamento(<?php echo $idDepartamento; ?>);
        filtroFacultad(<?php echo $idFacultad; ?>);
        if (bandera == 1 && $("#nombresD").val() == "") {
            $("#seleccionar1").text("Seleccionar");
        } else if (bandera == 2 && $("#nombresL").val() == "") {
            $("#seleccionar2").text("Seleccionar");
        }
    }

    function limpiarModalPrincipal() {
        $("#nombresD").val("");
        $("#idD").val(""); 
        $("#nombresL").val("");
        $("#idL").val(""); 
        $("#tema").val("");
        $("#idGrupo").val("");
        $("#tipoAsesor").val("");
        $("#tipoLector").val("");
        $("#seleccionar1").text("Seleccionar");
        $("#seleccionar2").text("Seleccionar");
        $("#prorroga").prop("checked", false);
        document.getElementById("myDropdown1").classList.remove('show');
        document.getElementById("myDropdown2").classList.remove('show');
    }

    // ------------------------------- Funciones para los filtros de los lectores y asesores externos -------------------------------

    function agregarCmb(docentes) {
        if (docentes != "") {
            docentes.forEach(element => {
                $("<option/>").val(element['id']).text(element['nombre_departamento']).appendTo("#cmb2");
            });
        }
    }

    function agregarCmb2(docentes) {
        $('#Tdocentes').empty();
        docentes.forEach(element => {
            var div2 = `<a href="#about" onclick="seleccionarEmpleado('${element['nombre']} ${element['apellido']}', '${element['id']}', 3)">${element['nombre']} ${element['apellido']}</a>`;
            var div = document.createElement('div');
                    div.innerHTML = div2;
                document.getElementById('Tdocentes').appendChild(div); 
        });
    }

    function agregarToogleExterno(datosE, tipoExterno) {
        $('#Texterno').empty();
        datosE.forEach(element => {
            var div2 = `<a href="#about" onclick="datosExterno('', ${element['id']})">${element['nombre']} ${element['apellido']}</a>`;
            var div = document.createElement('div');
                    div.innerHTML = div2;
                document.getElementById('Texterno').appendChild(div); 
        });
    }

    function filtroFacultad(idSecundario = 0) {
        var id;
        if (idSecundario == 0) {
            id = document.getElementById("cmb1").value;
        } else {
            id = idSecundario;
        }
        $.ajax({
            type : "POST",
            "serverSide" : true,
            url : "./filtroFacultad",
            data: {"_token": "{{ csrf_token() }}", "id": id},
            success : function(r) {
                limpiar();  
                agregarCmb(r);
            },
            error : function(data) {
                console.log(data);
            }
        })
    }

    function filtroDepartamento(idSecundario = 0) {
        var id;
        if (idSecundario == 0) {
            id = document.getElementById("cmb2").value;   
        } else {
            id = idSecundario;
        }
        $.ajax({
            type : "POST",
            "serverSide" : true,
            url : "./filtroDepartamento",
            data: {"_token": "{{ csrf_token() }}", "id": id},
            success : function(r) {
                agregarCmb2(r);
            },
            error : function(data) {
                console.log(data);
            }
        })
    }
    
    function datosExterno(tipoExterno, id = 0) {
        var route = "";
        var nombre = document.getElementById('nombre');
        var correo = document.getElementById('correo');
        var idExterno = document.getElementById('idExterno');
        var descripcion = document.getElementById('descripcion');

        if (id == 0) {
            route = "datosExterno";
        } else {
            tipoExterno = id;
            route = "mostrarDato";
        }

        $.ajax({
            type : "POST",
            "serverSide" : true,
            url : "./"+route,
            data: {"_token": "{{ csrf_token() }}", "id": tipoExterno},
            success : function(r) {
                if (id == 0) {
                    agregarToogleExterno(r);
                } else{
                    idExterno.value = r['id'];
                    nombre.value = r['nombre']+" "+r['apellido'];
                    correo.value = r['correo'];
                    descripcion.value = r['descripcion'];
                    document.getElementById("myDropdown4").classList.toggle("show");
                }
            },
            error : function(data) {
                console.log(data);
            }
        })
    }

    function eleccion(boton) {
        if(boton == 1){
            document.getElementById("myDropdown1").classList.toggle("show");
        } else if(boton == 2){
            document.getElementById("myDropdown2").classList.toggle("show");
        } else if(boton == 3){
            document.getElementById("myDropdown3").classList.toggle("show");
        }
    }

    function seleccionarEmpleado(nombre, id, eleccionB) {
        eleccion(eleccionB);
        $("#nombres").val(nombre);        
        $("#id").val(id);        
    }

    function eliminarLector(eleccion) {
        if(eleccion == 1){
            $("#nombresD").val($("#nombres").val());
            $("#idD").val($("#id").val());  
            $("#tipoAsesor").val("");
            $("#seleccionar1").text("Seleccionar");
        } else if (eleccion == 2) {
            $("#nombresL").val($("#nombres").val());
            $("#idL").val($("#id").val());  
            $("#seleccionar2").text("Seleccionar");
            $("#tipoLector").val("");
        }
    }

    $(document).ready(
        function() {
            $("#cmb1").change(function(){
                filtroFacultad();
            });

            $("#cmb2").change(function(){
                $("#nombres").val("");
                $("#id").val("");
                filtroDepartamento();
            });
        }
    )

    function myFunction(boton) {
        if(boton == 1){
            document.getElementById("myDropdown1").classList.toggle("show");
        } else if(boton == 2){
            document.getElementById("myDropdown2").classList.toggle("show");
        } else if(boton == 3){
            document.getElementById("myDropdown3").classList.toggle("show");
        } else if(boton == 4){
            document.getElementById("myDropdown4").classList.toggle("show");
        }
    }

    function filterFunction(idElemento1, idElemento2) {
        var input, filter, ul, li, a, i;
        input = document.getElementById(idElemento2);
        filter = input.value.toUpperCase();
        div = document.getElementById(idElemento1);
        a = div.getElementsByTagName("a");
        for (i = 0; i < a.length; i++) {
            txtValue = a[i].textContent || a[i].innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
            a[i].style.display = "";
            } else {
            a[i].style.display = "none";
            }
        }
    }

    var bandera;
    /**var banderaNombre1 = 0;
    var banderaNombre2 = 0; */

    var nombreBoton1 = "";
    var nombreBoton2 = "";

    function cancelar() {
        limpiarModal();
        if (bandera == 1 && $("#nombresD").val() != "") {
            $("#seleccionar1").text(nombreBoton1);
        } else if (bandera == 2 && $("#nombresL").val() != "") {
            $("#seleccionar2").text(nombreBoton2);
        }
    }

    function asignarDirector() {
        if ($("#nombres").val() != "") {
            if (bandera == 1) {
                $("#nombresD").val($("#nombres").val());
                $("#idD").val($("#id").val());   
                nombreBoton1 = $("#seleccionar1").text()
                $("#tipoAsesor").val("0");
            } else{
                $("#nombresL").val($("#nombres").val());
                $("#idL").val($("#id").val()); 
                nombreBoton2 = $("#seleccionar2").text()
                $("#tipoLector").val("0");
            } 
            $('#exampleModal').modal('hide');
            $('#exampleModalToggle').modal('show');
            limpiarModal();
        } else{
            alertError("Seleccione un empleado!", 'danger', 2, 'liveAlertPlaceholder2', 1); 
        }
    }

    function asignarExterno() {
        if ($("#nombre").val() != "") {
            if (bandera == 1) {
                $("#nombresD").val($("#nombre").val());
                $("#idD").val($("#idExterno").val());   
                nombreBoton1 = $("#seleccionar1").text()
                $("#tipoAsesor").val("1");
            } else{
                $("#nombresL").val($("#nombre").val());
                $("#idL").val($("#idExterno").val()); 
                nombreBoton2 = $("#seleccionar2").text()
                $("#tipoLector").val("1");
            }
            $('#exampleModal2').modal('hide');
            $('#exampleModalToggle').modal('show');
            limpiarModal();
        } else {
            alertError("Seleccione una persona externa!", 'danger', 2, 'liveAlertPlaceholder3', 1);
        }
    }

    function cambiarTexto(boton, nombre) {
        if(boton == 1){
            $("#seleccionar1").text(nombre);
        } else if(boton == 2){
            $("#seleccionar2").text(nombre);
        } 
    }

    function cambiarBoton(cambio, boton, abrir = 0){
        if (abrir == 0) {
            eleccion(boton);   
        } 

        if (cambio == 1) {
            cambiarTexto(boton, "UCA");
            $("#tituloModal").text("Director del trabajo de graduación"); 
            bandera = 1;
        } else if (cambio == 2) {
            cambiarTexto(boton, "Externo");
            $("#tituloModal2").text("Director del trabajo de graduación"); 
            bandera = 1;
        } else if (cambio == 3) {
            cambiarTexto(boton, "UCA");
            $("#tituloModal").text("Segundo Lector"); 
            bandera = 2;
        } else if (cambio == 4) {
            cambiarTexto(boton, "Externo");
            $("#tituloModal2").text("Segundo Lector"); 
            bandera = 2;
        }
    }

    // ----------------------------------- Funciones de registrar grupo ----------------------------------

    function registrarDatosGrupos() {
        var idGrupo = document.getElementById('idGrupo').value;
        var tema = document.getElementById('tema').value;
        var idAsesor = document.getElementById("idD").value;
        var idLector = document.getElementById("idL").value;
        var tipoAsesor = document.getElementById("tipoAsesor").value;
        var tipoLector = document.getElementById("tipoLector").value;
        var prorroga = 0;

        /*
            0 -> UCA
            1 -> Externo
        */
        
        if ($('#prorroga').is(':checked') ) {
            prorroga = 1;
        }
        
        $.ajax({
            type : "POST",
            "serverSide" : true,
            url : "./registrarGrupo",
            data: {"_token": "{{ csrf_token() }}", "id": idGrupo, "tema": tema, "idAsesor": idAsesor, "tipoAsesor": tipoAsesor,
                                                    "idLector": idLector, "tipoLector": tipoLector, "prorroga": prorroga},
            success : function(r) {
                grupos(1);
                if (idGrupo == "") {
                    alertPersonalizado("Grupo de trabajo de graduación registrado con exito!", 'success', 1, ++contadorAlerta);   
                } else{
                    alertPersonalizado("Grupo de trabajo de graduación modificado con exito!", 'success', 1, ++contadorAlerta);   
                }
            },
            error : function(data) {
                console.log(data);
            }
        })

        limpiarModalPrincipal();
    }

    function mostrarDatosModalPrincipal(idGrupoTrabajo) {
        $('#btnCrearGrupo').text('Modificar Grupo')
        /* 
            1 -> UCA - DIRECTOR
            2 -> EXTERNO - DIRECTOR
            3 -> UCA - LECTOR
            4 -> EXTERNO -LECTOR
            ---------------------
            1 -> Seleccionar1
            2 -> Seleccionar2
        */
        $.ajax({
            type : "POST",
            "serverSide" : true,
            url : "./mostrarDatoGrupo",
            data: {"_token": "{{ csrf_token() }}", "id": idGrupoTrabajo},
            success : function(r) {
                $("#idGrupo").val(r['id']);
                $("#tema").val(r['tema']);

                if (r['asesor_interno'] != null) {
                    cambiarBoton(1, 1, 1);
                    $("#idD").val(r['asesor_interno']['id']);
                    $("#nombresD").val(r['asesor_interno']['nombre']+" "+r['asesor_interno']['apellido']);
                } else if(r['asesor_externo'] != null){
                    cambiarBoton(2, 1, 1);
                    $("#idD").val(r['asesor_externo']['id']);
                    $("#nombresD").val(r['asesor_externo']['nombre']+" "+r['asesor_externo']['apellido']);
                }

                if (r['lector_interno'] != null) {
                    cambiarBoton(3, 2, 1);
                    $("#idL").val(r['lector_interno']['id']);
                    $("#nombresL").val(r['lector_interno']['nombre']+" "+r['lector_interno']['apellido']);
                } else if(r['lector_externo'] != null){
                    cambiarBoton(4, 2, 1);
                    $("#idL").val(r['lector_externo']['id']);
                    $("#nombresL").val(r['lector_externo']['nombre']+" "+r['lector_externo']['apellido']);
                }
                if (r['asesor_interno'] != null || r['asesor_externo'] != null) {
                    nombreBoton1 = $("#seleccionar1").text();
                }
                if (r['lector_interno'] != null || r['lector_externo'] != null) {
                    nombreBoton2 = $("#seleccionar2").text();   
                }
            },
            error : function(data) {
                console.log(data);
            }
        })
    }

    // ---------------------------------- Asignar estudiantes al grupo -------------------------------------

    function filterTable() {
        var input, filter, ul, li, a, i;
        input = document.getElementById("buscadorTabla");
        filter = input.value.toUpperCase();
        div = document.getElementById("estudiantes");
        a = div.getElementsByTagName("tr");
        for (i = 0; i < a.length; i++) {
            txtValue = a[i].getElementsByTagName("td")[1].textContent || a[i].getElementsByTagName("td")[1].innerText;
            txtValue2 = a[i].getElementsByTagName("td")[2].textContent || a[i].getElementsByTagName("td")[2].innerText;
            txtValue3 = a[i].getElementsByTagName("th")[0].textContent || a[i].getElementsByTagName("th")[0].innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1 || txtValue2.toUpperCase().indexOf(filter) > -1 
            || txtValue3.toUpperCase().indexOf(filter) > -1 || (txtValue + " " +txtValue2).toUpperCase().indexOf(filter) > -1) {
                a[i].style.display = "";
            } else {
                a[i].style.display = "none";
            }
        }
    }

    var limite = 4;
    var numCont = 4;
    $('.checkEstudiantes').change(function() {
        if($("input:checked").length > limite) {
            this.checked = false;
        } else{
            if (this.checked == true) {
                $("#numEstudiante").text(--numCont);
            } else{
                $("#numEstudiante").text(++numCont);
            }
        }
    });

    function desasignar(cont, cont2) {
        document.getElementById("part-"+cont).remove();
        document.querySelectorAll('#estudiantes tr')[cont2].style.display = 'table-row';
        $("#numEstudiante").text(++numCont);
        ++limite;
    }

    var a = 0;
    function asignarEstudiante() {
        var filas = document.querySelectorAll('#estudiantes tr');
        //var filaAsignar = document.getElementById('asignados');
        var check = document.querySelectorAll('.checkEstudiantes');
        for (let index = 0; index < check.length; index++) {
            if(check[index].checked){
                ++a;
                let est = document.querySelectorAll('#estudiantes tr')[index].querySelectorAll('td');
                let carnet = document.querySelectorAll('#estudiantes tr')[index].querySelectorAll('th');
                fragmento = `
                        <td><button class="btn btn-close" onclick="desasignar(${a}, ${index})"></button></td>
                        <th scope="row">${carnet[0].textContent}</th>
                        <td>${est[1].textContent}</td>
                        <td>${est[2].textContent}</td>
                    `;
                var div = document.createElement('tr');
                div.innerHTML = fragmento;
                --limite;
                div.setAttribute('id', 'part-'+a);
                document.getElementById('asignados').appendChild(div);
                filas[index].style.display = 'none';
                check[index].checked = false;
            }
        }
    }
    
</script>
@endsection 