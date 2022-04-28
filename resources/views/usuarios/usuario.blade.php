@extends('plantillas.maintemplate')
@section('content2')
    <div class="user">
        <div class="container-fluid" style="background-color: silver; padding: 2em; width: 40%; border-radius: 5px;">
            <div class="row d-flex align-items-center mt-5">
                <div class="col d-flex flex-row justify-content-center">
                    <img src="img/LogoUCAblanco.png" height="200px" width="200px" style="border-radius: 100%">
                </div>
                <div class="col">
                    <div class="row">
                            <h1 class="text-center">Usuario UCA</h1>
                    </div>
                    <div class="row d-flex flex-row justify-content-center mt-3">
                        <button class="btn btn-primary" style="width: auto; background-color: #003C71;">Cambiar foto de perfil</button>
                    </div>
                </div>
            </div>
            <div class="row mt-5">
                <h3>Nombre de usuario:</h3>
            </div>
            <div class="row ">
                <div class="col d-flex flex-row justify-content-center">
                    <input type="text" style="width: 100%; height: 2.25em; border: none; border-radius: 3px;"/>
                </div>
            </div>
            <div class="row d-flex justify-content-between m-5">
                <button class="ms-3 btn btn-danger" style="width: auto;">Descartar cambios</button>
                <button class="me-3 btn btn-success" style="width: auto">Guardar cambios</button>
            </div>

        </div>
    </div>
@endsection