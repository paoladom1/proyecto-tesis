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
            <h1 style="align-self: center; margin-bottom: 1em; color: #E87B2A;">Log in</h1>
            <div class="formulario">
                <form class="container-sm">
                    <div class="mb-3">
                        <input type="text" class="form-control" placeholder="Usuario">
                    </div>
                    <div class="mb-3">
                        <input type="text" class="form-control" placeholder="Contrasena">
                    </div>
                    <div class="row mb-3">
                        <div class="col-8 justify-content-start" style="align-self: center;">
                            <input type="submit" value="Iniciar sesion" style="background-color: #E87B2A; color:white; border: #E87B2A; border-radius: 3px;" >
                        </div>
                        <div class="col-4 justify-content-end">
                            <a href="#" style="font-size: .9rem; font-weight: bold; text-decoration: none"  onMouseOver="this.style.color='#f00'"
                            onMouseOut="this.style.color='#000'">Problemas para iniciar sesion?</a>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-5">
                            <hr>
                        </div>
                        <div class="col-2">
                            <center><p>o</p></center>
                        </div>
                        <div class="col-5">
                            <hr>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
