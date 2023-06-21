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

// Inicio
Route::get('/', "App\Http\Controllers\Auth\LoginController@showLogin");
Route::post('login', 'App\Http\Controllers\Auth\LoginController@login')->name('login');
Route::get('logout', 'App\Http\Controllers\Auth\LoginController@logout')->name('logout');

// Perfil de usuario
Route::get('/perfil', 'App\Http\Controllers\GeneralController@mostrarPerfil');
Route::post('/cambiarDatos', 'App\Http\Controllers\GeneralController@cambiarDatos');
Route::post('/descartar', 'App\Http\Controllers\GeneralController@descartandoCambios');

// ----------------------------------- Estudiantes o grupos de trabajo -----------------------------------
Route::get('/menu', 'App\Http\Controllers\DocumentoController@formularioModal');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

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

// Bitacora de cambios
Route::get('/bitacora', 'App\Http\Controllers\EstudianteController@frmBitacora');
Route::post('/obtenerInfo', 'App\Http\Controllers\EstudianteController@buscarInformacion');

// ----------------------------------- Director de carrera -----------------------------------
Route::get('/menudirector', "App\Http\Controllers\DirectorController@menuDirector");

// Seccion de lector o asesor externo
Route::get('/externo', "App\Http\Controllers\DirectorController@frmLectorAsesor");
Route::post('/registrarLA', 'App\Http\Controllers\DirectorController@registrarLA');
Route::post('/mostrarDato', 'App\Http\Controllers\DirectorController@mostrarDato');

// Grupos de trabajo de graduación
Route::get('/grupoTrabajo', 'App\Http\Controllers\DirectorController@formularioGruposTrabajo');
Route::post('/filtroFacultad', 'App\Http\Controllers\DirectorController@filtroF');
Route::post('/filtroDepartamento', 'App\Http\Controllers\DirectorController@filtroD');
Route::post('/datosExterno', 'App\Http\Controllers\DirectorController@datosExterno');
Route::post('/registrarGrupo', 'App\Http\Controllers\DirectorController@registrarGrupo');
Route::post('/mostrarDatoGrupo', 'App\Http\Controllers\DirectorController@mostrarDatosGrupo');


Route::post('/mostrarDatoEstudiante', 'App\Http\Controllers\DirectorController@mostrarDatoEstudiante');
Route::post('/buscador', 'App\Http\Controllers\DirectorController@buscador');

Route::get('/configDirector', 'App\Http\Controllers\DirectorController@mostrarConfig')->name('config');
Route::put('/actualizarConfig/{director}', 'App\Http\Controllers\DirectorController@actualizarConfig');

// ----------------------------------- Administrador de sistema -----------------------------------
Route::get('/menuadmin', "App\Http\Controllers\NewAdminController@menuAdmin");

// Usuarios
Route::post('/nuevoUsuario', 'App\Http\Controllers\NewAdminController@registrarUsuario');
Route::get('/mostrarUsuario', 'App\Http\Controllers\NewAdminController@mostrarUsuario')->name('users');
Route::get('/editarUsuario/{usuario}', 'App\Http\Controllers\NewAdminController@editarUsuario')->name('edit');
Route::put('/actualizarUsuario/{usuario}', 'App\Http\Controllers\NewAdminController@actualizarUsuario');
Route::delete('/borrarUsuario/{usuario}', 'App\Http\Controllers\NewAdminController@eliminarUsuario');

Route::get('/infoUsuario', 'App\Http\Controllers\NewAdminController@frmUserView');

// Empleados
Route::post('/nuevoEmpleado', 'App\Http\Controllers\NewAdminController@registrarEmpleado');
Route::get('/employeeInfo', 'App\Http\Controllers\NewAdminController@mostrarEmpleados')->name('employees');
Route::get('/infoEmployee/{empleado}', 'App\Http\Controllers\NewAdminController@editarEmpleado')->name('edit_employee');
Route::put('/infoEmployee/{empleado}', 'App\Http\Controllers\NewAdminController@actualizarEmpleado');
Route::delete('/borrarEmpleado/{empleado}', 'App\Http\Controllers\NewAdminController@eliminarEmpleado');

// Estudiantes
Route::post('/nuevoEstudiante', 'App\Http\Controllers\NewAdminController@registrarEstudiante');
Route::delete('/borrarEstudiante/{estudiante}', 'App\Http\Controllers\NewAdminController@eliminarEstudiante');
Route::get('/studentInfo', 'App\Http\Controllers\NewAdminController@mostrarEstudiante')->name('students');
Route::get('/editarEstudiante/{estudiante}', 'App\Http\Controllers\NewAdminController@editarEstudiante');
Route::put('/editarEstudiante/{estudiante}', 'App\Http\Controllers\NewAdminController@actualizarEstudiante');

// Directores de carrera
Route::get('/directorInfo', 'App\Http\Controllers\NewAdminController@mostrarDirectores')->name('directores');
Route::get('/editarDirector/{director}', 'App\Http\Controllers\NewAdminController@editarDirector');
Route::put('/editarDirector/{director}', 'App\Http\Controllers\NewAdminController@actualizarDirector');
Route::delete('/borrarDirector/{director}', 'App\Http\Controllers\NewAdminController@eliminarDirector');
Route::post('/nuevoDirector', 'App\Http\Controllers\NewAdminController@registrarDirector');



//----------------------------------- Ruta para subir imagen 2023 ------------------------------
Route::post('/ckeditor/image_upload', 'App\Http\Controllers\DocumentoController@upload')->name('upload');

// Google login
Route::get('/auth/google', 'App\Http\Controllers\Auth\LoginController@redirectToGoogle');
Route::get('/auth/google/callback', 'App\Http\Controllers\Auth\LoginController@handleGoogleCallback');
