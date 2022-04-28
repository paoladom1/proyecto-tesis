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

    <title>Proceso de graduación</title>
</head>
<body>

    <nav class="navGral" id="nav">
        <a href="#">
            <img src="/img/Logo.png" alt="" class="d-inline-block align-text-top navImg">
        </a>
        <p style="color: white;" class="navTitle align-items-center">Tema de tesis <!--Variable laravel--></p>
    </nav>

     <!-- Menu desplegable lateral -->
     <div id="SideNav" class="sidenav">
        <div class="closeBtn">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()"><i class="fa-solid fa-circle-xmark"> </i></a>
        </div>
        <div>
            <a href="#">Cerrar Sesion</a>
        </div>


    </div>

    <div class="menuButton">
        <a href="#" id="menu" onclick="openNav()">
            <i class="bi bi-list"></i>
        </a>
    </div>

    <main class="main-content" id="content">
        @yield('content')
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
        window.addEventListener('mouseup', function(event){
            var box = document.getElementById("SideNav");
            if (event.target != box){
                closeNav();
            }
        });
    </script>
@include('plantillas.footer')
