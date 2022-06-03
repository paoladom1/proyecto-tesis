<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Estudiante;
use App\Models\DirectorCarrera;
use App\Models\Usuario;

class GeneralController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function mostrarPerfil()
    {
        $tipo = auth()->guard('admin')->user()->tipo_usuario_id;
        $id_usuario = auth()->guard('admin')->user()->id;
        $usuario = Usuario::findOrFail(auth()->guard('admin')->user()->id);
        if ($tipo == 1) { // Estudiante
            $datos_usuario = Estudiante::where("usuario_id", "=", $id_usuario)->first();
        } else if ($tipo == 2) { // Director de carrera
            $datos_usuario = DirectorCarrera::where("usuario_id", "=", $id_usuario)->first();
        }
        return view('usuarios.usuariovergon', array(
            "usuario" => $datos_usuario, 
            "foto_usuario" => $usuario->foto
        ));
    }

    public function cambiarDatos(Request $request)
    {
        $usuario = Usuario::findOrFail(auth()->guard('admin')->user()->id);
        $nuevaPass = $request->input('password');
        $file = $request->input('file');
        if ($nuevaPass != "") {
            $usuario->password = bcrypt($nuevaPass);    
        } 
        if ($file != "") {
            $usuario->foto = $file;
        }
        $usuario->update();
        $mensaje = array(
            'code'=> 200,
            'mensaje' => "Se guardo exitosamente!"
        );
        return $mensaje;
    }
}
