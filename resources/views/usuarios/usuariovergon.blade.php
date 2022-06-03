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
  width: 135px !important; 
  height: 135px !important; 
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
    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
        </symbol>
        <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
        </symbol>
    </svg>
    <div class="user" style="width: 50%">
        <div class="container-fluid" style="background-color: #e3eef5; border: 1px #003C71 solid;">
            <div class="row" style="background-color: #003C71; border-bottom: solid #E87B2A 8px; ">
              <p class="mt-3" style="color: white; font-size: 1.5em"><i class="bi bi-person-circle me-3"></i>PERFIL DE USUARIO</p>
            </div>
            <div class="row d-flex flex-column align-items-center justify-content-center mt-4">
                <!--<input class="inputfile" type="file" name="picture" accept="img/LogoUCAnegro.png">
                <img src="img/LogoUCAnegro.png" style="border-radius: 100%; width: 200px; height: 175px">
                <button class="btn btn-primary" type="file" style="width: 48%; background-color: #003C71;">Cambiar foto de perfil</button>-->
                <div id="liveAlertPlaceholder"></div>
                <div class="container-picture">
                  <div class="outer">
                    <img src="/{{$foto_usuario}}" class="img-profile">
                    <div class="inner">
                    <input class="inputfile" type="file" name="pic" accept="image/*" id="fileImg">
                    <label><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"></path></svg></label>
                    </div>
                  </div>
                </div>
            </div>
            <div class="row mt-4">
              <div class="col">
                <div class="form-group form-floating">
                  <input type="text" class="form-control" id="floatingName" placeholder="Ingrese el nombre" value="{{$usuario->nombre}}" disabled >
                  <label for="floatingName">Nombres</label>  
                </div>
              </div>
              <div class="col">
                <div class="form-floating">
                  <input type="text" class="form-control" id="floatingLastName" placeholder="Ingrese el apellido" value="{{$usuario->apellido}}" disabled >
                  <label for="floatingLastName">Apellidos</label>  
                </div>
              </div>
            </div>
            <div class="row mt-3">
              <div class="col">
                <div class="form-floating">
                  <input type="password" class="form-control" id="floatingPassword" placeholder="Ingrese la contrasenia">
                  <label for="floatingLastName">Cambiar contraseña</label>
                  <input class="ms-1 me-1" type="checkbox" onclick="showPass()">Mostrar contraseña  
                </div>
              </div>
            </div>
            <div class="row mt-3">
              <div class="form-floating">
                <input type="email" class="form-control" id="floatingEmail" placeholder="Ingrese el correo" value="{{auth()->guard('admin')->user()->email}}" disabled>
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
            <div class="modal-header" style="background-color: #003C71; border-bottom: solid #E87B2A 8px;">
              <h5 class="modal-title" style="color: white; font-size: 1.75em;" id="exampleModalLongTitle">Realizando cambios</h5> <!-- cambiar esta parte-->
              <button type="button" class="btn-close btn-close-white" style="width: 1em;" data-dismiss="modal" aria-label="Close">
              </button>
            </div>
            <div class="modal-body">
              <p>¿Desea guardar los cambios?</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
              <button type="button" class="btn btn-success" onclick="guardarCambios()" data-dismiss="modal">Guardar cambios</button>
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

  const alertPlaceholder = document.getElementById('liveAlertPlaceholder')

  const alert = (message, type, icon) => {
      const wrapper = document.createElement('div')
      var icon_f;
      if (icon == 2) {
          icon_f = `   <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>`  
      } else if(icon == 1){
          icon_f = '   <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>'
      }
      wrapper.innerHTML = 
          `<div class="alert alert-${type} d-flex align-items-center" role="alert">`+
          icon_f+
          `   <div>${message}</div>`+
          '</div>';
          alertPlaceholder.append(wrapper)
          window.setTimeout(function() {
              $(".alert").fadeTo(500, 0).slideUp(500, function(){
                  $(this).remove(); 
              });
          }, 2500);
  }

  function guardarCambios() {
      contra = document.getElementById('floatingPassword').value;
      img = document.getElementById('fileImg').value;
      $.ajax({
          type : "POST",
          "serverSide" : true,
          url : "./cambiarDatos",
          data: {"_token": "{{ csrf_token() }}", "password": contra.trim(), "file": img},
          success : function(r) {
              if (r['code'] == 200) {
                  alert(r['mensaje'], 'success', 1);   
                  document.getElementById('floatingPassword').value = "";
              } else{
                  alert(r['mensaje'], 'danger', 2);
              }
          },
          error : function(data) {
              console.log(data);
          }
      })
  }
</script>
@endsection