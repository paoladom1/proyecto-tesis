<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Session;
use App\Models\Usuario;
use App\Models\Estudiante;
use App\Models\DirectorCarrera;


class LoginController extends Controller
{

    use AuthenticatesUsers;
    
    protected $guard = "admin";

    public function __construct()
    {
        $this->middleware('guest:admin', ['only' => 'showLogin']);
    }

    public function showLogin(){
        return view('home');
    }

    public function login(){
        if (request('email') == null) {
            return back()
            ->withErrors(array(
                'email' => "¡El campo usuario es requerido!"
            ));
        } else if (request('password') == null) {
            return back()
            ->withErrors(array(
                'email' => "¡El campo contraseña es requerido!"
            ));
        }
        $credentials = $this->validate(request(), [
            'email' => 'string',
            'password' => 'string'
        ]);
        
        if (Auth::guard('admin')->attempt($credentials)) {
            $id = auth()->guard('admin')->user()->id;
            if(auth()->guard('admin')->user()->tipo_usuario_id == 1){
                // Estudiante
                $estudiante = Estudiante::where("usuario_id", "=", $id)->first();
                if ($estudiante != null) {
                    if ($estudiante->grupo_trabajo_id == null) {
                        auth()->guard('admin')->logout();
                        return back()
                        ->withErrors(array(
                            'email' => "¡No pertenece a ningun grupo actualmente!"
                        ));
                    } else{
                        return redirect('/menu');
                    }
                } else{
                    auth()->guard('admin')->logout();
                    return back()
                    ->withErrors(array(
                        'email' => "¡No tiene activada su cuenta!"
                    ));
                }
            } else{
                $director = DirectorCarrera::where("usuario_id", "=", $id)->first();
                if ($director != null) {
                    if ($director->empleado_id == null) {
                        auth()->guard('admin')->logout();
                        return back()
                        ->withErrors(array(
                            'email' => "¡No tiene activada su cuenta!"
                        ));
                    } else{
                        return redirect('/menudirector');
                    }
                } else{
                    auth()->guard('admin')->logout();
                    return back()
                    ->withErrors(array(
                        'email' => "¡No tiene activada su cuenta!"
                    ));
                }
            }
        }

        return back()
        ->withErrors(array(
            'email' => "¡Contraseña o usuario incorrectos!"
        ))
        ->withInput(request(['email']));
    }

    public function logout()
    { 
        Auth::guard('admin')->logout();

        return redirect('/');
    }
}
