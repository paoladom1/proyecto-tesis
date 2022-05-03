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
<style>

#user-btn{
    margin-right: 1em;
    background-color: #003C71;
    border: none;
    transition: all 0.3s;
}

#profile{
    transition: all 0.3s;
}

#user-btn:hover #profile{
    transform: scale(1.15);
}
#triangulo{
    width: 0;
    height: 0;
    border-top: 8px solid white;
    border-left: 4px solid transparent;
    border-right: 4px solid transparent;
    align-self: center;
}
.user-content{
    display: none;
    position: absolute;
    background-color: #f1f1f1;
    width: 4%;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.user-content a {
  color: black;
  text-decoration: none;
    padding: 1em;
  display: block;
  font-size: 0.85em;
}
.user-content a:hover {
    background-color: white;
}

.show {display:block;}

#accordion{
    transition: all 0.5s;
}

#accordion:hover{
    background-color: skyblue;
}

.dropdown-btn{
    background-color: skyblue;
    border: none;
    color: white;
}

ul li a:hover {
    color: #fff;
    background: #E87B2A
}
ul li.active>a,
a[aria-expanded="true"] {
    color: #fff;
    background: #E87B2A
}

</style>


<body>
    <nav class="navGral d-flex justify-content-between" id="nav">
        <a href="#">
            <img src="/img/Logo.png" alt="" class="d-inline-block align-text-top navImg">
           
        </a>
        <div class="dropdown" id="user-settings">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="user-btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img src="img/profile.png" id="profile" style="width: 2.5em; border-radius: 100%;"/>
            </button>
            <div class="dropdown-menu" aria-labelledby="user-btn">
              <a class="dropdown-item" href="#">Editar perfil</a>
              <hr class="dropdown-divider">
              <a class="dropdown-item" href="#">Cerrar sesion</a>
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

            <!--<div class="profileItem row">
                <div class = "col">
                    <img class="profileImg" src="/img/profile.png" alt="" class="d-inline-block align-text-top">
                </div>
                <div class = "col infoContainer">
                    <div class="row userName">
                        <p>Usuario x</p>
                    </div>
                    <div class="row groupName">
                        <p>Grupo x</p>
                    </div>
                </div>
            </div>-->
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
                <li> <a href="#portadas" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Portada</a>
                    <ul class="collapse list-unstyled" id="portadas">
                        <li> <a href="#">Primer Portada</a> </li>
                        <li> <a href="#">Segunda Portada</a> </li>
                    </ul>
                </li>
                <li> <a href="#">Timeline</a> </li>
                <li> <a href="#">Live Chat</a> </li>
                <li> <a href="#">Likes</a> </li>
                <li> <a href="#">Comments</a> </li>
            </ul>
            
            <hr>
            <div class="logOut">
                <a href="#">Cerrar sesión</a>
            </div>
        </div>
    </div>

    <div class="menuButton" id="menuB">
        <a href="#" id="menu" onclick="openNav()">
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
    </script>
@include('plantillas.footer')
