<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use App\Models\Usuario;


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
                'email' => "El campo usuario es requerido!"
            ));
        } else if (request('password') == null) {
            return back()
            ->withErrors(array(
                'email' => "El campo contraseña es requerido!"
            ));
        }
        $credentials = $this->validate(request(), [
            'email' => 'string',
            'password' => 'string'
        ]);
        
        if (Auth::guard('admin')->attempt($credentials)) {
            if(auth()->guard('admin')->user()->tipo_usuario_id == 1){
                // Estudiante
                return redirect('/menu');
            } else{
                // Director de carrera
                return redirect('/menudirector');
            }
        }

        return back()
        ->withErrors(array(
            'email' => "Contraseña o usuario incorrectos!"
        ))
        ->withInput(request(['email']));
    }

    public function logout()
    {
        Auth::guard('admin')->logout();

        return redirect('/');
    }
}
