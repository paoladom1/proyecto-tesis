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
    </style>

    <div class="container" style="background-color: white">
        <div class="row">
            <div class="container mPrincipal">
                <div class="row " style="background-color:#003C71; border-bottom:solid #E87B2A 8px;">
                    <center>
                        <h1 class="mt-3 mb-3" style="color: #e3eef5; font-size: 2em">MENÚ PRINCIPAL</h1>
                    </center>
                </div>
                <center>
                    <div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 g-4 mt-3 mb-3">
                        <div class="col">
                            <div class="card m-3 position-static card-menu" style="width: 20rem;">
                                <a href="{{ route('users') }}" style="text-decoration: none; color: black;">
                                    <img src="img/fondoCard2.jpeg" class="card-img-top img-card" alt="Card image cap">
                                    <div class="card-body body-card mt-2">
                                        <h5 class="card-title">USUARIOS</h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card m-3 position-static card-menu" style="width: 20rem;">
                                <a href="{{ route('students') }}" style="text-decoration: none; color: black;">
                                    <img src="img/fondoCard.jpeg" class="card-img-top img-card" alt="Card image cap">
                                    <div class="card-body body-card mt-2">
                                        <h5 class="card-title">ESTUDIANTES</h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 g-4 mt-3 mb-3">
                        <div class="col">
                            <div class="card m-3 position-static card-menu" style="width: 20rem;">
                                <a href="{{ route('employees') }}" style="text-decoration: none; color: black;">
                                    <img src="img/fondoCard5.jpeg" class="card-img-top img-card" alt="Card image cap">
                                    <div class="card-body body-card mt-2">
                                        <h5 class="card-title">EMPLEADOS</h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card m-3 position-static card-menu" style="width: 20rem;">
                                <a href="{{ route('directores') }}" style="text-decoration: none; color: black;">
                                    <img src="img/fondoCard6.jpeg" class="card-img-top img-card" alt="Card image cap">
                                    <div class="card-body body-card mt-2">
                                        <h5 class="card-title">DIRECTORES</h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </center>
            </div>
        </div>
    </div>
@endsection
