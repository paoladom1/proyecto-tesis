@extends('plantillas.nav')
@section('content')
    <div class="container" style="background-color: white">
        <div class="row">
            <div class="container mPrincipal">
                <div class="row" id="titulosApp">
                    <h1 class="mt-3" style="font-size: 1.4em;">"{{$tema}}"</h1>
                </div>
                <center>
                <div class="row row-cols-1 row-cols-sm-1 row-cols-md-3 g-4 mt-1 mb-3">
                    <div class="col">
                        <a href="{{ url('/resumen') }}" style="text-decoration: none; color: black;">
                            <div class="card m-3 position-static card-menu" style="width: 18rem;">
                                <img src="img/fondoCard.jpeg" class="card-img-top img-card" alt="Card image cap">
                                <div class="card-body body-card mt-2">
                                    <h5 class="card-title">RESUMEN</h5>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col">
                        <a href="{{ url('/agradecimientos') }}" style="text-decoration: none; color: black;">
                            <div class="card m-3 position-static card-menu" style="width: 18rem;">
                                <img src="img/fondoCard2.jpeg" class="card-img-top img-card" alt="Card image cap">
                                <div class="card-body body-card mt-2">
                                    <h5 class="card-title">AGRADECIMIENTOS</h5>
                                </div>
                            </div>
                        </a>   
                    </div>

                    <div class="col">
                        <a href="{{ url('/abreviaturas') }}" style="text-decoration: none; color: black;">
                            <div class="card m-3 position-static card-menu" style="width: 18rem;" >
                                <img src="img/fondoCard3.jpeg" class="card-img-top img-card" alt="Card image cap">
                                <div class="card-body body-card mt-2">
                                    <h5 class="card-title">ABREVIATURAS</h5>
                                </div>
                            </div>
                        </a>
                    </div>

                    <!------------------------------------------------------------------------------------------------------>

                    <div class="col">
                        <a href="{{ url('/capitulos') }}" style="text-decoration: none; color: black;">
                            <div class="card m-3 position-static card-menu" style="width: 18rem;">
                                <img src="img/fondoCard4.jpeg" class="card-img-top img-card" alt="Card image cap">
                                <div class="card-body body-card mt-2">
                                    <h5 class="card-title">CAPÍTULOS</h5>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col">
                        <a href="{{ url('/glosario') }}" style="text-decoration: none; color: black;">
                            <div class="card m-3 position-static card-menu" style="width: 18rem;">
                                <img src="img/fondoCard5.jpeg" class="card-img-top img-card" alt="Card image cap">
                                <div class="card-body body-card mt-2">
                                    <h5 class="card-title">GLOSARIO</h5>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col">
                        <a href="{{ url('/referencias') }}" style="text-decoration: none; color: black;">
                            <div class="card m-3 position-static card-menu" style="width: 18rem;">
                                <img src="img/fondoCard6.jpeg" class="card-img-top img-card" alt="Card image cap">
                                <div class="card-body body-card mt-2">
                                    <h5 class="card-title">REFERENCIAS</h5>
                                </div>
                            </div>
                        </a>
                    </div>

                </div>

                </center>
            </div>
        </div>
        <div class="row mt-3">
            <div class="container" style="background-color: #e3eef5; border:1px #003C71 solid; box-shadow: 5px 7px 7px gray;margin-top: 30px;">
                <div class="row" id="titulosApp" style="padding: 0;">
                    <h3 class="mt-3">ULTIMOS CAMBIOS</h3>
                </div>
                <div class="list-group list-group-horizontal justify-content-center m-3">
                    <input type="text" class="list-group-item" placeholder="Seccion" readonly/>
                    <input type="text" class="list-group-item" placeholder="Autor" readonly/>
                    <input type="text" class="list-group-item" placeholder="Fecha" readonly/>
                    <button class="btn btn-success" style="color: white;"><i class="bi bi-eye"></i> Ver</button>
                </div>
            </div>
        </div>

    </div>

    <a class="float-button" data-bs-toggle="modal" href="#exampleModalToggle" role="button"><i class="bi bi-file-earmark-text float-icon"></i></a>

    <!-- Crear documento -->
    <form action="{{ url('/crearDocumento') }}" method="post">
        {{ csrf_field() }}
        <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                <div class="modal-header" style="background-color: #003C71;">
                    <h5 class="modal-title" id="exampleModalToggleLabel" style="color: white;">Creación del documento</h5>
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
                    <button type="button" class="btn btn-success" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" style="background-color: #003C71">Siguiente</button>
                </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
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
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">Atras</button>
                    <button class="btn btn-success" data-bs-dismiss="modal" aria-label="Close">Crear</button>
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

        var desabilitados = 0;

        var listado = document.querySelectorAll("#listadoSecciones li");
        
        var check = document.querySelectorAll('.checkSeccion .form-check-input');

        for (let index = 1; index < check.length; index++) {
            if(check[index].disabled && check[index].value != -9 && check[index].value != -2 && check[index].value != -3){
                ++desabilitados;
            }  
        }
        
        function cambio(checkbox){
            if(check[checkbox].checked){
                listado[checkbox-1].style.display = 'block';
                var cont = 0;
                for (let index = 1; index < check.length; index++) {
                    if(check[index].checked && check[index].value != -9 && check[index].value != -2 && check[index].value != -3){
                        ++cont;
                    }  
                }
                if(cont == check.length-(4+desabilitados)){
                    check[0].checked = true;
                }
            }
            else{
                if (check[checkbox].value != -9 || check[checkbox].value != -2 || check[checkbox].value != -3) {
                    check[0].checked = false; 
                } else{
                    check[0].checked = true; 
                }
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
            if(check[0].checked){
                check[0].checked = false;
            }
            for (let index = 1; index < check.length; index++) {
                if (check[index].checked) {
                    check[index].checked = false;
                    listado[index-1].style.display = 'none';   
                }
            }
        }
</script>

@endsection


