<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Estudiante;
use App\Models\DirectorCarrera;
use App\Models\Usuario;
use Illuminate\Support\Str;
use App\Models\ConfiguracionSistema;


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
        $usuario = Usuario::findOrFail($id_usuario);
        $config_system= ConfiguracionSistema::all();
        if ($tipo == 1) { // Estudiante
            $datos_usuario = Estudiante::where("usuario_id", "=", $id_usuario)->first();
        } else if ($tipo == 2) { // Director de carrera
            $datos_usuario = DirectorCarrera::join('empleado','empleado_id', '=', 'empleado.id')->where("director_carrera.usuario_id", "=", $id_usuario)->first();
        }
        
        return view('usuarios.perfilUsuario', array(
            "usuario" => $datos_usuario, 
            "foto_usuario" => $usuario->foto
        ));
    }

    public function cambiarDatos(Request $request)
    {
        $usuario = Usuario::findOrFail(auth()->guard('admin')->user()->id);
        $nuevaPass = $request->input('password');
        $file = $request->input('file');
        $mensaje[0] = "";
        $mensaje[1] = "";
        if ($nuevaPass != null) {
            $usuario->password = bcrypt($nuevaPass);    
            $mensaje[0] = "Se ha cambiado la contraseña con exito!";
        } 
        if($request->hasFile('pic')){
            $imagen = $request->file('pic');
            $nombre_unico = auth()->guard('admin')->user()->id.auth()->guard('admin')->user()->email;
            $nombreImagen = $nombre_unico.'.'.$imagen->guessExtension();
            $ruta = public_path("img/usuarios/");
            copy($imagen->getRealPath(), $ruta.$nombreImagen);
            $usuario->foto = 'img/usuarios/'.$nombreImagen;
            $mensaje[1] = "Se ha cambiado la imagen de perfil con exito!";
        }
        if ($mensaje[0] == "" && $mensaje[1] == "") {
            $mensaje[0] = "No se realizó ningun cambio";
        }
        $usuario->update();
        return redirect('perfil')->with(array(
            "mensaje" => $mensaje
        ));
    }

    public function descartandoCambios(Type $var = null)
    {
        $mensaje[0] = "Se han descartado todos los cambios!";
        return redirect('perfil')->with(array(
            "mensaje" => $mensaje
        ));
    }
}
