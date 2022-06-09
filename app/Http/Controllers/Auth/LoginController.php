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
        $credentials = $this->validate(request(), [
            'email' => 'required|email|string',
            'password' => 'required|string'
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
        ->withErrors(['email' => "Estas credenciales no coinciden con nuestros registros"])
        ->withInput(request(['email']));
    }

    public function logout()
    {
        Auth::guard('admin')->logout();

        return redirect('/');
    }
}
