<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <script src="{{asset('bootstrap/js/bootstrap.bundle.min.js')}}"></script>
    <link href = "{{URL::asset('css/app.css')}}" rel="stylesheet">

    <title>Proceso de graduación<!-- Variable laravel--></title>
</head>
<body>

    <!-- Menu desplegable lateral -->
    <div id="SideNav" class="sidenav">
        <a href="javascript:void(0)" class="btn-close btn-close-white centered" style="color: white;" onclick="closeNav()"></a>
        <a href="#">Cerrar Sesion</a>
    </div>

    <!-- Barra de navegacion superior -->
    <nav id="nav" class="navbar-main ">
    <div class="container-fluid">
        <div class="row" style="background-color: #003C71;">
            <div class="col justify-content-start">
                <a class="navbar-brand" href="#">
                    <img src="/img/Logo.png" alt="" height="65px" style="margin: .5em;" class="d-inline-block align-text-top">
                </a>
            </div>
            <div class="col justify-content-center" style="align-self:end;">
                <p style="color: white;">Tema de tesis <!--Variable laravel--></p>
            </div>
        </div>
        <div class="row">
            <div class="col-1 mt-1">
                <button type="button" id="menu" style="background-color: #003C71; color: white; height: 4em; width: 4em;  "><i class="bi bi-list" style= "font-size: 2em;"></i></button>
            </div>
        </div>
    </div>
    </nav>
    <main class="main-content" id="content">
        @yield('content2')
    </main>
    <script>
        function openNav(){
            document.getElementById("SideNav").style.width = "250px";
            document.getElementById("nav").style.marginLeft = "250px";
            document.getElementById("content").style.marginLeft = "250px";
            document.getElementById("menu").style.display = 'none';

        }
        function closeNav(){
            document.getElementById("SideNav").style.width = "0";
            document.getElementById("nav").style.marginLeft = "0";
            document.getElementById("content").style.marginLeft = "0";
            document.getElementById("menu").style.display = 'initial';
        }

        //Funcion de cerrar y abrir sidenav con el mismo boton
        document.getElementById("menu").addEventListener("click", toggleNav);
        function toggleNav(){
            if(document.getElementById("SideNav").style.width == "250px" ){
                return closeNav();
            }
            return openNav();
        }
        /*window.addEventListener('mouseup', function(event){
            var box = document.getElementById("SideNav");
            if (event.target != box){
                closeNav();
            }
        });*/
        
    </script>
@include('plantillas.footer')


