<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!--<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->
    <script
    src="https://code.jquery.com/jquery-3.6.0.js"
    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
    crossorigin="anonymous"></script>
    <script
    src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"
    integrity="sha256-6XMVI0zB8cRzfZjqKcD01PBsAy3FlDASrlC8SxCpInY="
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <script src="https://kit.fontawesome.com/455beed8e3.js" crossorigin="anonymous"></script>
    <script src="{{asset('bootstrap/js/bootstrap.bundle.min.js')}}"></script>

    <link href = "{{URL::asset('css/app.css')}}" rel="stylesheet">

    <title>Proceso de graduación</title>
</head>

<body>
    <nav class="navGral d-flex justify-content-between" id="nav">
        <a href="/menudirector">
            <img src="/img/Logo.png" alt="" class="d-inline-block align-text-top navImg">
        </a>
        <div class="dropdown" id="user-settings">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="user-btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img src="/{{auth()->guard('admin')->user()->foto}}" id="profile" style="width: 2.5em; border-radius: 100%;"/>
            </button>
            <div class="dropdown-menu" aria-labelledby="user-btn">
                <a class="dropdown-item user-btn-name" href="#" style="width: 100%">{{auth()->guard('admin')->user()->email}}</a>
                <hr class="dropdown-divider">
                <a class="dropdown-item" href="{{ url('/perfil') }}" style="width: 100%">Editar perfil</a>
                <hr class="dropdown-divider">
                <a class="dropdown-item" href="#" style="width: 100%">Cerrar sesion</a>
            </div>
          </div>
    </nav>

     <!-- Menu desplegable lateral -->
     <div id="SideNav" class="sidenav">
        <div id="navMenu">
            <div class="closeBtn">
                <a href="javascript:void(0)" class="btn-close btn-close-white" onclick="closeNav()"></a>
            </div>

            <hr>
            <ul class="list-unstyled components">
                <li> 
                    <a href="{{ url('/menudirector') }}"><i class="bi bi-house-door me-2"></i>Menu Principal</a>
                </li>
            </ul>
              <hr>
              <ul class="list-unstyled components">
                <li><a href="{{ url('/filtro') }}"><i class="bi bi-people me-2"></i>Grupos de tesis</a></li>
                <li> <a href="{{ url('/lectorv') }}" style="font-size: 1.35em"><i class="fa-solid fa-address-card me-2"></i>Asesores y lectores</a> </li>
            </ul>
        </div>
    </div>

    <div class="menuButton" id="menuB">
        <a href="#" id="menu" onclick="openNav()" >
            <i class="bi bi-list"></i>
        </a>
    </div>

    <main class="main-content" id="content" style="background-color: white">
        @yield('content')
    </main>

<script>
    function openNav(){
        document.getElementById("SideNav").style.width = "250px";
        document.getElementById("SideNav").style.marginLeft = "0";
        document.getElementById("nav").style.marginLeft = "250px";
        document.getElementById("content").style.marginLeft = "250px";
        //document.getElementById("menuB").style.marginLeft = "250px";
        document.getElementById("menu").style.display = 'none';
        document.getElementById("user-settings").style.marginRight = "15em";
        document.getElementById("user-settings").style.transition = "all 0.5s";
    }
    function closeNav(){
        document.getElementById("SideNav").style.marginLeft = "-250px";
        document.getElementById("nav").style.marginLeft = "0";
        document.getElementById("content").style.marginLeft = "0";
        setTimeout(() => {  document.getElementById("menu").style.display = 'initial'; }, 600);
        document.getElementById("navMenu").style.fontSize="100%";
        document.getElementById("user-settings").style.marginRight = "0.25em";
    }

    document.getElementById("menu").addEventListener("click", toggleNav);
    function toggleNav(){
        if(document.getElementById("SideNav").style.width = 0){
            return closeNav();
        }
        return openNav();
    }

    function dropdown() {
        document.getElementById("user-dropdown").classList.toggle("show");
        }

    /* Funciones para abrir modal de creacion de documento */

   /* var listado = document.querySelectorAll("#listadoSecciones li");

    var check = document.querySelectorAll('.checkSeccion .form-check-input');

    function cambio(checkbox){
        if(check[checkbox].checked){
            listado[checkbox-1].style.display = 'block';
            var cont = 0;
            for (let index = 1; index < check.length; index++) {
                if(check[index].checked){
                    ++cont;
                }
            }
            if(cont == check.length-1){
                check[0].checked = true;
            }
        }
        else{
            check[0].checked = false;
            listado[checkbox-1].style.display = 'none';
        }
    }

    function cambio2(){
        if(check[0].checked){
            for (let index = 1; index < check.length; index++) {
                if (!check[index].disabled) {
                    check[index].checked = true;
                    cambio(index);
                }
            }
        }
        else{
            for (let index = 1; index < check.length; index++) {
                if (!check[index].disabled) {
                    check[index].checked = false;
                    cambio(index);
                }
            }
        }
    }

    function desmarcar() {
        for (let index = 0; index < check.length; index++) {
            check[index].checked = false;
            listado[index].style.display = 'none';
        }
    }*/
</script>
@include('plantillas.footer')
