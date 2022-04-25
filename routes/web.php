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


Route::get('/menu', function () {
    return view('plantillas.plantillaMenu');
});

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
Route::get('/secciones', 'App\Http\Controllers\PruebasController@formularioModal');
Route::post('/crearDocumento', 'App\Http\Controllers\PruebasController@seccionesDocumento');

// Temas y subtemas de cada capitulo
Route::get('/fdinamico/{id}', 'App\Http\Controllers\PruebasController@formularioDinamico');
Route::post('/fdinamico/guardarTemas', 'App\Http\Controllers\PruebasController@crearDinamico');
Route::post('/fdinamico/eliminarTema', 'App\Http\Controllers\PruebasController@eliminarContenido');
Route::post('/fdinamico/eliminarSubTema', 'App\Http\Controllers\PruebasController@eliminarContenido2');

// Capitulos
Route::get('/capitulos', 'App\Http\Controllers\PruebasController@formCapitulos');
Route::post('/insertarCapitulo', 'App\Http\Controllers\PruebasController@registrar');
Route::post('/modificar', 'App\Http\Controllers\PruebasController@modificar');
Route::post('/eliminar', 'App\Http\Controllers\PruebasController@eliminar');
