@extends('plantillas.nav')
@section('content')

<style>


</style>

    <div class="container" style="background-color: white">
        <div class="row">
            <div class="container mPrincipal">
                <div class="row " style="margin-top: 2em;">
                    <center><h1>Tema tesis</h1></center>
                </div>
                <center>
                <div class="row row-cols-1 row-cols-sm-1 row-cols-md-3 g-4 mt-3">
                

                    <div class="col">
                        <a  href="{{ url('/portada') }}" style="text-decoration: none; color: black;" >
                            <div class="card m-3 position-static card-menu" style="width: 18rem;" >
                                <img src="img/Fondo.jpg" class="card-img-top img-card" alt="Card image cap">
                                <div class="card-body body-card mt-2">
                                    <h5 class="card-title">Portada</h5>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col">
                        <a href="{{ url('/resumen') }}" style="text-decoration: none; color: black;">
                            <div class="card m-3 position-static card-menu" style="width: 18rem;">
                                <img src="img/Fondo.jpg" class="card-img-top img-card" alt="Card image cap">
                                <div class="card-body body-card mt-2">
                                    <h5 class="card-title">Resumen</h5>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col">
                        <a href="{{ url('/agradecimientos') }}" style="text-decoration: none; color: black;">
                            <div class="card m-3 position-static card-menu" style="width: 18rem;">
                                <img src="img/Fondo.jpg" class="card-img-top img-card" alt="Card image cap">
                                <div class="card-body body-card mt-2">
                                    <h5 class="card-title">Agradecimientos</h5>
                                </div>
                            </div>
                        </a>   
                    </div>


                    <!------------------------------------------------------------------------------------------------------>

                    <div class="col">
                        <a href="{{ url('/abreviaturas') }}" style="text-decoration: none; color: black;">
                            <div class="card m-3 position-static card-menu" style="width: 18rem;" >
                                <img src="img/Fondo.jpg" class="card-img-top img-card" alt="Card image cap">
                                <div class="card-body body-card mt-2">
                                    <h5 class="card-title">Abreviaturas</h5>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col">
                        <a href="{{ url('/capitulos') }}" style="text-decoration: none; color: black;">
                            <div class="card m-3 position-static card-menu" style="width: 18rem;">
                                <img src="img/Fondo.jpg" class="card-img-top img-card" alt="Card image cap">
                                <div class="card-body body-card mt-2">
                                    <h5 class="card-title">Capítulos</h5>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col">
                        <a href="{{ url('/glosario') }}" style="text-decoration: none; color: black;">
                            <div class="card m-3 position-static card-menu" style="width: 18rem;">
                                <img src="img/Fondo.jpg" class="card-img-top img-card" alt="Card image cap">
                                <div class="card-body body-card mt-2">
                                    <h5 class="card-title">Glosario</h5>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col">
                        <a href="{{ url('/referencias') }}" style="text-decoration: none; color: black;">
                            <div class="card m-3 position-static card-menu" style="width: 18rem;">
                                <img src="img/Fondo.jpg" class="card-img-top img-card" alt="Card image cap">
                                <div class="card-body body-card mt-2">
                                    <h5 class="card-title">Referencias</h5>
                                </div>
                            </div>
                        </a>
                    </div>

                </div>

                </center>
            </div>
        </div>
        <div class="row mt-3">
            <div class="container" style="background-color: #e3eef5; border:1px #003C71 solid; border-top: #003C71 7px solid;">
                <center><h3 class="mt-3">Ultimos cambios</h3></center>
                <div class="list-group list-group-horizontal justify-content-center m-3">
                    <input type="text" class="list-group-item" placeholder="Seccion" readonly/>
                    <input type="text" class="list-group-item" placeholder="Autor" readonly/>
                    <input type="text" class="list-group-item" placeholder="Fecha" readonly/>
                    <button class="list-group-item" style="color: white; background-color: #003C71">Ver</button>
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

@endsection


