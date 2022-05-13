@extends('plantillas.nav')
@section('content')

    <div class="container" style="background-color: white">
        <div class="row">
            <div class="container mPrincipal">
                <div class="row " style="margin-top: 2em;">
                    <center><h1>Tema tesis</h1></center>
                </div>
                <center>
                <div class="row row-cols-1 row-cols-sm-1 row-cols-md-3 g-4 mt-3">
                    <div class="col">
                        <div class="card m-3 position-static card-menu" style="width: 18rem;" >
                            <img src="img/Fondo.jpg" class="card-img-top img-card" alt="Card image cap">
                            <div class="card-body body-card mt-2">
                                <a href="{{ url('/portada') }}" style="text-decoration: none; color: black;"><h5 class="card-title">Portada</h5></a>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card m-3 position-static card-menu" style="width: 18rem;">
                            <img src="img/Fondo.jpg" class="card-img-top img-card" alt="Card image cap">
                            <div class="card-body body-card mt-2">
                                <a href="{{ url('/resumen') }}" style="text-decoration: none; color: black;"><h5 class="card-title">Resumen</h5></a>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card m-3 position-static card-menu" style="width: 18rem;">
                            <img src="img/Fondo.jpg" class="card-img-top img-card" alt="Card image cap">
                            <div class="card-body body-card mt-2">
                                <a href="{{ url('/agradecimientos') }}" style="text-decoration: none; color: black;"><h5 class="card-title">Agradecimientos</h5></a>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card m-3 position-static card-menu" style="width: 18rem;" >
                            <img src="img/Fondo.jpg" class="card-img-top img-card" alt="Card image cap">
                            <div class="card-body body-card mt-2">
                                <a href="{{ url('/abreviaturas') }}" style="text-decoration: none; color: black;"><h5 class="card-title">Abreviaturas</h5></a>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card m-3 position-static card-menu" style="width: 18rem;">
                            <img src="img/Fondo.jpg" class="card-img-top img-card" alt="Card image cap">
                            <div class="card-body body-card mt-2">
                                <a href="{{ url('/capitulos') }}" style="text-decoration: none; color: black;"><h5 class="card-title">Capítulos</h5></a>
                            </div>

                        </div>
                    </div>
                    <div class="col">
                        <div class="card m-3 position-static card-menu" style="width: 18rem;">
                            <img src="img/Fondo.jpg" class="card-img-top img-card" alt="Card image cap">
                            <div class="card-body body-card mt-2">
                                <a href="{{ url('/glosario') }}" style="text-decoration: none; color: black;"><h5 class="card-title">Glosario</h5></a>
                            </div>
                        </div>
                    </div>
                </div>
                </center>
            </div>
        </div>
        <div class="row mt-3">
            <div class="container" style="background-color: #e3eef5; border:1px #003C71 solid; border-top: #003C71 7px solid;">
                <center><h3 class="mt-3">Ultimos cambios</h3></center>
                <div class="list-group list-group-horizontal justify-content-center m-3">
                    <input type="text" class="list-group-item" placeholder="Seccion" readonly/>
                    <input type="text" class="list-group-item" placeholder="Autor" readonly/>
                    <input type="text" class="list-group-item" placeholder="Fecha" readonly/>
                    <button class="list-group-item" style="color: white; background-color: #003C71">Ver</button>
                </div>
            </div>

        </div>
    </div>
@endsection
