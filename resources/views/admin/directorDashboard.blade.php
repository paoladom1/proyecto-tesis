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


        @if (session('success'))
            <div class="alert alert-success" id="notification">
                {{ session('success') }}
            </div>
        @endif

        @if (session('error'))
            <div class="alert alert-danger" id="notification">
                {{ session('error') }}
            </div>
        @endif

        @if (session('warning'))
            <div class="alert alert-warning" id="notification">
                {{ session('warning') }}
            </div>
        @endif

        <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home"
                    type="button" role="tab" aria-controls="nav-home" aria-selected="true">DIRECTORES DE
                    CARRERA</button>
            </div>


        </nav>

        <!--Tabla para desplegar datos de directores de carreera registrados en el sistema-->
        <div class="table-responsive">
            <div id="liveAlertPlaceholder"></div>
            <!-- <form action="/directorInfo" method="GET">
                                    <label for="search" class="sr-only">
                                        Search
                                    </label>
                                    <input type="text" name="s"
                                        class="block w-full p-3 pl-10 text-sm border-gray-200 rounded-md focus:border-blue-500 focus:ring-blue-500 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400"
                                        placeholder="Search..." />
                                </form> -->
            <div id="tablaEstudiantesContainer">
                <table class="table table-hover align-middle fuente-general fuente general" id="directorDashboard">
                    <thead class=" thead-dar"
                        style="background-color: #003C71; color: white; border-bottom: solid #E87B2A 8px; padding: 0.9rem; text-aling:center;  !important;">
                        <tr style="padding: 0.5rem; text-align: center;">
                            <th scope="col">CARRERA</th>
                            <th scope="col">ENCARGADO</th>
                            <th scope="col">ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($directores_carrera as $director)
                            <tr style="text-align: center">
                                <td style="width: 20%">
                                    @foreach ($carreras as $carrera)
                                        @if ($director->carrera_id === $carrera->id)
                                            {{ $carrera->nombre_carrera }}
                                        @endif
                                    @endforeach
                                </td>
                                @foreach ($empleados as $empleado)
                                    @if ($director->empleado_id === $empleado->id)
                                        <td style="width: 20%;">{{ $empleado->nombre . ' ' . $empleado->apellido }}</td>
                                    @endif
                                @endforeach
                                <td style="width: 30%">
                                    <form method="POST" action="/borrarDirector/{{ $director->id }}" class="btn btn-sm"
                                        style="padding: 0">
                                        @csrf
                                        @method('DELETE')

                                        <button class="btn btn-danger btn-sm" type="submit" title="Delete">
                                            <i class="bi bi-trash3"></i></button>
                                    </form>

                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                <div class="paginacionBitacora">
                    @if ($directores_carrera->total() != 0)
                        <div>
                            <p>Resultados del {{ $directores_carrera->firstItem() }} al
                                {{ $directores_carrera->lastItem() }} de
                                {{ $directores_carrera->total() }}</p>
                        </div>
                    @endif
                    <div style="margin-right: 36px">
                        {{ $directores_carrera->appends(request()->except('page'))->links('pagination::bootstrap-4') }}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var notification = document.getElementById('notification');
            if (notification) {
                setTimeout(function() {
                    if (notification.style) {
                        notification.style.display = 'none';
                    }
                }, 5000);
            }
        });

        document.getElementById("myForm").addEventListener("submit", function(event) {
            event.preventDefault();
            cleanupErrors();

            const form = this;

            const formData = new FormData(form);

            fetch(form.action, {
                    method: form.method,
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    if (data.errors) {
                        showErrors(data.errors);
                    } else {
                        window.location.href = "{{ route('directores') }}";
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        });

        function showErrors(errors) {
            Object.entries(errors).forEach(([field, errorList]) => {
                $(`input[name=${field}]`).addClass("is-invalid");

                errorList.forEach(error => {
                    $(`#${field}-error-wrapper`).append(
                        `<span class="invalid-feedback d-block">Ya existe un director registrado para la carrera seleccionada</span>`
                        );
                    $(`#${field}-error-wrapper`).removeClass('d-none');
                })
            });
        }

        function limpiarCampos() {
            document.getElementById("myForm").reset();
            cleanupErrors();
        }

        function cleanupErrors() {
            ['carrera_id'].forEach((field) => {
                const selector = `#${field}-error-wrapper`;
                $(selector).empty();
                $(selector).addClass('d-none')

                $(`input[name=${field}]`).removeClass('is-invalid')
            })
        }
    </script>
@endsection
