@extends('plantillas.nav')
@section('content')
    <style>
        .mPrincipal {
            border: #003C71 1px solid;
            background-color: #e3eef5;
        }

        .card-menu {
            border: 2px #003C71 solid;
            transition: all 0.5s;
        }


        .body-card {
            transition: all 0.5s;
        }

        .card-menu:hover {
            border: 2px #E87B2A solid;
        }

        .card-menu:hover .img-card {
            transform: translateY(5px);
        }

        .card-menu:hover .body-card {
            transform: translateY(-5px);
            cursor: pointer;
        }

        .dropbtn {
            background-color: #04AA6D;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

        .dropbtn:hover,
        .dropbtn:focus {
            background-color: #3e8e41;
        }

        #myInput,
        #myInput2 {
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

        #myInput,
        #myInput2 {
            outline: 3px solid #ddd;
        }

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

        .dropdown a:hover {
            background-color: #ddd;
        }

        .show {
            display: block;
        }

        .scrollable-menu {
            height: auto;
            max-height: 200px;
            overflow-x: hidden;
        }

        .containerToogle {
            display: flex;
            align-items:
        }

        .containerToogle>div:nth-child(1) {
            width: 30%;
        }

        .containerToogle>div:nth-child(2) {
            width: 70%;
        }

        .containerToogle>div:nth-child(1)>.dropdown>button {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .containerToogle>div:nth-child(1)>.dropdown>button:focus {
            outline: none;
            box-shadow: none;
        }

        .dropEstudiante .dropdown-divider {
            margin: 0;
        }

        .dropEstudiante .dropdown-item {
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .dropEstudiante .dropdown-menu {
            padding: 0;
        }

        #noDatos3 {
            display: none;
        }

        .dropbtn {
            background-color: #04AA6D;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

        .dropbtn:hover,
        .dropbtn:focus {
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

        #myInput {
            outline: 3px solid #ddd;
        }

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

        .dropdown a:hover {
            background-color: #ddd;
        }

        .show {
            display: block;
        }

        .scrollable-menu {
            height: auto;
            max-height: 200px;
            overflow-x: hidden;
        }

        .nav-tabs .nav-item.show .nav-link,
        .nav-tabs .nav-link.active {
            color: white;
            background-color: #003C71;
            border-color: #003C71;
        }

        .nav-tabs .nav-item.show .nav-link,
        .nav-tabs .nav-link {
            color: white;
            background-color: #E87B2A;
            border-color: #dee2e6 #dee2e6 #fff;
        }

        .form-floating>.form-control:not(:-moz-placeholder-shown)~label {
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

        .form-floating>.form-control:focus~label,
        .form-floating>.form-control:not(:placeholder-shown)~label,
        .form-floating>.form-select~label {
            opacity: 1;
            color: rgba(0, 0, 0, 0.5);
            background-color: #fff;
            height: auto;
            padding: 0px 0px 0px 10px;
            width: 100%;
            transform: scale(0.982) translateY(0.045rem) translateX(0.1rem);
            border-radius: 5px 0 0 0;
        }

        .form-floating>.form-control:-webkit-autofill~label {
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

        .dropEstudiante .dropdown-divider {
            margin: 0;
        }

        .dropEstudiante .dropdown-item {
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .dropEstudiante .dropdown-menu {
            padding: 0;
        }

        #noDatos1,
        #noDatos2 {
            display: none;
        }
    </style>

    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path
                d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
        </symbol>
        <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path
                d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
        </symbol>
    </svg>

    <br>
    <div class="container-fluid container-general">


        <!--------------------------------------------------Modal para crear usuarios en  el sistema----------------------------------------->

        <div class="modal fade" id="exampleModalToggle" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #003C71; border-bottom: solid #E87B2A 8px;">
                        <h5 class="modal-title" id="exampleModalToggleLabel" style="color: white;">Registrar Empleado</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                            onclick="limpiarCampos() " aria-label="Close" style="color: white; width: 1em;"></button>
                    </div>
                    <form method="POST" action="/nuevoEmpleado">
                        @csrf
                        <div class="modal-body">
                            <div id="liveAlertPlaceholder2"></div>
                            <div class="row">
                                <input hidden type="text" id="idExterno">
                                <p>Campos requeridos <span style="color: red;">(*)</span></p>
                                <div class="row">
                                    <div class="col-md">
                                        <div class="form-group form-floating mb-3 mt-3">
                                            <input type="text" maxlength="100" class="form-control"
                                                name="codigo_empleado" aria-describedby="emailHelp"
                                                placeholder="Ingrese los nombres">
                                            <label for="codigo_empleado">Codigo de empleado <span
                                                    style="color: red;">(*)</span></label>
                                            <span style="color: red; display: none;" id="mensajeNombre">¡Ha llegado al
                                                limite de 100 caracteres!</span>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div class="form-group form-floating mb-3 mt-3">
                                            <input type="text" maxlength="100" class="form-control" name="nombre"
                                                aria-describedby="emailHelp" placeholder="Ingrese los nombres">
                                            <label for="nombre">Nombres <span style="color: red;">(*)</span></label>
                                            <span style="color: red; display: none;" id="mensajeNombre">¡Ha llegado al
                                                limite de 100 caracteres!</span>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div class="form-group form-floating mb-3 mt-3">
                                            <input type="text" maxlength="100" class="form-control" name="apellido"
                                                aria-describedby="emailHelp" placeholder="Ingrese los apellidos">
                                            <label for="apellido">Apellidos <span style="color: red;">(*)</span></label>
                                            <span style="color: red; display: none;" id="mensajeApellido">¡Ha llegado al
                                                limite de 100 caracteres!</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md">
                                        <div class="form-group form-floating mb-3 mt-3">
                                            <select class="form-control form-select" name="tipo_empleado_id">
                                                @foreach ($tipos_empleado as $tipo)
                                                    <option value="{{ $tipo->id }}">{{ $tipo->nombre_tipo_empleado }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            <label for="tipo_empleado_id">Tipo de empleado <span
                                                    style="color: red;">(*)</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div class="form-group form-floating mb-3 mt-3">
                                            <select class="form-control form-select" name="cargo_id">
                                                @foreach ($cargos as $cargo)
                                                    <option value="{{ $cargo->id }}">{{ $cargo->nombre_cargo }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            <label for="cargo_id">Cargo de empleado <span
                                                    style="color: red;">(*)</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div class="form-group form-floating mb-3 mt-3">
                                            <select class="form-control form-select" name="departamento_unidad_id">
                                                @foreach ($departamentos_u as $dpto)
                                                    <option value="{{ $dpto->id }}">{{ $dpto->nombre_departamento }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            <label for="departamento_unidad_id">Departamento/Unidad <span
                                                    style="color: red;">(*)</span></label>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="mb-3 btn btn-danger" data-bs-dismiss="modal"><i
                                        class="bi bi-x-circle"></i> Cancelar</button>
                                <button type="submit" class="mb-3 btn btn-success"><i class="bi bi-save"></i> <span
                                        id="btnRegistarExterno">Registrar</span></button>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home"
                type="button" role="tab" aria-controls="nav-home" aria-selected="true">EMPLEADOS</button>
        </div>

        <div class="input-group mb-3 dropEstudiante" style="width: 40%;float: right;margin-top: -55px;">
            <button class="btn btn-primary dropdown-toggle" type="button" id="buscadorEstuiante"
                data-bs-toggle="dropdown" aria-expanded="false">Nombre</button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Codigo de empleado</a></li>
                <li>
                    <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item" href="#">Nombre</a></li>
                <li>
                    <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item">Apellido</a></li>
            </ul>
            <input type="search" class="form-control" id="buscadorTablaE" placeholder="Digite su criterio de busqueda">
            <button class="btn btn-secondary" type="button" id="button-addon2" onclick="buscadorAD()"><i
                    class="bi bi-search"></i></button>
        </div>
    </nav>

    <!--Tabla para desplegar datos de usuarios registrados en el sistema-->
    <div class="table-responsive">
        <div id="liveAlertPlaceholder"></div>
        <div id="tablaUsuariosContainer">
            <table class="table table-hover align-middle fuente-general fuente general" id="tableUserDashboard"">
                <thead class=" thead-dar"
                    style="background-color: #003C71; color: white; border-bottom: solid #E87B2A 8px; padding: 0.9rem !important;">
                    <tr>
                        <th scope="col">COD. EMPLEADO</th>
                        <th scope="col">NOMBRES</th>
                        <th scope="col">APELLIDOS</th>
                        <th scope="col">TIPO DE EMPLEADO</th>
                        <th scope="col">CARGO DE EMPLEADO</th>
                        <th scope="col">DEPARTAMENTO/UNIDAD</th>
                        <th scope="col">ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width: 20%">00352318</td>
                        <td style="width: 30%">PAOLA CAROLINA</td>
                        <td style="width: 20%">DOMINGUEZ DIAZ</td>
                        <td style="width: 20%">ACADEMICO</td>
                        <td style="width: 20%">CATEDRATICA</td>
                        <td style="width: 20%">DEPT. DE ELECTRONICA E INFORMATICA</td>
                        <td style="width: 20%">
                            <a href="{{ url('/infoEmployee') }}"><button class="btn btn-primary btn-sm" type="button"
                                    title="View">
                                    <i class="bi bi-eye"></i></button></a>
                            <button class="btn btn-warning btn-sm" type="button" title="Edit">
                                <i class="bi bi-pen"></i></button>
                            <button class="btn btn-danger btn-sm" type="button" title="Delete">
                                <i class="bi bi-trash3"></i></button>
                        </td>
                    </tr>
                    <td style="width: 20%">00090718</td>
                    <td style="width: 30%">ALEXIS RAFAEL</td>
                    <td style="width: 20%">BOLANOS MEJIA</td>
                    <td style="width: 20%">ACADEMICO</td>
                    <td style="width: 20%">CATEDRATICO</td>
                    <td style="width: 20%">DEPT. DE ELECTRONICA E INFORMATICA</td>
                    <td style="width: 50%">
                        <button class="btn btn-primary btn-sm" type="button" title="View">
                            <i class="bi bi-eye"></i></button>
                        <button class="btn btn-warning btn-sm" type="button" title="Edit">
                            <i class="bi bi-pen"></i></button>
                        <button class="btn btn-danger btn-sm" type="button" title="Delete">
                            <i class="bi bi-trash3"></i>
                        </button>
                    </td>
                    </tr>
                    <tr>
                        <td style="width: 20%">00090718</td>
                        <td style="width: 30%">GABRIELA CECILIA</td>
                        <td style="width: 20%">SALGUERO </td>
                        <td style="width: 20%">ACADEMICO</td>
                        <td style="width: 20%">CATEDRATICA</td>
                        <td style="width: 20%">DEPT. DE ELECTRONICA E INFORMATICA</td>
                        <td style="width: 50%">
                            <button class="btn btn-primary btn-sm" type="button" title="View">
                                <i class="bi bi-eye"></i></button>
                            <button class="btn btn-warning btn-sm" type="button" title="Edit">
                                <i class="bi bi-pen"></i></button>
                            <button class="btn btn-danger btn-sm" type="button" title="Delete">
                                <i class="bi bi-trash3"></i>
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="paginacionAD">
                <div>
                    <p>Resultados del 1 al 3</p>
                </div>
            </div>
        </div>
    </div>
    <a class="float-button btn-float-2" data-bs-toggle="modal" href="#exampleModalToggle" role="button"
        data-backdrop="false"><i class="bi bi-person-plus-fill float-icon"></i></a>
    </div>
@endsection
