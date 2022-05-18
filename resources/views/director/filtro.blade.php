@extends('plantillas.navdirector')
@section('content')
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <title>Filtros</title>
</head>

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

    #myInput {
    box-sizing: border-box;
    background-image: url('searchicon.png');
    background-position: 14px 12px;
    background-repeat: no-repeat;
    font-size: 16px;
    padding: 14px 20px 12px 45px;
    border: none;
    border-bottom: 1px solid #ddd;
    }

    #myInput {outline: 3px solid #ddd;}

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
</style>
   
    <br>
    <div class="container">
        <!--<form action="{{ url('/asignarDocente') }}" method="post">
            {{ csrf_field() }}
            <label class="form-label">Asesor</label>
            <div class="row">
                <div class="col-md-2">
                    <div class="dropdown">
                        <button onclick="myFunction(1)" type="button" id="seleccionar1" class="btn btn-warning dropdown-toggle" style="width: 100%;">Seleccionar</button>
                        <div id="myDropdown1" class="dropdown-content">
                            <div class="scrollable-menu">
                                <a href="#" onclick="eliminarLector(1); myFunction(1)">Quitar Elección</a>
                                <a data-bs-toggle="modal" data-bs-target="#exampleModal" href="#" onclick="cambiarBoton(1, 1)">UCA</a>
                                <a data-bs-toggle="modal" data-bs-target="#exampleModal2" href="#" onclick="cambiarBoton(2, 1)">Externo</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <input type="text" readonly class="form-control" id="nombresD" name="nombresD" aria-label="Username" aria-describedby="basic-addon1">
                    <input type="text" readonly style='display: none' class="form-control" id="idD" name="idD" aria-label="Username" aria-describedby="basic-addon1">
                </div>
            </div>
            <br>
            <label class="form-label">Lector</label>
            <div class="row">
                <div class="col-md-2">
                    <div class="dropdown">
                        <button onclick="myFunction(2)" type="button" id="seleccionar2" class="btn btn-warning dropdown-toggle" style="width: 100%;">Seleccionar</button>
                        <div id="myDropdown2" class="dropdown-content">
                            <div class="scrollable-menu"> 
                                <a href="#" onclick="eliminarLector(2); myFunction(2)">Quitar Elección</a>
                                <a data-bs-toggle="modal" data-bs-target="#exampleModal" href="#" onclick="cambiarBoton(3, 2)">UCA</a>
                                <a data-bs-toggle="modal" data-bs-target="#exampleModal2" href="#" onclick="cambiarBoton(4, 2)">Externo</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <input type="text" readonly class="form-control" id="nombresL" name="nombresL" aria-label="Username" aria-describedby="basic-addon1">
                    <input type="text" readonly style='display: none' class="form-control" id="idL" name="idL" aria-label="Username" aria-describedby="basic-addon1">
                </div>
            </div>
            <br>
            <input type="submit" value="Guardar" class="btn btn-success">
        </form>-->

    <!--------------------------------------------------Modal para Asesor o Lector UCA----------------------------------------->

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="tituloModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            <div class="modal-header" style="background-color: #003C71;">
                <h5 class="modal-title" id="tituloModal" style="color: white;"></h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close" onclick="cancelar()"></button>
            </div>
            <div class="modal-body">
            <div class='container'>
            <div class='row'>
                <div class="col">
                    <div class="form-group">
                        <label for="cmb1">Facultad</label> 
                        <select class="form-control" id="cmb1">
                            <option value="0">Seleccione una opción</option>
                            <option value="1">Arquitectura e ingenierías</option>
                            <option value="2">Comunicaciones y Mercadeo</option>
                        </select>
                    </div>
                </div>
            </div>
            <br>
            <div class='row'>
                <div class="col">
                    <div class="form-group">
                        <label for="cmb2">Carrera</label> 
                        <select class="form-control" id="cmb2">
                            <!--  th:field="*{municipio.idMunicipio}"  -->
                            <option value="0">Seleccione una opción</option>
                            @php
                                $cont = 0;
                            @endphp
                            @foreach ($docentes as $docente)
                                @php
                                    ++$cont;
                                @endphp
                                <option value="{{$cont}}">{{$docente[0]}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
            <br>

            <div class="row">
                <form action="{{ url('/asignarDocente') }}" method="post">
                    {{ csrf_field() }}
                    <label>Docente</label> 
                    <div class="row">
                        <div class="col-md-4">
                            <div class="dropdown">
                                <button onclick="myFunction(3)" type="button" class="btn btn-warning dropdown-toggle">Seleccionar</button>
                                <div id="myDropdown3" class="dropdown-content">
                                    <input type="text" placeholder="Buscar.." id="myInput" onkeyup="filterFunction()">
                                    <div id="Tdocentes" class="scrollable-menu">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="input-group">                                    
                                <input type="text" disabled class="form-control ms-3" id="nombres" aria-label="Username" aria-describedby="basic-addon1">
                                <input type="text" style='display: none' disabled class="form-control" id="id" aria-label="Username" aria-describedby="basic-addon1">
                            </div>
                        </div>
                    </div>
                    <br>
                </form>
            </div>
        </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="cancelar()" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">Cancelar</button>
            <button type="button" class="btn btn-success" data-bs-dismiss="modal" onclick="asignarDirector()" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">Asignar</button>
        </div>
        </div>
    </div>
    </div>
    
    <!------------------------------------------------Modal para Asesores o Lector externo-------------------------------------->
    
    <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="false">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            <div class="modal-header" style="background-color: #003C71;">
                <h5 class="modal-title" id="tituloModal2" style="color: white;"></h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close" onclick="cancelar()"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col">
                        <div class="dropdown">
                            <button onclick="myFunction()" type="button" class="btn btn-warning dropdown-toggle">Seleccionar</button>
                            <div id="myDropdown" class="dropdown-content">
                                <input type="text" placeholder="Buscar.." id="myInput" onkeyup="filterFunction()">
                                <div id="Tdocentes" class="scrollable-menu">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col">
                        <label for="basic-url" class="form-label">Nombre</label>
                        <div class="input-group mb-3">
                            <input disabled type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <label for="basic-url" class="form-label">Descripción</label>
                        <div class="input-group mb-3">
                            <textarea disabled style="resize: none;" class="form-control" placeholder="" rows=5 id="floatingTextarea"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="cancelar()">Cancelar</button>
                <button type="button" class="btn btn-success">Asignar</button>
            </div>
            </div>
        </div>
    </div>

    <!--------------------------------------------------Modal para crear grupo----------------------------------------->

    <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1" data-backdrop="false">
        <div class="modal-dialog modal-dialog-centered modal-xl">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #003C71;">
                    <h5 class="modal-title" id="exampleModalToggleLabel" style="color: white;">Crear Grupo</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close" style="color: white"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                             
                            <div class="form-group form-floating">
                                <input type="text" id="tema" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="Ingrese el tema de trabajo de graduacion">
                                <label for="tema">Tema de trabajo de graduacion</label>
                            </div>
                            <br>
                            <label>Asesor</label> 
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="dropdown">
                                        <button onclick="myFunction(1)" type="button" id="seleccionar1" class="btn btn-warning dropdown-toggle">Seleccionar</button>
                                        <div id="myDropdown1" class="dropdown-content">
                                            <input type="text" placeholder="Buscar.." id="myInput" onkeyup="filterFunction()">
                                            <div class="scrollable-menu">
                                                <a href="#" onclick="eliminarLector(1); myFunction(1)">Quitar Elección</a>
                                                <a data-bs-toggle="modal" data-bs-target="#exampleModal" href="#" onclick="cambiarBoton(1, 1)">UCA</a>
                                                <a data-bs-toggle="modal" data-bs-target="#exampleModal2" href="#" onclick="cambiarBoton(2, 1)">Externo</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div class="input-group ms-4" style="width: 95%">
                                        <input type="text" readonly class="form-control" id="nombresD" name="nombresD" aria-label="Username" aria-describedby="basic-addon1" style="background-color: white">
                                        <input type="text" readonly style='display: none' class="form-control" id="idD" name="idD" aria-label="Username" aria-describedby="basic-addon1">
                                    </div>
                                </div>
                            </div>
                            <br>
                            <label>Lector</label> 
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="dropdown">
                                        <button onclick="myFunction(2)" type="button" id="seleccionar2" class="btn btn-warning dropdown-toggle" >Seleccionar</button>
                                        <div id="myDropdown2" class="dropdown-content">
                                            <input type="text" placeholder="Buscar.." id="myInput" onkeyup="filterFunction()">
                                            <div class="scrollable-menu">
                                                <a href="#" onclick="eliminarLector(2); myFunction(2)">Quitar Elección</a>
                                                <a data-bs-toggle="modal" data-bs-target="#exampleModal" href="#" onclick="cambiarBoton(3, 2)">UCA</a>
                                                <a data-bs-toggle="modal" data-bs-target="#exampleModal2" href="#" onclick="cambiarBoton(4, 2)">Externo</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div class="input-group ms-4" style="width: 95%">
                                        <input type="text" readonly class="form-control" id="nombresL" name="nombresL" aria-label="Username" aria-describedby="basic-addon1" style="background-color: white">
                                        <input type="text" readonly style='display: none' class="form-control" id="idL" name="idL" aria-label="Username" aria-describedby="basic-addon1">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <a href="" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal45">Asignar estudiantes</a>
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
                    <button class="btn btn-primary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">Crear grupo</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Pantalla de grupos de tesis CRUD -->

    <div class="table-responsive">
        <table class="table table-hover">
            <thead class="thead-dark" style="background-color: #003C71; color: white;">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Tema de Tesis</th>
                <th scope="col">Numero de integrantes</th>
                <th scope="col">Acciones</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Proyecto para el desarrollo de plantillas para documentos de tesis</td>
                <td>4</td>
                <td><button class="btn btn-warning" type="button" data-bs-toggle="modal" data-bs-target="#exampleModalToggle" onclick="asignarEstudiante()" style="color: white">Editar</button><button class="btn btn-danger ms-1" onclick="">Eliminar</button></td>
                <td></td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
                <td></td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td colspan="2">Larry the Bird</td>
                <td>@twitter</td>
                <td></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="row d-flex flex-row-reverse mt-3">
        <a class="float-button" data-bs-toggle="modal" href="#exampleModalToggle" role="button" data-backdrop="false" style="width: 15%; right: 0px;" ><i class="bi bi-people-fill float-icon" style="border-radius: 100%"></i></a>
    </div>
    <br>

    <!--------------------------------------------------Modal para estudiantes----------------------------------------->

    <div class="modal fade" id="exampleModal45" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog modal-dialog-centered">
            <div class="modal-content">
            <div class="modal-header" style="background-color: #003C71;">
                <h5 class="modal-title" id="exampleModalLabel" style="color: white">Estudiantes</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
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
                <button type="button" class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" onclick="asignarEstudiante()">Asignar</button>
            </div>
            </div>
        </div>
    </div>
    </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript">
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
    var bandera;
    
    function eliminarLector(eleccion) {
        if(eleccion == 1){
            $("#nombresD").val($("#nombres").val());
            $("#idD").val($("#id").val());  
            $("#seleccionar1").text("Seleccionar");
        } else if (eleccion == 2) {
            $("#nombresL").val($("#nombres").val());
            $("#idL").val($("#id").val());  
            $("#seleccionar2").text("Seleccionar");
        }
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

    /* When the user clicks on the button,
    toggle between hiding and showing the dropdown content */
    function myFunction(boton) {
        if(boton == 1){
            document.getElementById("myDropdown1").classList.toggle("show");
        } else if(boton == 2){
            document.getElementById("myDropdown2").classList.toggle("show");
        } else if(boton == 3){
            document.getElementById("myDropdown3").classList.toggle("show");
        }
    }

    function myFunction2(nombre, id, eleccionB) {
        eleccion(eleccionB);
        $("#nombres").val(nombre);        
        $("#id").val(id);        
    }

    function limpiarModal() {
        $("#nombres").val("");
        $("#id").val("");
        $("#cmb1 option[value=0]").attr("selected",true);
        $("#cmb2 option[value=0]").attr("selected",true);
        $('#Tdocentes').empty();
        
        if (bandera == 1 && $("#nombresD").val() == "") {
            $("#seleccionar1").text("Seleccionar");
        } else if (bandera == 2 && $("#nombresL").val() == "") {
            $("#seleccionar2").text("Seleccionar");
        }
    }

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

    function asignarDirector(nombre, id) {
        if (bandera == 1) {
            $("#nombresD").val($("#nombres").val());
            $("#idD").val($("#id").val());   
            nombreBoton1 = $("#seleccionar1").text()
        } else{
            $("#nombresL").val($("#nombres").val());
            $("#idL").val($("#id").val()); 
            nombreBoton2 = $("#seleccionar2").text()
        }
        
        limpiarModal();
    }

    function cambiarTexto(boton, nombre) {
        if(boton == 1){
            $("#seleccionar1").text(nombre);
        } else if(boton == 2){
            $("#seleccionar2").text(nombre);
        } 
    }

    function cambiarBoton(cambio, boton){
        eleccion(boton);
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

    function filterFunction() {
        var input, filter, ul, li, a, i;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        div = document.getElementById("myDropdown3");
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

    $(document).ready(
        function() {
            $("#cmb1").change(function(){
                prueba();
            });

            $("#cmb2").change(function(){
                $("#nombres").val("");
                $("#id").val("");
                prueba2();
            });
        }
    )

    function limpiar() {
        $('#cmb2').empty();
        var select = document.getElementById("cmb2");
		$("<option/>").val(0).text("Seleccione una opción").appendTo("#cmb2");
    }

    function agregarCmb(docentes) {
        if (docentes != "") {
            var cont = 1;
            docentes.forEach(element => {
                $("<option/>").val(cont++).text(element[0]).appendTo("#cmb2");
            });
        }
    }

    function agregarCmb2(docentes) {
        $('#Tdocentes').empty();
        docentes.forEach(element => {
            var div2 = `<a href="#about" onclick="myFunction2('${element[0]}', '${element[1]}', 3)">${element[0]}</a>`;
            var div = document.createElement('div');
                    div.innerHTML = div2;
                document.getElementById('Tdocentes').appendChild(div); 
        });
            //document.getElementById('seccion').appendChild(div);
    }

    function prueba() {
        var id = document.getElementById("cmb1").value;
        $.ajax({
            type : "POST",
            "serverSide" : true,
            url : "./filtroPost",
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

    var hola;

    function prueba2() {
        var id = document.getElementById("cmb2").value;
        $.ajax({
            type : "POST",
            "serverSide" : true,
            url : "./filtroPost2",
            data: {"_token": "{{ csrf_token() }}", "id": id},
            success : function(r) {
                agregarCmb2(r);
                hola = r;
            },
            error : function(data) {
                console.log(data);
            }
        })
    }

    function eliminarBusqueda() {
        agregarCmb2(hola);
        $('#eliminarB').hide();
        $("#buscar").val("");
    }

    function prueba3() {
        $('#eliminarB').show();
        $.ajax({
            type : "POST",
            "serverSide" : true,
            url : "./buscador",
            data: {"_token": "{{ csrf_token() }}", "datos": JSON.stringify(hola), "busqueda":  $("#buscar").val()},
            success : function(r) {
                agregarCmb2(r);
            },
            error : function(data) {
                console.log(data);
            }
        })
    }  
    
</script>
@endsection 