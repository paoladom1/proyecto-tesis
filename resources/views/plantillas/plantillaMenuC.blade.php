@extends('plantillas.nav')
@section('content')
<style>

.mPrincipal{
    border: #003C71 1px solid;
    background-color: #e3eef5;
    border-top: #003C71 7px solid;
}

.card-menu{
    border: 2px #003C71 solid;
    transition: all 0.5s;
}

.img-card{
    width: 7em; align-self: center;
    transition: all 0.5s;
}

.body-card {
    transition: all 0.5s;
}

.card-menu:hover {
    border: 2px #E87B2A solid;
}

.card-menu:hover .img-card{
    transform: translateY(5px);
}

.card-menu:hover .body-card{
    transform: translateY(-5px);
    cursor: pointer;
}

</style>

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
                            <img src="img/LogoUCAnegro.png" class="card-img-top img-card" alt="Card image cap">
                            <div class="card-body body-card mt-2">
                                <h5 class="card-title">Portada</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card m-3 position-static card-menu" style="width: 18rem;">
                            <img src="img/LogoUCAnegro.png" class="card-img-top img-card" alt="Card image cap">
                            <div class="card-body body-card mt-2">
                                <h5 class="card-title">Portada</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card m-3 position-static card-menu" style="width: 18rem;">
                            <img src="img/LogoUCAnegro.png" class="card-img-top img-card" alt="Card image cap">
                            <div class="card-body body-card mt-2">
                                <h5 class="card-title">Portada</h5>
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
                    <input type="text" class="list-group-item" placeholder="Seccion"/>
                    <input type="text" class="list-group-item" placeholder="Autor"/>
                    <input type="text" class="list-group-item" placeholder="Fecha"/>
                    <button class="list-group-item" style="color: white; background-color: #003C71">Ver</button>
                </div>
            </div>

        </div>
    </div>
@endsection
