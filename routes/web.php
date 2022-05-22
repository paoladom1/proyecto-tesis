<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('home');
});


/*Route::get('/menu', function () {
    return view('plantillas.plantillaMenuC');
});*/

Route::get('/menu', 'App\Http\Controllers\PruebasController@formularioModal');
Route::post('/crearDocumento', 'App\Http\Controllers\PruebasController@seccionesDocumento');

Route::get('/navChino', function(){
    return view('plantillas.maintemplate');
});

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

// Filtros de asesores y directores de trabajo de graduación.
Route::get('/filtro', 'App\Http\Controllers\PruebasController@formularioFiltro');
Route::post('/filtroPost', 'App\Http\Controllers\PruebasController@filtro');
Route::post('/filtroPost2', 'App\Http\Controllers\PruebasController@filtro2');
Route::post('/asignarDocente', 'App\Http\Controllers\PruebasController@asignarD');
Route::post('/buscador', 'App\Http\Controllers\PruebasController@buscador');

// Ventana donde se muestra la modal para crear documento
Route::get('/secciones', 'App\Http\Controllers\DocumentoController@formularioModal');
Route::post('/crearDocumento', 'App\Http\Controllers\DocumentoController@seccionesDocumento');

// Temas y subtemas de cada capitulo
Route::get('/fdinamico/{id}', 'App\Http\Controllers\EstudianteController@formularioDinamico');
Route::post('/fdinamico/guardarTemas', 'App\Http\Controllers\EstudianteController@crearDinamico');
Route::post('/fdinamico/eliminarTema', 'App\Http\Controllers\EstudianteController@eliminarContenido');
Route::post('/fdinamico/eliminarSubTema', 'App\Http\Controllers\EstudianteController@eliminarContenido2');

// Capitulos
Route::get('/capitulos', 'App\Http\Controllers\EstudianteController@formCapitulos');
Route::post('/insertarCapitulo', 'App\Http\Controllers\EstudianteController@registrar');
Route::post('/modificar', 'App\Http\Controllers\EstudianteController@modificar');
Route::post('/eliminar', 'App\Http\Controllers\EstudianteController@eliminar');



//Rutas de prueba para UI
/*Route::get('/menu', function () {
    return view('plantillas.menuprincipal');
});*/

Route::get('/user', function () {
    return view('usuarios.usuario');
});

Route::get('/menudirector', function () {
    return view('plantillas.plantillaMenuDirector');
});

Route::get('/lector', function () {
    return view('director.lector');
});

Route::get('/portada', function(){
    return view('formulariosDoc.portadas');
});

Route::get('/resumen', function(){
    return view('formulariosDoc.resumen');
});

Route::get('/abreviaturas', function(){
    return view('formulariosDoc.abreviaturas');
});

Route::get('/agradecimientos', function(){
    return view('formulariosDoc.agradecimientos');
});

Route::get('/referencias', function(){
    return view('formulariosDoc.referencias');
});

Route::get('/glosario', function(){
    return view('formulariosDoc.glosario');
});