<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Portada</title>
</head>
<body>
    <div class='container'>
        <br>
        <h1>Crear portada</h1>
        <hr>
        <form class='col-md-7 offset-md-2'  action="{{ url('/crear') }}" method='POST'>
            {{ csrf_field() }}
            <h2>Portada</h2>
            <hr>
            <div class="mb-3">
                <label for="tema" class="form-label">Tema del proyecto</label>
                <input type="text" class="form-control" id='tema' name='tema'>
            </div>
            <div class="mb-3">
                <label for="carrera" class="form-label">Carrera</label>
                <input type="text" class="form-control" id='carrera' name='carrera'>
            </div>
            <div class="mb-3">
                <label for="facultad" class="form-label">Facultad</label>
                <input type="text" class="form-control" id='facultad' name='facultad'>
            </div>
            <div class="btn-group" role="group" aria-label="Basic radio toggle button group" style='margin-bottom: 10px;'>
                <input type="radio" onclick="equipo()" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked value='1'>
                <label class="btn btn-outline-primary" for="btnradio1">1 integrante</label>

                <input type="radio" onclick="equipo()" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" value='2'>
                <label class="btn btn-outline-primary" for="btnradio2">2 integrantes</label>

                <input type="radio" onclick="equipo()" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" value='3'>
                <label class="btn btn-outline-primary" for="btnradio3">3 integrante</label>

                <input type="radio" onclick="equipo()" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off" value='4'>
                <label class="btn btn-outline-primary" for="btnradio4">4 integrante</label>
            </div>
            <div class="mb-3 integrante1">
                <label for="integrante1" class="form-label">Integrante 1</label>
                <input type="text" class="form-control" id='integrante1' name='integrante1'>
            </div>
            <div class="mb-3 integrante2">
                <label for="integrante2" class="form-label">Integrante 2</label>
                <input type="text" class="form-control" id='integrante2' name='integrante2'>
            </div>
            <div class="mb-3 integrante3">
                <label for="integrante3" class="form-label">Integrante 3</label>
                <input type="text" class="form-control" id='integrante3' name='integrante3'>
            </div>
            <div class="mb-3 integrante4">
                <label for="integrante4" class="form-label">Integrante 4</label>
                <input type="text" class="form-control" id='integrante4' name='integrante4'>
            </div>
            <div class="mb-3">
                <label for="fecha" class="form-label">Fecha del proyecto</label>
                <input type="text" class="form-control" name='fecha' id='fecha'>
            </div>
            <div class="mb-3">
                <label for="lugar" class="form-label">Lugar</label>
                <input type="text" class="form-control" name='lugar' id='lugar'>
            </div>
            <h2>Segunda portada</h2>
            <hr>
            <div class="mb-3">
                <label for="rector" class="form-label">Rector</label>
                <input type="text" class="form-control" name='rector' id='rector'>
            </div>
            <div class="mb-3">
                <label for="secretaria" class="form-label">Secretaria</label>
                <input type="text" class="form-control" name='secretaria' id='secretaria'>
            </div>
            <div class="mb-3">
                <label for="decano" class="form-label">Decano</label>
                <input type="text" class="form-control" name='decano' id='decano'>
            </div>
            <div class="mb-3">
                <label for="carrera2" class="form-label">Carrera de la tesis</label>
                <input type="text" class="form-control" name='carrera2' id='carrera2'>
            </div>
            <div class="mb-3">
                <label for="director" class="form-label">Director</label>
                <input type="text" class="form-control" name='director' id='director'>
            </div>
            <div class="mb-3">
                <label for="director_trabajo" class="form-label">Director del trabajo</label>
                <input type="text" class="form-control" name='director_trabajo' id='director_trabajo'>
            </div>
            <div class="mb-3">
                <label for="lector" class="form-label">Lector</label>
                <!--<textarea name="lector" id="lector" cols="30" rows="10"></textarea>-->
                <input type="text" class="form-control" name='lector' id='lector'>
            </div>
            <button type="submit" class="btn btn-success">Crear portada</button>
        </form>
        <br>
    </div>
</body>
</html>

<script>
    document.getElementsByClassName('integrante2')[0].style.display = 'none';
    document.getElementsByClassName('integrante3')[0].style.display = 'none';
    document.getElementsByClassName('integrante4')[0].style.display = 'none';
    function equipo(){
        let integrantes = document.querySelector('input[name="btnradio"]:checked').value;
        if (integrantes == 1) {
            document.getElementsByName('integrante2')[0].value = '';
            document.getElementsByName('integrante3')[0].value = '';
            document.getElementsByName('integrante4')[0].value = '';
            document.getElementsByClassName('integrante1')[0].style.display = 'block';
            document.getElementsByClassName('integrante2')[0].style.display = 'none';
            document.getElementsByClassName('integrante3')[0].style.display = 'none';
            document.getElementsByClassName('integrante4')[0].style.display = 'none';
        } else if(integrantes == 2){
            document.getElementsByName('integrante3')[0].value = '';
            document.getElementsByName('integrante4')[0].value = '';
            document.getElementsByClassName('integrante3')[0].style.display = 'none';
            document.getElementsByClassName('integrante4')[0].style.display = 'none';
            document.getElementsByClassName('integrante1')[0].style.display = 'block';
            document.getElementsByClassName('integrante2')[0].style.display = 'block';
        } else if(integrantes == 3){
            document.getElementsByName('integrante4')[0].value = '';
            document.getElementsByClassName('integrante4')[0].style.display = 'none';
            document.getElementsByClassName('integrante1')[0].style.display = 'block';
            document.getElementsByClassName('integrante2')[0].style.display = 'block';
            document.getElementsByClassName('integrante3')[0].style.display = 'block';
        } else if(integrantes == 4){
            document.getElementsByClassName('integrante4')[0].style.display = 'block';
            document.getElementsByClassName('integrante1')[0].style.display = 'block';
            document.getElementsByClassName('integrante2')[0].style.display = 'block';
            document.getElementsByClassName('integrante3')[0].style.display = 'block';
        }   
    }
</script>