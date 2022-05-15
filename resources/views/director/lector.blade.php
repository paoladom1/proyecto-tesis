@extends('plantillas.navdirector')
@section('content')
<div class="container" style="background-color: #e3eef5; border: 1px #003C71 solid; border-top: 7px #003C71 solid; ">
  <form>
      <h3 class="mt-3">Ingrese un agente externo UCA</h3>
      <hr>
      <div class="form-group form-floating mb-3 mt-3">
        <input type="email" class="form-control" id="inputName" aria-describedby="emailHelp" placeholder="Ingrese el nombre">
        <label for="inputName">Nombres</label>
      </div>
      <div class="form-group form-floating mb-3 mt-3">
        <input type="email" class="form-control" id="inputLastName" aria-describedby="emailHelp" placeholder="Ingrese el nombre">
        <label for="inputLastName">Apellidos</label>
      </div>
      <div class="form-group form-floating mb-3 mt-3">
        <input type="email" class="form-control" id="inputEmail" aria-describedby="emailHelp" placeholder="Ingrese el nombre">
        <label for="inputEmail">Correo electronico</label>
      </div>
      <div class="row g-2">
        <div class="col-md">
          <div class="form-group form-floating mb-3">
            <select class="form-control form-select" id="exampleFormControlRole">
              <option>Asesor</option>
              <option>Lector</option>
            </select>
            <label for="exampleFormControlRole">Rol</label>
          </div>
        </div>
        <div class="col-md">
          <div class="form-group form-floating mb-3">
            <select class="form-control form-select" id="exampleFormControlDepartment">
              <option>Informatica y electronica</option>
              <option>Arquitectura</option>
              <option>Civil</option>
              <option>Humanidades</option>
              <option>Economia</option>
            </select>
            <label for="exampleFormControlDepartment">Departamento</label>
          </div>
        </div>
      </div>
      <div class="form-group form-floating mb-3">
        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
        <label for="exampleFormControlTextarea1">Descripcion</label>
      </div>
      <button class="mb-3" type="submit" class="btn btn-primary" >Crear Lector</button>
    </form>
</div>
@endsection