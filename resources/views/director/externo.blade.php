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
    .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active{
        color: white;
        background-color:#003C71;
        border-color: #003C71;
    }

    .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link{
        color: white;
        background-color: #E87B2A;
        border-color: #dee2e6 #dee2e6 #fff;
    }

    .form-floating > .form-control:not(:-moz-placeholder-shown) ~ label {
        opacity: 1;
        color: rgba(0, 0, 0, 0.5);
        background-color: #fff;
        height: auto;
        padding: 0px;
        padding: 0px 0px 0px 10px;
        width: 100%;
        transform: scale(0.982) translateY(0.045rem) translateX(0.1rem);
        border-radius: 5px 0 0 0;
    }
    .form-floating > .form-control:focus ~ label,
    .form-floating > .form-control:not(:placeholder-shown) ~ label,
    .form-floating > .form-select ~ label {
        opacity: 1;
        color: rgba(0, 0, 0, 0.5);
        background-color: #fff;
        height: auto;
        padding: 0px 0px 0px 10px;
        width: 100%;
        transform: scale(0.982) translateY(0.045rem) translateX(0.1rem);
        border-radius: 5px 0 0 0;
    }
    .form-floating > .form-control:-webkit-autofill ~ label {
        opacity: 1;
        color: rgba(0, 0, 0, 0.5);
        background-color: #fff;
        height: auto;
        padding: 0px;
        padding: 0px 0px 0px 10px;
        width: 100%;
        transform: scale(0.982) translateY(0.045rem) translateX(0.1rem);
        border-radius: 5px 0 0 0;
    }
    .dropEstudiante .dropdown-divider{
        margin: 0;
    }
    .dropEstudiante .dropdown-item{
        padding-top: 10px;
        padding-bottom: 10px;
    }

    .dropEstudiante .dropdown-menu{
        padding: 0;
    }

    #noDatos1, #noDatos2{
        display: none;
    }
</style>
   
    <br>
    <div class="container-fluid container-general">

    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
        </symbol>
        <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
        </symbol>
    </svg>

    <!--------------------------------------------------Modal para crear lector o asesor----------------------------------------->

    <div class="modal fade" id="exampleModalToggle" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #003C71; border-bottom: solid #E87B2A 8px;">
                    <h5 class="modal-title" id="exampleModalToggleLabel" style="color: white;">Registrar Director o Lector externo</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" onclick="limpiarCampos() " aria-label="Close" style="color: white; width: 1em;"></button>
                </div>
                <div class="modal-body">
                    <div id="liveAlertPlaceholder2"></div>
                    <div class="row">
                        <form>
                            <input hidden type="text" id="idExterno">
                            <p>Campos requeridos <span style="color: red;">(*)</span></p>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-floating mb-2 mt-2">
                                        <input type="text" maxlength="100" class="form-control" id="nombre" aria-describedby="emailHelp" placeholder="Ingrese el nombre">
                                        <label for="nombre">Nombres <span style="color: red;">(*)</span></label>
                                        <span style="color: red; display: none;" id="mensajeNombre">¡Ha llegado al limite de 100 caracteres!</span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-floating mb-2 mt-2">
                                        <input type="text" maxlength="100" class="form-control" id="apellido" aria-describedby="emailHelp" placeholder="Ingrese el nombre">
                                        <label for="apellido">Apellidos <span style="color: red;">(*)</span></label>
                                        <span style="color: red; display: none;" id="mensajeApellido">¡Ha llegado al limite de 100 caracteres!</span>
                                    </div>  
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md">
                                    <div class="form-group form-floating mb-3 mt-3">
                                        <input type="text" maxlength="100" class="form-control" id="correo" aria-describedby="emailHelp" placeholder="Ingrese el nombre">
                                        <label for="correo">Correo electronico <span style="color: red;">(*)</span></label>
                                        <span style="color: red; display: none;" id="mensajeCorreo">¡Ha llegado al limite de 100 caracteres!</span>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-group form-floating mb-3 mt-3">
                                    <select class="form-control form-select" id="rol">
                                        <option value = "">Seleccione un rol</option>
                                        <option value = "1">Lector</option>
                                        <option value = "0">Director</option>
                                    </select>
                                    <label for="rol">Rol <span style="color: red;">(*)</span></label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-floating">
                                <textarea class="form-control" id="descripcion" style="height: 160px; resize:none;"></textarea>
                                <label for="descripcion">Descripción</label>
                            </div>
                          </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="mb-3 btn btn-danger" data-bs-dismiss="modal" onclick="limpiarCampos()"><i class="bi bi-x-circle"></i> Cancelar</button>
                    <button type="button" class="mb-3 btn btn-success" onclick="registrarDatos()"><i class="bi bi-save"></i> <span id="btnRegistarExterno">Registrar</span></button>
                </div>
            </div>
        </div>
    </div>

    <!-- Pantalla de grupos de tesis CRUD -->
    <div id="liveAlertPlaceholder"></div>
    <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
          <button onclick="limpiarBuscador(); banderaTipoAD = 1;" class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">LECTORES EXTERNO</button>
          <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false" onclick="limpiarBuscador(); banderaTipoAD = 2;">DIRECTORES EXTERNO</button>
        </div>

        <div class="input-group mb-3 dropEstudiante" style="width: 40%;float: right;margin-top: -55px;">
            <button class="btn btn-primary dropdown-toggle" type="button" id="buscadorEstuiante" data-bs-toggle="dropdown" aria-expanded="false">Nombre</button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#" onclick="$('#buscadorEstuiante').text('Nombre'); banderaBusqueda=1;">Nombre</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#" onclick="$('#buscadorEstuiante').text('Apellido'); banderaBusqueda=2">Apellido</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#" onclick="$('#buscadorEstuiante').text('Correo'); banderaBusqueda=3;">Correo</a></li>
            </ul>
            <input type="search" class="form-control" id="buscadorTablaE" placeholder="Digite su criterio de busqueda">
            <button class="btn btn-secondary" type="button" id="button-addon2" onclick="buscadorAD()"><i class="bi bi-search"></i></button>
        </div>
    </nav>
      <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
            <div class="table-responsive">
                <div class="tableDinamicoLector">
                    <table class="table table-hover align-middle fuente-general" id="tablaLector">
                        <thead class="thead-dark" style="background-color: #003C71; color: white; border-bottom: solid #E87B2A 8px; ">
                        <tr>
                            <th scope="col">NOMBRES</th>
                            <th scope="col">APELLIDOS</th>
                            <th scope="col">CORREO ELECTRÓNICO</th>
                            <th scope="col">ACCIONES</th>
                        </tr>
                        </thead>
                        <tbody id="contenidoLector">
                            @foreach ($lectores as $lector)
                                <tr>
                                    <td style="width: 26%">{{$lector->nombre}}</td>
                                    <td style="width: 26%">{{$lector->apellido}}</td>
                                    <td style="width: 26%">{{$lector->correo}}</td>
                                    <td><button class="btn btn-primary" data-bs-toggle="modal" href="#exampleModalToggle" role="button" data-backdrop="false" type="button" data-bs-target="#exampleModalToggle" onclick="datosModal(<?php echo $lector->id ?>)" style="color: white">Editar</button></td>
                                </tr>
                            @endforeach
                            <tr id="noDatos1">
                                <td colspan="4">¡No hay datos disponibles!</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="paginacionAD">
                        @if ($lectores->total() != 0)
                            <div>
                                <p>Resultados del {{$lectores->firstItem() }} al {{$lectores->lastItem() }} de {{$lectores->total() }}</p>
                            </div>
                        @endif
                        <div id="paginacionLector">
                            {{ $lectores->links('pagination::bootstrap-4') }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
            <div class="table-responsive">
                <div class="tableDinamicoAsesor">
                    <table class="table table-hover align-middle fuente-general" id="tablaAsesor">
                        <thead class="thead-dark" style="background-color: #003C71; color: white; border-bottom: solid #E87B2A 8px; ">
                        <tr>
                            <th scope="col">NOMBRES</th>
                            <th scope="col">APELLIDOS</th>
                            <th scope="col">CORREO ELECTRÓNICO</th>
                            <th scope="col">ACCIONES</th>
                        </tr>
                        </thead>
                        <tbody id="contenidoAsesor">
                            @foreach ($asesores as $asesor)
                                <tr>
                                    <td style="width: 26%">{{$asesor->nombre}}</td>
                                    <td style="width: 26%">{{$asesor->apellido}}</td>
                                    <td style="width: 26%">{{$asesor->correo}}</td>
                                    <td><button class="btn btn-primary" type="button" data-bs-toggle="modal" href="#exampleModalToggle" role="button" data-backdrop="false" data-bs-target="#exampleModalToggle" onclick="datosModal(<?php echo $asesor->id ?>)" style="color: white">Editar</button></td>
                                </tr>
                            @endforeach
                            <tr id="noDatos2">
                                <td colspan="4">¡No hay datos disponibles!</td>
                            </tr>
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
                </div>
            </div>
        </div>
      </div>
      <a class="float-button btn-float-2" data-bs-toggle="modal" href="#exampleModalToggle" role="button" data-backdrop="false" ><i class="bi bi-person-plus-fill float-icon"></i></a>
    <br>
</div>

<script type="text/javascript">
    var paginacionActualLector = 1;
    var paginacionActualAsesor = 1;
    var banderaBusqueda = 1;
    var banderaTipoAD = 1;
    var Busqueda = "";
     
    // Verifica si contiene datos las dos tablas, en caso no tengan datos, se coloca el mensaje de que no hay datos disponibles.
    if (document.querySelectorAll("#contenidoLector tr").length == 1) {
        document.getElementById("noDatos1").style.display = "table-row";    
    }

    if (document.querySelectorAll("#contenidoAsesor tr").length == 1) {
        document.getElementById("noDatos2").style.display = "table-row";    
    }

    const alertPersonalizado2 = (message, type, icon, cont=0) => {
        const alertPlaceholder = document.getElementById('liveAlertPlaceholder2');
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

    const lector = (page) => {
        $.ajax({
            type : "GET",
            "serverSide" : true,
            url : "./externo",
            data: { "page": page, "vista": 'director.tableLector', "tipoLectorAsesor": banderaTipoAD, "tipoBusqueda": banderaBusqueda, 
            "busqueda":  Busqueda},
            dataType: 'json',
            success : function(r) {
                $(".tableDinamicoLector").html(r);
                total = document.querySelectorAll("#contenidoLector tr").length;                
                if (total == 1) {
                    document.getElementById("noDatos1").style.display = "table-row";    
                }
            },
            error : function(data) {
                console.log(data);
            }
        })
    }

    const asesor = (page) => {
        $.ajax({
            type : "GET",
            "serverSide" : true,
            url : "./externo",
            data: { "page": page, "vista": 'director.tableAsesor', "tipoLectorAsesor": banderaTipoAD, "tipoBusqueda": banderaBusqueda, 
            "busqueda":  Busqueda},
            dataType: 'json',
            success : function(r) {
                $(".tableDinamicoAsesor").html(r);
                total = document.querySelectorAll("#contenidoAsesor tr").length;
                
                if (total == 1) {
                    document.getElementById("noDatos2").style.display = "table-row";    
                }
            },
            error : function(data) {
                console.log(data);
            }
        })
    }

    $(document).on('click', '#paginacionLector .pagination a', function(e){
        e.preventDefault();
        var page = $(this).attr('href').split('page=')[1];
        paginacionActualLector = page;
        lector(page);
    })

    $(document).on('click', '#paginacionAsesor .pagination a', function(e){
        e.preventDefault();
        var page = $(this).attr('href').split('page=')[1];
        asesor(page);
        paginacionActualAsesor = page;
    })

    function limpiarCampos() {
        document.getElementById("idExterno").value = "";
        document.getElementById("nombre").value = "";
        document.getElementById("apellido").value = "";
        document.getElementById("correo").value = "";
        document.getElementById("rol").value = "";
        document.getElementById("descripcion").value = ""; 
        document.getElementById("btnRegistarExterno").innerText = "Registrar";
        document.getElementById("exampleModalToggleLabel").innerText = "Registrar Director o Lector externo";
        document.getElementById('mensajeNombre').style.display = "none";
        document.getElementById('mensajeApellido').style.display = "none";
        document.getElementById('mensajeCorreo').style.display = "none";
    }

    var contadorMensajes = 0;

    var rolActual = 0;
    
    function registrarDatos() {
        var nombre = document.getElementById("nombre").value;
        var apellido = document.getElementById("apellido").value;
        var correo = document.getElementById("correo").value;
        var rol = document.getElementById("rol").value;
        var descripcion = document.getElementById("descripcion").value;
        var idExterno = document.getElementById("idExterno").value;
        
        var patronEmail = /\S+@\S+\.\S+/;
        var verificar = patronEmail.exec(correo);

        if (nombre.trim() == "" || apellido.trim() == "" || correo.trim() == "" || rol.trim() == "") {
            alertPersonalizado2("¡Necesita llenar todos los campos!", 'danger', 2, 1)   
        } else {
            if (verificar != null) {
                $.ajax({
                    type : "POST",
                    "serverSide" : true,
                    url : "./registrarLA",
                    data: {"_token": "{{ csrf_token() }}", "nombre": nombre, "apellido": apellido, "correo": correo, "descripcion": descripcion, "rol": rol, "id": idExterno},
                    success : function(r) {
                        if (r == "") {
                            if(idExterno == ""){
                                if (rol == 0) { //asesor
                                    asesor(1);
                                    alertPersonalizado("¡Asesor registrado con exito!", 'success', 1, ++contadorMensajes);   
                                } else if(rol == 1){ //lector
                                    lector(1);
                                    alertPersonalizado("¡Lector registrado con exito!", 'success', 1, ++contadorMensajes);
                                }
                            } else{
                                if (rolActual == rol) {
                                    asesor(paginacionActualAsesor);
                                    lector(paginacionActualLector);   
                                } else{
                                    if (rol == 0) { // asesor
                                        asesor(1);
                                        lector(paginacionActualLector);   
                                    } else if(rol == 1){
                                        asesor(paginacionActualAsesor);
                                        lector(1);   
                                    }
                                }
                                alertPersonalizado("¡Datos modificados con exito!", 'success', 1, ++contadorMensajes);
                            }
                            limpiarCampos();
                            $('#exampleModalToggle').modal('hide');   
                        } else {
                            alertPersonalizado2("¡Ya hay un lector o director con los mismos datos!", 'danger', 2, 1)   
                        }
                    },
                    error : function(data) {
                        console.log(data);
                    }
                })
            } else{
                alertPersonalizado2("¡El correo no tiene el formato adecuado!", 'danger', 2, 1)   
            }
        }
    }

    function datosModal(idExterno) {
        document.getElementById("idExterno").value = idExterno;
        $.ajax({
            type : "POST",
            "serverSide" : true,
            url : "./mostrarDato",
            data: {"_token": "{{ csrf_token() }}", "id": idExterno},
            success : function(r) {
                document.getElementById("nombre").value = r['nombre'];
                document.getElementById("apellido").value = r['apellido'];
                document.getElementById("correo").value = r['correo'];
                document.getElementById("rol").value = r['rol_externo'];
                rolActual = r['rol_externo'];
                document.getElementById("descripcion").value = r['descripcion'];
                if(r['rol_externo'] == 0){
                    document.getElementById("exampleModalToggleLabel").innerText = "Modificar datos del Director";
                } else if(r['rol_externo'] == 1){
                    document.getElementById("exampleModalToggleLabel").innerText = "Modificar datos del Lector";
                }
                document.getElementById("btnRegistarExterno").innerText = "Modificar";
            },
            error : function(data) {
                console.log(data);
            }
        })
    }

    var banderaAccionBuscar = 1;

    function buscadorAD() {
        Busqueda = $("#buscadorTablaE").val();
        if (banderaTipoAD == 1) {
            lector(1);   
        } else{
            asesor(1);
        }
        banderaAccionBuscar = 0;
    }

    document.querySelector('#buscadorTablaE').addEventListener ('keypress',function(e){
        validar(e);
    })

    document.querySelector('#buscadorTablaE').addEventListener ('input',function(e){
        if ($('#buscadorTablaE').val() == "" && banderaAccionBuscar == 0) {
            Busqueda = $("#buscadorTablaE").val();
            $('#buscadorTablaE').val('');
            if (banderaTipoAD == 1) {
                lector(1);   
            } else{
                asesor(1);
            }
            banderaAccionBuscar = 1;
        }
    })

    function validar(e) {
        let tecla = (document.all) ? e.keyCode : e.which;
        if (tecla==13){
            buscadorAD()
        };
    }

    function limpiarBuscador() {
        $('#buscadorEstuiante').text('Nombre'); 
        $('#buscadorTablaE').val('');
        Busqueda = $("#buscadorTablaE").val();
        banderaBusqueda=1;
        if (banderaTipoAD == 1) {
            lector(1);   
        } else{
            asesor(1);
        }
    }

    // --------------------------- Validación del numero de caracteres de un input --------------------------------
    document.querySelector('#nombre').addEventListener ('keyup',function(e){
        var texto = document.getElementById('nombre').value;
        if (texto.length == 100) {
            document.getElementById('mensajeNombre').style.display = "block";
        } else if (texto.length <= 99) {
            document.getElementById('mensajeNombre').style.display = "none";
        }
    })

    document.querySelector('#apellido').addEventListener ('keyup',function(e){
        var texto = document.getElementById('apellido').value;
        if (texto.length == 100) {
            document.getElementById('mensajeApellido').style.display = "block";
        } else if (texto.length <= 99) {
            document.getElementById('mensajeApellido').style.display = "none";
        }
    })

    document.querySelector('#correo').addEventListener ('keyup',function(e){
        var texto = document.getElementById('correo').value;
        if (texto.length == 100) {
            document.getElementById('mensajeCorreo').style.display = "block";
        } else if (texto.length <= 99) {
            document.getElementById('mensajeCorreo').style.display = "none";
        }
    })
    
</script>
@endsection 