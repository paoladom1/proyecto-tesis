<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <title>Secciones de documento</title>
</head>
<body>
    <style>
        #listadoSecciones li{
            display: none;
        }
    </style>
    <div class="container">
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
        <br>
        <a class="btn btn-warning" data-bs-toggle="modal" href="#exampleModalToggle" role="button">Crear documento</a>
    </div>
</body>
</html>

<script>    
    var listado = document.querySelectorAll("#listadoSecciones li");
    
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
    }
</script>