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

    <!--------------------------------------------------Modal para crear lector o asesor----------------------------------------->

    <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1" data-backdrop="false">
        <div class="modal-dialog modal-dialog-centered modal-xl">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #003C71; border-bottom: solid #E87B2A 8px;">
                    <h5 class="modal-title" id="exampleModalToggleLabel" style="color: white;">Registrar asesor o lector externo</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" onclick="limpiarCampos() " aria-label="Close" style="color: white; width: 1em;"></button>
                </div>
                <div class="modal-body">
                    <div id="liveAlertPlaceholder2"></div>
                    <div class="row">
                        <form>
                            <input hidden type="text" id="idExterno">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-floating mb-2 mt-2">
                                        <input type="text" class="form-control" id="nombre" aria-describedby="emailHelp" placeholder="Ingrese el nombre">
                                        <label for="nombre">Nombres</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-floating mb-2 mt-2">
                                        <input type="text" class="form-control" id="apellido" aria-describedby="emailHelp" placeholder="Ingrese el nombre">
                                        <label for="apellido">Apellidos</label>
                                    </div>  
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md">
                                    <div class="form-group form-floating mb-3 mt-3">
                                        <input type="text" class="form-control" id="correo" aria-describedby="emailHelp" placeholder="Ingrese el nombre">
                                        <label for="correo">Correo electronico</label>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-group form-floating mb-3 mt-3">
                                    <select class="form-control form-select" id="rol">
                                        <option value = "">Seleccione un rol</option>
                                        <option value = "1">Lector</option>
                                        <option value = "0">Asesor</option>
                                    </select>
                                    <label for="rol">Rol</label>
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
          <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">LECTORES EXTERNO</button>
          <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">ASESORES EXTERNO</button>
        </div>
    </nav>
      <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
            <div class="table-responsive">
                <div class="tableDinamicoLector">
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
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
            <div class="table-responsive">
                <div class="tableDinamicoAsesor">
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
                </div>
            </div>
        </div>
      </div>
    <div class="row d-flex flex-row-reverse mt-3">
        <a class="float-button" onclick="myModal.show()" href="#exampleModalToggle" role="button" data-backdrop="false" style="width: 15%; right: 0px;" ><i class="bi bi-person-plus-fill float-icon"></i></a>
    </div>
    <br>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript">
    var paginacionActualLector = 1;
    var paginacionActualAsesor = 1;
    var myModal = new bootstrap.Modal(document.getElementById('exampleModalToggle'), {
        keyboard: false
    });

    $("#exampleModalToggle").on("hidden.bs.modal", function () { 
        limpiarCampos();
    });

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
            data: { "page": page, "vista": 'director.tableLector'},
            dataType: 'json',
            success : function(r) {
                $(".tableDinamicoLector").html(r);
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

    const asesor = (page) => {
        $.ajax({
            type : "GET",
            "serverSide" : true,
            url : "./externo",
            data: { "page": page, "vista": 'director.tableAsesor'},
            dataType: 'json',
            success : function(r) {
                $(".tableDinamicoAsesor").html(r);
            },
            error : function(data) {
                console.log(data);
            }
        })
    }

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
        document.getElementById("exampleModalToggleLabel").innerText = "Registrar asesor o lector externo";
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
            alertPersonalizado2("Necesita llenar todos los campos!", 'danger', 2, 1)   
        } else {
            if (verificar != null) {
                $.ajax({
                    type : "POST",
                    "serverSide" : true,
                    url : "./registrarLA",
                    data: {"_token": "{{ csrf_token() }}", "nombre": nombre, "apellido": apellido, "correo": correo, "descripcion": descripcion, "rol": rol, "id": idExterno},
                    success : function(r) {
                        if(idExterno == ""){
                            if (rol == 0) { //asesor
                                asesor(1);
                                alertPersonalizado("Asesor registrado con exito!", 'success', 1, ++contadorMensajes);   
                            } else if(rol == 1){ //lector
                                lector(1);
                                alertPersonalizado("Lector registrado con exito!", 'success', 1, ++contadorMensajes);
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
                            alertPersonalizado("Datos modificados con exito!", 'success', 1, ++contadorMensajes);
                        }
                        limpiarCampos();
                        $('#exampleModalToggle').modal('hide');
                    },
                    error : function(data) {
                        console.log(data);
                    }
                })
            } else{
                alertPersonalizado2("El correo no tiene el formato adecuado!", 'danger', 2, 1)   
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
                    document.getElementById("exampleModalToggleLabel").innerText = "Modificar datos del asesor";
                } else if(r['rol_externo'] == 1){
                    document.getElementById("exampleModalToggleLabel").innerText = "Modificar datos del lector";
                }
                document.getElementById("btnRegistarExterno").innerText = "Modificar";
                myModal.show();
            },
            error : function(data) {
                console.log(data);
            }
        })
    }
    
</script>
@endsection 