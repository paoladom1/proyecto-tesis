@extends('plantillas.nav')
@section('content')
<!--@push('styles')
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
@endpush-->
    <div class="container">
        <div class="row">
            <h4>Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi, quos?</h4>
        </div>
        <div class="row">
            <h5>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellat molestiae eveniet ullam nostrum earum possimus.</h5>
        </div>
        <div class="row">
            <div class="container" style="background-color: silver; border-radius: 10px;">
                <div class="row " style="margin-top: 2em;">
                    <center><h1>MENU PRINCIPAL</h1></center>
                </div>
                <center>
                <div class="row row-cols-1 row-cols-sm-1 row-cols-md-3 g-4 mt-3">
                    <div class="col">
                        <div class="card m-3 position-static" style="width: 18rem;">
                            <img src="img/LogoUCAnegro.png" class="card-img-top">
                            <div class="card-body" style="background-color: #003C71">
                                <h5 class="card-title">Portada</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card m-3 position-static" style="width: 18rem;">
                            <img src="img/LogoUCAnegro.png" class="card-img-top">
                            <div class="card-body" style="background-color: #003C71">
                                <h5 class="card-title">Portada</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card m-3 position-static" style="width: 18rem;">
                            <img src="img/LogoUCAnegro.png" class="card-img-top">
                            <div class="card-body" style="background-color: #003C71">
                                <h5 class="card-title">Portada</h5>
                            </div>
                        </div>
                    </div>
                </div>
                </center>
            </div>
        </div>
        <div class="row mt-3">
            <div class="container" style="background-color: silver; border-radius: 10px;">
                <center><h3 class="mt-3">Lorem ipsum dolor sit amet.</h3></center>
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
