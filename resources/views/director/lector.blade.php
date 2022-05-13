@extends('plantillas.navdirector')
@section('content')
<form>
    <div class="form-group">
      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Ingrese el nombre">
    </div>
    <div class="form-group">
      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Ingrese el apellido">
    </div>
    <div class="form-group">
      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Ingrese el correo">
    </div>
    <div class="form-group">
      <label for="exampleFormControlSelect1">Rol (Asesor o Lector)</label>
      <select class="form-control" id="exampleFormControlSelect1">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
      </select>
    </div>
    <div class="form-group">
      <label for="exampleFormControlSelect1">Departamento</label>
      <select class="form-control" id="exampleFormControlSelect1">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
      </select>
    </div>
    <div class="form-group">
      <label for="exampleFormControlTextarea1">Descripcion</label>
      <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Crear Lector</button>
  </form>

@endsection