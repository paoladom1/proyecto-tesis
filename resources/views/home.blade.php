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
    <link href = "{{URL::asset('css/app.css')}}" rel="stylesheet">

    <title>Proceso de graduación</title>
</head>
<body>

    <nav class="navbar">
        <h4>
            Proceso de graduación UCA
        </h4>
    </nav>

    <div class = "container-fluid canva">

        <div class = "sector1"  style="background-image: url('img/Fondo.jpg')">
            <img src="img/LogoUCAnegro.png" alt="" class="d-inline-block align-text-top">
            <p>
                Universidad Centroamericana <br> José Simeón Cañas
            </p>

        </div>

        <div class = "sector2">
            <h1 style="align-self: center; margin-bottom: 1em; color: #E87B2A;">Inicio de sesión</h1>
            <div class="formulario">
                <form class='container-sm'  action="{{ route('login') }}" method='POST'>
                    {{ csrf_field() }}
                    <div class="mb-3">
                        <input type="text" name="email" class="form-control" placeholder="Usuario">
                        {!! $errors->first('email', '<span class="help-block">:message</span>') !!}
                    </div>
                    <div class="mb-1">
                        <input type="password" name="password" class="form-control" placeholder="Contraseña">
                        {!! $errors->first('password', '<span class="help-block">:message</span>') !!}
                    </div>
                    <div class="row mb-3">
                        <div class="">
                            <a href="#" style="font-size: .75rem; font-weight: bold; text-decoration: none"  onMouseOver="this.style.color='#f00'"
                            onMouseOut="this.style.color='blue'">¿Olvidaste la contraseña?</a>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-8 justify-content-start" style="align-self: center;">
                            <input type="submit" value="Iniciar sesion" style="background-color: #E87B2A; color:white; border: #E87B2A; border-radius: 3px; size: 2em; padding: .5em;" >
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col d-flex justify-content-center">
                            <a><i class="bi bi-facebook ms-2 me-2 licon fb" ></i></a>
                            <a><i class="bi bi-instagram ms-2 me-2 licon in"></i></a>
                            <a><i class="bi bi-twitter ms-2 me-2 licon tw"></i></a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
<style>
    .licon{
        font-size: 1.5em;
    }
    .fb{
        color: blue;
    }
    .in{
        color: fuchsia;
    }
    .tw{
        color: skyblue;
    }
</style>
</body>
</html>
