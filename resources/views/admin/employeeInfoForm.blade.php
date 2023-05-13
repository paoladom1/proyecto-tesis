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

.dropbtn {
    background-color: #04AA6D;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

.dropbtn:hover,
.dropbtn:focus {
    background-color: #3e8e41;
}

#myInput,
#myInput2 {
    box-sizing: border-box;
    background-image: url('searchicon.png');
    background-position: 14px 12px;
    background-repeat: no-repeat;
    font-size: 16px;
    padding: 10px;
    border: none;
    border-bottom: 1px solid #ddd;
    width: 100%;
}

#myInput,
#myInput2 {
    outline: 3px solid #ddd;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f6f6f6;
    min-width: 230px;
    overflow: auto;
    border: 1px solid #ddd;
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown a:hover {
    background-color: #ddd;
}

.show {
    display: block;
}

.scrollable-menu {
    height: auto;
    max-height: 200px;
    overflow-x: hidden;
}

.containerToogle {
    display: flex;
    align-items:
}

.containerToogle>div:nth-child(1) {
    width: 30%;
}

.containerToogle>div:nth-child(2) {
    width: 70%;
}

.containerToogle>div:nth-child(1)>.dropdown>button {
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.containerToogle>div:nth-child(1)>.dropdown>button:focus {
    outline: none;
    box-shadow: none;
}

.dropEstudiante .dropdown-divider {
    margin: 0;
}

.dropEstudiante .dropdown-item {
    padding-top: 10px;
    padding-bottom: 10px;
}

.dropEstudiante .dropdown-menu {
    padding: 0;
}

#noDatos3 {
    display: none;
}

.dropbtn {
    background-color: #04AA6D;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

.dropbtn:hover,
.dropbtn:focus {
    background-color: #3e8e41;
}

#myInput {
    box-sizing: border-box;
    background-image: url('searchicon.png');
    background-position: 14px 12px;
    background-repeat: no-repeat;
    font-size: 16px;
    padding: 14px 20px 12px 45px;
    border: none;
    border-bottom: 1px solid #ddd;
}

#myInput {
    outline: 3px solid #ddd;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f6f6f6;
    min-width: 230px;
    overflow: auto;
    border: 1px solid #ddd;
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown a:hover {
    background-color: #ddd;
}

.show {
    display: block;
}

.scrollable-menu {
    height: auto;
    max-height: 200px;
    overflow-x: hidden;
}

.nav-tabs .nav-item.show .nav-link,
.nav-tabs .nav-link.active {
    color: white;
    background-color: #003C71;
    border-color: #003C71;
}

.nav-tabs .nav-item.show .nav-link,
.nav-tabs .nav-link {
    color: white;
    background-color: #E87B2A;
    border-color: #dee2e6 #dee2e6 #fff;
}

.form-floating>.form-control:not(:-moz-placeholder-shown)~label {
    opacity: 1;
    color: rgba(0, 0, 0, 0.5);
    background-color: #fff;
    height: auto;
    padding: 0px;
    padding: 0px 0px 0px 10px;
    width: 100%;
    transform: scale(0.982) translateY(0.045rem) translateX(0.1rem);
    border-radius: 5px 0 0 0;
}

.form-floating>.form-control:focus~label,
.form-floating>.form-control:not(:placeholder-shown)~label,
.form-floating>.form-select~label {
    opacity: 1;
    color: rgba(0, 0, 0, 0.5);
    background-color: #fff;
    height: auto;
    padding: 0px 0px 0px 10px;
    width: 100%;
    transform: scale(0.982) translateY(0.045rem) translateX(0.1rem);
    border-radius: 5px 0 0 0;
}

.form-floating>.form-control:-webkit-autofill~label {
    opacity: 1;
    color: rgba(0, 0, 0, 0.5);
    background-color: #fff;
    height: auto;
    padding: 0px;
    padding: 0px 0px 0px 10px;
    width: 100%;
    transform: scale(0.982) translateY(0.045rem) translateX(0.1rem);
    border-radius: 5px 0 0 0;
}

.dropEstudiante .dropdown-divider {
    margin: 0;
}

.dropEstudiante .dropdown-item {
    padding-top: 10px;
    padding-bottom: 10px;
}

.dropEstudiante .dropdown-menu {
    padding: 0;
}

#noDatos1,
#noDatos2 {
    display: none;
}
</style>

<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
        <path
            d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
    </symbol>
    <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
        <path
            d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
    </symbol>
</svg>

<br>
<div class="container-fluid container-general">
    <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home"
                type="button" role="tab" aria-controls="nav-home" aria-selected="true">EMPLEADOS</button>
        </div>
    </nav>
    <br>
    <form class="row gx-3 gy-2 align-items-center">
        <div class="col-sm-2">
            <label for="inputCod" class="form-label">Codigo de empleado</label>
            <input type="text" class="form-control" id="inputCod">
        </div><div></div>
        <div class="col-sm-3">
            <label for="inputName" class="form-label">Nombres</label>
            <input type="text" class="form-control" id="inputName">
            <label for="inputLastnames" class="form-label">Apellidos</label>
            <input type="text" class="form-control" id="inputLastnames">
        </div><div></div>
        <div class="col-sm-3">
            <label for="inputEmail" class="form-label">Correo institucional</label>
            <input type="email" class="form-control" id="inputEmail">
        </div><div></div>
        <div class="col-sm-3">
            <label for="inputType" class="form-label">Tipo de empleado</label>
            <input type="text" class="form-control" id="inputType">
        </div>
        <div class="col-sm-4">
            <label for="inputGroup" class="form-label">Cargo de empleado</label>
            <input type="text" class="form-control" id="inputGroup">
        </div>
        <div class="col-sm-4">
            <label for="inputWork" class="form-label">Departamento/Unidad</label>
            <input type="text" class="form-control" id="inputWork">
        </div>
        <div class="col-12">
            <a href="{{ url('/employeeInfo')}}"><button type="button" class="btn btn-primary"
                    style="background-color:#003C71"><i class="bi bi-arrow-bar-left"></i>Regresar</button></a>
        </div>
    </form>
</div>

@endsection