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
    <script src="{{asset('bootstrap/js/bootstrap.bundle.min.js')}}"></script>

    <link href = "{{URL::asset('css/app.css')}}" rel="stylesheet">

    <title>Proceso de graduación</title>
</head>

<body>
    <nav class="navGral d-flex justify-content-between" id="nav">
        <a href="/menu">
            <img src="/img/Logo.png" alt="" class="d-inline-block align-text-top navImg">

        </a>
        <div class="dropdown" id="user-settings">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="user-btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img src="img/profile.png" id="profile" style="width: 2.5em; border-radius: 100%;"/>
            </button>
            <div class="dropdown-menu" aria-labelledby="user-btn">
                <a class="dropdown-item user-btn-name" href="#">Joshua Steven Sharp Reyes</a>
                <hr class="dropdown-divider">
                <a class="dropdown-item" href="#" style="width: 100%">Editar perfil</a>
                <hr class="dropdown-divider">
                <a class="dropdown-item" href="#" style="width: 100%">Cerrar sesion</a>
            </div>
          </div>
        <!--<div id="user-settings">
            <button id="user-btn" onclick="dropdown()">
                <img src="img/profile.png" id="profile" style="width: 2.5em; border-radius: 100%;"/>
                <div id="triangulo" class="ms-2">
                </div>
            </button>
            <div id="user-dropdown" class="user-content">
                <a style="width: 100%;" href="#">Editar perfil</a>
                <a style="width: 100%;" class="ucontent" href="#">Cerrar sesion</a>
              </div>
        </div>-->
    </nav>

     <!-- Menu desplegable lateral -->
     <div id="SideNav" class="sidenav">
        <div id="navMenu">
            <div class="closeBtn">
                <a href="javascript:void(0)" class="btn-close btn-close-white" onclick="closeNav()"></a>
            </div>

            <hr>
            <!--<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                  <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                      <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        Portadas
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                      <ul>
                        <a><button class="dropdown-btn">Primer Portada</button></a>
                        <a><button class="dropdown-btn">Segunda Portada</button></a>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>-->
              <ul class="list-unstyled components">
                <li> {{--  <a href="#portadas" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Portada</a>
                    <ul class="collapse list-unstyled" id="portadas">
                        <li> <a href="#">Primer Portada</a> </li>
                        <li> <a href="#">Segunda Portada</a> </li>
                    </ul>--}}
                    <a href="{{ url('/menu') }}">Menu Principal</a>
                </li>
            </ul>
              <hr>
              <ul class="list-unstyled components">
                <li> {{--  <a href="#portadas" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Portada</a>
                    <ul class="collapse list-unstyled" id="portadas">
                        <li> <a href="#">Primer Portada</a> </li>
                        <li> <a href="#">Segunda Portada</a> </li>
                    </ul>--}}
                    <a href="{{ url('/portada') }}">Portada</a>
                </li>
                <li> <a href="{{ url('/resumen') }}">Resumen</a> </li>
                <li> <a href="{{ url('/agradecimientos') }}">Agradecimientos</a> </li>
                <li> <a href="{{ url('/abreviaturas') }}">Abreviaturas</a> </li>
                <li> <a href="{{ url('/capitulos') }}">Capitulos</a> </li>
                <li> <a href="{{ url('/glosario') }}">Glosario</a> </li>
            </ul>

            <hr>
            <div class="crearDoc">
                <a href="#">Crear documento</a>
            </div>
            <!--<div class="logOut">
                <a data-bs-toggle="modal" href="#exampleModalToggle" role="button">Crear documento</a>
            </div>-->
        </div>
    </div>

    <div class="menuButton" id="menuB">
        <a href="#" id="menu" onclick="openNav()" >
            <i class="bi bi-list"></i>
        </a>
    </div>

    <main class="main-content" id="content" style="background-color: white">
        <!-- Modal para crear documento -->
      {{--  <!--<div>
              <form action="{{ url('/crearDocumento') }}" method="post">
                {{ csrf_field() }}
                <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalToggleLabel">Creación del documento</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="desmarcar()"></button>
                        </div>
                        <div class="modal-body checkSeccion">
                            <div class="form-check">
                                <input class="form-check-input" onclick="cambio2()" type="checkbox"  name='seccionToda' id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    Todo el documento
                                </label>
                            </div>
                            @php
                                $cont = 0;
                                $estaticas = 0;
                            @endphp
                            @foreach ($secciones as $seccion)
                                @php
                                    ++$cont;
                                @endphp
                                @if ($seccion[1] != -1 && $seccion[1] != -2)
                                    <div class="form-check offset-md-1">
                                        <input class="form-check-input" onclick="cambio(<?=$cont?>)" type="checkbox" value="{{$seccion[1]}}" name='seccion2[]' id="flexCheckDefault{{$cont}}">
                                        <label class="form-check-label" for="flexCheckDefault{{$cont}}">
                                            {{$seccion[0]}}
                                        </label>
                                    </div>
                                @elseif ($seccion[1] == -1)
                                    @php
                                        ++$estaticas;
                                    @endphp
                                    <div class="form-check offset-md-1">
                                        <input class="form-check-input" onclick="cambio(<?=$cont?>)" type="checkbox" value="{{$estaticas}}" name='seccion[]' id="flexCheckDefault{{$cont}}">
                                        <label class="form-check-label" for="flexCheckDefault{{$cont}}">
                                            {{$seccion[0]}}
                                        </label>
                                    </div>
                                @elseif ($seccion[1] == -2)
                                    @php
                                        ++$estaticas;
                                    @endphp
                                    <div class="form-check offset-md-1">
                                        <input class="form-check-input" disabled type="checkbox" value="{{$estaticas}}" name='seccion[]' id="flexCheckDefault{{$cont}}">
                                        <label class="form-check-label" for="flexCheckDefault{{$cont}}">
                                            {{$seccion[0]}}
                                        </label>
                                    </div>
                                @endif
                            @endforeach
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">Siguiente</button>
                        </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalToggleLabel2">Confirmar</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="desmarcar()"></button>
                        </div>
                        <div class="modal-body">
                            <p>Estas partes del documento serán descargados en formato Word</p>
                            <ul id='listadoSecciones'>
                                @foreach ($secciones as $seccion)
                                    @php
                                        ++$cont;
                                    @endphp
                                    <li>{{$seccion[0]}}</li>
                                @endforeach
                            </ul>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">Atras</button>
                            <button class="btn btn-success" data-bs-dismiss="modal" aria-label="Close">Crear</button>
                        </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>-->--}}
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
        document.getElementById("menu").style.display = 'initial';
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
