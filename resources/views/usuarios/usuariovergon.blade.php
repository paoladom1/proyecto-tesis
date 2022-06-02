@extends('plantillas.nav')
@section('content')
<style>
  .container-picture {
  width: 150px;
  height: 150px;
  display: block;
  margin: 0 auto;
}

.outer {
  width: 100% !important;
  height: 100% !important;
  max-width: 150px !important; 
  max-height: 150px !important; 
  margin: auto;
  background-color: none;
  border-radius: 100%;
  position: relative;
  }

  .img-profile {
  width: 100% !important;
  height: 100% !important;
  max-width: 150px !important; 
  max-height: 150px !important; 
  margin: auto;
  background-color: none;
  border-radius: 100%;
  position: relative;
  }
  
.inner {
  background-color: #003C71;
  width: 40px;
  height: 40px;
  border-radius: 100%;
  position: absolute;
  bottom: 0;
  right: 0;
}

.inner:hover {
  background-color: #E87B2A;
}
.inputfile {
    opacity: 0;
    overflow: hidden;
    position: absolute;
    z-index: 1;
    width: 50px;
    height: 50px;
}
.inputfile + label {
    font-size: 1.25rem;
    text-overflow: ellipsis;
    white-space: nowrap;
    display: inline-block;
    overflow: hidden;
    width: 40px;
    height: 40px;
    pointer-events: none;
    cursor: pointer;
    line-height: 35px;
    text-align: center;
}
.inputfile + label svg {
    fill: #fff;
}


</style>
    <div class="user" style="width: 50%">
        <div class="container-fluid" style="background-color: #e3eef5; border: 1px #003C71 solid;">
            <div class="row" style="background-color: #003C71; border-bottom: solid #E87B2A 8px; ">
              <p class="mt-3" style="color: white; font-size: 1.5em"><i class="bi bi-person-circle me-3"></i>Perfil de usuario</p>
            </div>
            <div class="row d-flex flex-column align-items-center justify-content-center mt-5">
                <!--<input class="inputfile" type="file" name="picture" accept="img/LogoUCAnegro.png">
                <img src="img/LogoUCAnegro.png" style="border-radius: 100%; width: 200px; height: 175px">
                <button class="btn btn-primary" type="file" style="width: 48%; background-color: #003C71;">Cambiar foto de perfil</button>-->
                <div class="container-picture">
                  <div class="outer">
                    <img src="img/LogoUCAnegro.png" class="img-profile">
                    <div class="inner">
                    <input class="inputfile" type="file" name="pic" accept="image/*">
                    <label><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"></path></svg></label>
                    </div>
                  </div>
                </div>
            </div>
            <div class="row mt-4">
              <div class="col">
                <div class="form-group form-floating">
                  <input type="text" class="form-control" id="floatingName" placeholder="Ingrese el nombre" value="" disabled >
                  <label for="floatingName">Nombres</label>  
                </div>
              </div>
              <div class="col">
                <div class="form-floating">
                  <input type="text" class="form-control" id="floatingLastName" placeholder="Ingrese el apellido" value="" disabled >
                  <label for="floatingLastName">Apellidos</label>  
                </div>
              </div>
            </div>
            <div class="row mt-3">
              <div class="col">
                <div class="form-floating">
                  <input type="password" class="form-control" id="floatingPassword" placeholder="Ingrese la contrasenia" value="">
                  <label for="floatingLastName">Cambiar contraseña</label>
                  <input class="ms-1 me-1" type="checkbox" onclick="showPass()">Mostrar contraseña  
                </div>
              </div>
            </div>
            <div class="row mt-3">
              <div class="form-floating">
                <input type="email" class="form-control" id="floatingEmail" placeholder="Ingrese el correo" value="" disabled>
                <label class="ms-2" for="floatingEmail">Correo electronico</label>  
              </div>
            </div>
            <div class="row d-flex justify-content-between mt-4 mb-4 ms-3 me-3">
                <button class="me-3 btn btn-danger" style="width: 45%;"><i class="bi bi-x-circle me-2"></i>Descartar cambios</button>
                <button type="button" data-toggle="modal" data-target="#modal-profile" class="ms-3 btn btn-success" style="width: 45%"><i class="bi bi-check-circle me-2"></i>Guardar cambios</button>
            </div>
        </div>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="modal-profile" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header" style="background-color: #003C71; border-bottom: solid orange 8px;">
              <h5 class="modal-title" style="color: white; font-size: 1.75em;" id="exampleModalLongTitle">Realizando cambios</h5> <!-- cambiar esta parte-->
              <button type="button" class="btn-close btn-close-white" style="width: 1em;" data-dismiss="modal" aria-label="Close">
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
<script>
  function showPass(){
    var pass = document.getElementById("floatingPassword");
    if (pass.type == "password"){
      pass.type = "text";
    } else {
      pass.type = "password";
    }
  }
</script>
@endsection