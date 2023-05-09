<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="/img/LogoPCNoNasa.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link href = "{{URL::asset('css/app.css')}}" rel="stylesheet">
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
    <script src="{{asset('bootstrap/js/bootstrap.bundle.min.js')}}"></script>
    <script src="/js/ckeditor/build/ckeditor.js"></script>
    <!--- <script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script> --->
    @yield('scripts')

    <script src="https://kit.fontawesome.com/455beed8e3.js" crossorigin="anonymous"></script>
    <script src="{{URL::asset('js/alertMessage.js')}}"></script>
    
    <title>Proceso de graduación</title>
</head>

<body>
    <nav class="navGral d-flex justify-content-between" id="nav">
        <a href="/menu">
            <img src="/img/Logo.png" alt="" class="d-inline-block align-text-top navImg">
        </a>
        <div class="dropdown" id="user-settings">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="user-btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img src="/{{auth()->guard('admin')->user()->foto}}" id="profile" style="width: 3em; height: 3em; border-radius: 100%;"/>
            </button>
            <div class="dropdown-menu" aria-labelledby="user-btn">
                <a class="dropdown-item user-btn-name" href="#" style="width: 100%;">{{auth()->guard('admin')->user()->email}}</a>
                <hr class="dropdown-divider">
                <a class="dropdown-item" href="{{ url('/perfil') }}" style="width: 100%">Editar perfil</a>
                <hr class="dropdown-divider">
                <a class="dropdown-item" href="{{route('logout')}}" style="width: 100%">Cerrar sesión</a>
            </div>
          </div>
    </nav>
     <!-- Menu desplegable lateral -->
     <div id="SideNav" class="sidenav">
        <div id="navMenu">
            <div class="closeBtn">
                <a href="javascript:void(0)" class="btn-close btn-close-white btn-close2" onclick="closeNav()"></a>
            </div>

            <hr>
            @if (auth()->guard('admin')->user()->tipo_usuario_id == 1)
                <ul class="list-unstyled components">
                    <li>
                        <a href="{{ url('/menu') }}"><i class="bi bi-house-door"></i> Menú Principal</a>
                        <hr>
                    </li>
                    <li> <a href="{{ url('/resumen') }}"><i class="bi bi-clipboard2-data"></i> Resumen</a> </li>
                    <li> <a href="{{ url('/agradecimientos') }}"><i class="bi bi-people"></i> Agradecimientos</a> </li>
                    <li> <a href="{{ url('/abreviaturas') }}"><i class="bi bi-explicit"></i> Abreviaturas</a> </li>
                    <li> <a href="{{ url('/capitulos') }}"><i class="bi bi-pen"></i> Capítulos</a> </li>
                    <li> <a href="{{ url('/glosario') }}"><i class="bi bi-journal-bookmark-fill"></i> Glosario</a> </li>
                    <li> <a href="{{ url('/referencias') }}"><i class="bi bi-list-columns-reverse"></i> Referencias</a> </li>
                    <li> <a href="{{ url('/bitacora') }}"><i class="bi bi-journals"></i> Bitácora</a> </li>
                </ul>
            @elseif (auth()->guard('admin')->user()->tipo_usuario_id == 2)
                <ul class="list-unstyled components">
                    <li>
                        <a href="{{ url('/menudirector') }}" style="font-size: 1.3rem"><i class="bi bi-house-door me-2"></i>Menu Principal</a>
                        <hr>
                    </li>
                    <li> <a href="{{ url('/externo') }}" style="font-size: 1.3rem"><i class="fa-solid fa-address-card me-2"></i><span>Directores y Lectores</span></a> </li>
                    <li><a href="{{ url('/grupoTrabajo') }}" style="font-size: 1.3rem"><i class="bi bi-people me-2"></i>Grupos de trabajo</a></li>
                        <hr>
                    <li><a href="{{ url('/mostrarUsuario') }}" style="font-size: 1.3rem"><i class="bi bi-person-check-fill"></i>  Usuarios</a></li>
                    <li><a href="{{ url('/configAdmin') }}" style="font-size: 1.3rem"><i class="bi bi-gear"></i>  Configuracion</a></li>
                        <hr>
                </ul>
            @endif
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

<style>
    main{
        min-height: calc(100vh - 79px - 107px);
        margin-bottom: 20px;
    }
</style>

<script>
    function openNav(){
        document.getElementById("SideNav").style.width = "250px";
        document.getElementById("SideNav").style.marginLeft = "0";
        document.getElementById("nav").style.marginLeft = "250px";
        document.getElementById("content").style.marginLeft = "250px";
        document.getElementById("menu").style.display = 'none';
        document.getElementById("piePagina").style.marginLeft = "250px";
        document.getElementById("piePagina").style.transition = "all 0.5s";
        document.getElementById("user-settings").style.marginRight = "15em";
        document.getElementById("user-settings").style.transition = "all 0.5s";
    }

    function closeNav(){
        document.getElementById("SideNav").style.marginLeft = "-250px";
        document.getElementById("nav").style.marginLeft = "0";
        document.getElementById("content").style.marginLeft = "0";
        document.getElementById("piePagina").style.marginLeft = "0";
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
</script>
@include('plantillas.footer')
