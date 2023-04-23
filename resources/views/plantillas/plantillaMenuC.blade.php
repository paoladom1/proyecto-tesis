@extends('plantillas.nav')
@section('content')
    <div class="container-fluid" style="background-color: white; width: 85%">
        <div class="row">
            <div class="container mPrincipal">
                <div class="row" id="titulosApp">
                    <h1 class="mt-3" style="font-size: 1.4em;">"{{$tema}}"</h1>
                </div>
                <center>
                <div class="row row-cols-1 row-cols-sm-1 row-cols-md-3 g-4 mt-1 mb-3">
                    <div class="col">
                            <div class="card m-3 position-static card-menu" style="width: 90%;">
                                <a href="{{ url('/resumen') }}" style="text-decoration: none; color: black;">
                                    <img src="img/fondoCard.jpeg" class="card-img-top img-card" alt="Card image cap">
                                    <div class="card-body body-card mt-2">
                                        <h5 class="card-title">RESUMEN</h5>
                                    </div>
                                </a>
                            </div>
                    </div>

                    <div class="col">
                            <div class="card m-3 position-static card-menu" style="width: 90%;">
                                <a href="{{ url('/agradecimientos') }}" style="text-decoration: none; color: black;">
                                    <img src="img/fondoCard2.jpeg" class="card-img-top img-card" alt="Card image cap">
                                    <div class="card-body body-card mt-2">
                                        <h5 class="card-title">AGRADECIMIENTOS</h5>
                                    </div>
                                </a>
                            </div>
                    </div>

                    <div class="col">
                            <div class="card m-3 position-static card-menu" style="width: 90%;" >
                                <a href="{{ url('/abreviaturas') }}" style="text-decoration: none; color: black;">
                                    <img src="img/fondoCard3.jpeg" class="card-img-top img-card" alt="Card image cap">
                                    <div class="card-body body-card mt-2">
                                        <h5 class="card-title">ABREVIATURAS</h5>
                                    </div>
                                </a>
                            </div>
                    </div>

                    <!------------------------------------------------------------------------------------------------------>

                    <div class="col">
                            <div class="card m-3 position-static card-menu" style="width: 90%;">
                                <a href="{{ url('/capitulos') }}" style="text-decoration: none; color: black;">
                                    <img src="img/fondoCard4.jpeg" class="card-img-top img-card" alt="Card image cap">
                                    <div class="card-body body-card mt-2">
                                        <h5 class="card-title">CAPÍTULOS</h5>
                                    </div>
                                </a>
                            </div>
                    </div>

                    <div class="col">
                            <div class="card m-3 position-static card-menu" style="width: 90%;">
                                <a href="{{ url('/glosario') }}" style="text-decoration: none; color: black;">
                                    <img src="img/fondoCard5.jpeg" class="card-img-top img-card" alt="Card image cap">
                                    <div class="card-body body-card mt-2">
                                        <h5 class="card-title">GLOSARIO</h5>
                                    </div>
                                </a>
                            </div>
                    </div>

                    <div class="col">
                            <div class="card m-3 position-static card-menu" style="width: 90%;">
                                <a href="{{ url('/referencias') }}" style="text-decoration: none; color: black;">
                                    <img src="img/fondoCard6.jpeg" class="card-img-top img-card" alt="Card image cap">
                                    <div class="card-body body-card mt-2">
                                        <h5 class="card-title">REFERENCIAS</h5>
                                    </div>
                                </a>
                            </div>
                    </div>

                    <!------------------------------------------------------------------------------------------------------>

                    <div class="col">
                            <div class="card m-3 position-static card-menu" style="width: 90%;">
                                <a href="{{ url('/bitacora') }}" style="text-decoration: none; color: black;">
                                    <img src="img/fondoCard7.jpeg" class="card-img-top img-card" alt="Card image cap">
                                    <div class="card-body body-card mt-2">
                                        <h5 class="card-title">BITÁCORA</h5>
                                    </div>
                                </a>
                            </div>
                    </div>
                </div>

                </center>
            </div>
            
        </div>
        <a class="float-button btn-float-2" data-bs-toggle="modal" href="#exampleModalToggle" role="button" style="width: auto; margin-bottom: 10px"><i class="bi bi-file-earmark-text float-icon"></i></a>
    </div>
    <br>
    <!-- Crear documento -->
    <form action="{{ url('/crearDocumento') }}" method="post">
        {{ csrf_field() }}
        <div class="modal fade fuente-general" id="exampleModalToggle" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                <div class="modal-header" style="background-color: #003C71; border-bottom: solid #E87B2A 8px;">
                    <h5 class="modal-title" id="exampleModalToggleLabel" style="color: white;"><i class="bi bi-filetype-doc"></i> Creación del documento</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close" onclick="desmarcar()"></button>
                </div>
                <div class="modal-body checkSeccion">
                    <div class="form-check">
                        <input class="form-check-input" onclick="cambio2()" type="checkbox" value="0" name='seccionToda' id="flexCheckDefault">
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
                        @if ($seccion[1] > 0)
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
                                <input class="form-check-input" onclick="cambio(<?=$cont?>)" type="checkbox" value="-{{$estaticas}}" name='seccion[]' id="flexCheckDefault{{$cont}}">
                                <label class="form-check-label" for="flexCheckDefault{{$cont}}">
                                    {{$seccion[0]}}
                                </label>
                            </div>
                        @elseif ($seccion[1] == -2)
                            @php
                                ++$estaticas;
                            @endphp
                            <div class="form-check offset-md-1">
                                <input class="form-check-input" onclick="cambio(<?=$cont?>)" type="checkbox" value="-{{$estaticas}}" name='seccion3[]' id="flexCheckDefault{{$cont}}">
                                <label class="form-check-label" for="flexCheckDefault{{$cont}}">
                                    {{$seccion[0]}}
                                </label>
                            </div>
                        @elseif ($seccion[1] == -3)
                            @php
                                ++$estaticas;
                            @endphp
                            <div class="form-check offset-md-1">
                                <input class="form-check-input" disabled type="checkbox" value="-{{$estaticas}}" name='seccion[]' id="flexCheckDefault{{$cont}}">
                                <label class="form-check-label" for="flexCheckDefault{{$cont}}">
                                    {{$seccion[0]}}
                                </label>
                            </div>
                        @elseif ($seccion[1] == -4)
                            <div class="form-check offset-md-1">
                                <input class="form-check-input" disabled type="checkbox" value="" name='seccion4[]' id="flexCheckDefault{{$cont}}">
                                <label class="form-check-label" for="flexCheckDefault{{$cont}}">
                                    {{$seccion[0]}}
                                </label>
                            </div>
                        @endif
                    @endforeach
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" style="background-color: #003C71">Siguiente <i class="bi bi-arrow-right-circle"></i></button>
                </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="exampleModalToggle2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                <div class="modal-header" style="background-color: #003C71">
                    <h5 class="modal-title" id="exampleModalToggleLabel2" style="color: white;">Confirmar</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close" onclick="desmarcar()"></button>
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
                    <h5 style="text-align: center;" id="mensaje-error-secciones">¡No se ha seleccionado ninguna sección!</h5>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-target="#exampleModalToggle" data-bs-toggle="modal"><i class="bi bi-arrow-left-circle"></i> Atras</button>
                    <button class="btn btn-success" id="btn-crear-documento" data-bs-dismiss="modal" aria-label="Close">Crear <i class="bi bi-folder2"></i></button>
                </div>
                </div>
            </div>
        </div>
    </form>
<script>
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl)
        })

        var listado = document.querySelectorAll("#listadoSecciones li");

        var check = document.querySelectorAll('.checkSeccion .form-check-input');

        document.getElementById("btn-crear-documento").disabled = true; 

        function cambio(checkbox){
            if(check[checkbox].checked){
                listado[checkbox-1].style.display = 'block';
                var cont = 0;
                for (let index = 1; index < check.length; index++) {
                    if(check[index].checked && check[index].value != -9 && check[index].value != -2 && check[index].value != -3){
                        ++cont;
                    }
                }
                document.getElementById("btn-crear-documento").disabled = false;
                document.getElementById("mensaje-error-secciones").style.display = 'none';
                if(cont == check.length-4){
                    check[0].checked = true;
                }
            }
            else{
                if (check[checkbox].value != -9 || check[checkbox].value != -2 || check[checkbox].value != -3){
                    check[0].checked = false;
                    document.getElementById("btn-crear-documento").disabled = false;
                    document.getElementById("mensaje-error-secciones").style.display = 'none';
                }
                listado[checkbox-1].style.display = 'none';
                
                // Comprueba si hay alguna seccion seleccionada y si no hay ninguna seleccionada, desabilita el boton de crear.
                let banCheck = 0; 
                let contAct = 0;
                for (let index = 0; index < check.length; index++) {
                    if (check[index].checked) {
                        banCheck = 1; 
                    }
                    if (check[index].checked && check[index].value != -9 && check[index].value != -2 && check[index].value != -3) {
                        ++contAct;
                    }
                }

                if (contAct == check.length-4) {
                    check[0].checked = true;
                }

                if (banCheck == 0) {
                    document.getElementById("btn-crear-documento").disabled = true;
                    document.getElementById("mensaje-error-secciones").style.display = 'block';
                }
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
            if(check[0].checked){
                check[0].checked = false;
            }
            document.getElementById("btn-crear-documento").disabled = true;
            document.getElementById("mensaje-error-secciones").style.display = 'block';
            for (let index = 1; index < check.length; index++) {
                if (check[index].checked) {
                    check[index].checked = false;
                    listado[index-1].style.display = 'none';
                }
            }
        }
</script>

@endsection



