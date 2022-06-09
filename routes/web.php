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

Route::get('/', "App\Http\Controllers\Auth\LoginController@showLogin");
Route::post('login', 'App\Http\Controllers\Auth\LoginController@login')->name('login');
Route::get('logout', 'App\Http\Controllers\Auth\LoginController@logout')->name('logout');

/*Route::get('/menu', function () {
    return view('plantillas.plantillaMenuC');
});*/

Route::get('/menu', 'App\Http\Controllers\DocumentoController@formularioModal');

Route::get('/navChino', function(){
    return view('plantillas.maintemplate');
});

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

// Filtros de asesores y directores de trabajo de graduación.
Route::get('/filtro', 'App\Http\Controllers\DirectorController@formularioFiltro');
Route::post('/filtroPost', 'App\Http\Controllers\DirectorController@filtro');
Route::post('/filtroPost2', 'App\Http\Controllers\DirectorController@filtro2');
Route::post('/asignarDocente', 'App\Http\Controllers\DirectorController@asignarD');
Route::post('/buscador', 'App\Http\Controllers\DirectorController@buscador');

// Ventana donde se muestra la modal para crear documento
Route::get('/secciones', 'App\Http\Controllers\DocumentoController@formularioModal');
Route::post('/crearDocumento', 'App\Http\Controllers\DocumentoController@seccionesDocumento');

// Temas y subtemas de cada capitulo
Route::get('/contenidoCapitulo/{id}', 'App\Http\Controllers\EstudianteController@formularioDinamico');
Route::post('/contenidoCapitulo/guardarTemas', 'App\Http\Controllers\EstudianteController@crearDinamico');
Route::post('/contenidoCapitulo/eliminarTema', 'App\Http\Controllers\EstudianteController@eliminarContenido');
Route::post('/contenidoCapitulo/eliminarSubTema', 'App\Http\Controllers\EstudianteController@eliminarContenido2');

// Capitulos
Route::get('/capitulos', 'App\Http\Controllers\EstudianteController@formCapitulos');
Route::post('/insertarCapitulo', 'App\Http\Controllers\EstudianteController@registrar');
Route::post('/modificar', 'App\Http\Controllers\EstudianteController@modificar');
Route::post('/eliminar', 'App\Http\Controllers\EstudianteController@eliminar');

// Resumen
Route::get('/resumen', 'App\Http\Controllers\EstudianteController@frmResumen');
Route::post('/guardarResumen', 'App\Http\Controllers\EstudianteController@saveResumen');

// Referencias
Route::get('/referencias', 'App\Http\Controllers\EstudianteController@frmReferencia');
Route::post('/guardarReferencia', 'App\Http\Controllers\EstudianteController@saveReferencia');

// Glosario
Route::get('/glosario', 'App\Http\Controllers\EstudianteController@frmGlosario');
Route::post('/guardarGlosario', 'App\Http\Controllers\EstudianteController@saveGlosario');
Route::post('/cambiarEstadoGlosario', 'App\Http\Controllers\EstudianteController@cambioEstadoGlosario');

// Abreviatura, nomenclaturas y siglas
Route::get('/abreviaturas', 'App\Http\Controllers\EstudianteController@frmAbreviatura');
Route::post('/guardarAbreviatura', 'App\Http\Controllers\EstudianteController@saveAbreviatura');

// Agradecimientos y dedicatorias
Route::get('/agradecimientos', 'App\Http\Controllers\EstudianteController@frmAgradecimientoDedicatoria');
Route::post('/guardarAgradecimiento', 'App\Http\Controllers\EstudianteController@saveAgradecimiento');
Route::post('/guardarDedicatoria', 'App\Http\Controllers\EstudianteController@saveDedicatoria');
Route::post('/eliminarDedicatoriaAgradecimiento', 'App\Http\Controllers\EstudianteController@deleteDedicatoriaAgradecimiento');
Route::post('/cambiarEstado', 'App\Http\Controllers\EstudianteController@cambioEstado');

// Director de carrera
Route::get('/menudirector', "App\Http\Controllers\DirectorController@menuDirector");
Route::get('/lector', function () {
    return view('director.lector');
});

Route::get('/lectorv', function () {
    return view('director.lectorvergon');
});

// Perfil de usuario
Route::get('/perfil', 'App\Http\Controllers\GeneralController@mostrarPerfil');
Route::post('/cambiarDatos', 'App\Http\Controllers\GeneralController@cambiarDatos');
Route::post('/descartar', 'App\Http\Controllers\GeneralController@descartandoCambios');