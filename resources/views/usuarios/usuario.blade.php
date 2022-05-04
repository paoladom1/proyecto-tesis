@extends('plantillas.nav')
@section('content')
    <div class="user">
        <div class="container-fluid" style=" background-color: #e3eef5; padding: 2em; width: 35%; border: 1px #003C71 solid; border-top: 10px #003C71 solid;">
            <div class="row d-flex align-items-center mt-5">
                <div class="col d-flex flex-row justify-content-center">
                    <img src="img/LogoUCAnegro.png" height="200px" width="200px" style="border-radius: 100%">
                </div>
                <div class="col">
                    <div class="row">
                            <h1 class="text-center">Usuario UCA</h1>
                    </div>
                    <div class="row d-flex flex-row justify-content-center mt-1">
                        <!--<input class="form-control" type="file" id="formFileMultiple" style="opacity: 0;" multiple>-->
                        <button class="btn btn-primary" type="file" style="width: auto; background-color: #003C71;">Cambiar foto de perfil</button>
                    </div>
                </div>
            </div>
            <div class="row mt-5">
                <h3>Cambiar contrasena:</h3>
            </div>
            <div class="row ">
                <div class="col d-flex flex-row justify-content-center">
                    <input type="text" style="width: 100%; height: 2.25em; border: 1px #003C71 solid; border-radius: 3px;"/>
                </div>
            </div>
            <div class="row d-flex justify-content-between m-5">
                <button class="ms-3 btn btn-danger" style="width: auto;">Descartar cambios</button>
                <button type="button" data-toggle="modal" data-target="#modal-profile" class="me-3 btn btn-success" style="width: auto">Guardar cambios</button>
            </div>

        </div>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="modal-profile" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLongTitle">Realizando cambios</h5> <!-- cambiar esta parte-->
              <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="background-color: #003C71; color: white;">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p>Desea guardar los cambios?</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
              <button type="button" class="btn btn-success">Guardar cambios</button>
            </div>
          </div>
        </div>
      </div>
@endsection