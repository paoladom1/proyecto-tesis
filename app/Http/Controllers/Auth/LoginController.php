<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use App\Models\Usuario;
use App\Models\Estudiante;
use App\Models\DirectorCarrera;
use Laravel\Socialite\Facades\Socialite;
use SebastianBergmann\CliParser\Exception;

date_default_timezone_set('America/El_Salvador');

class LoginController extends Controller
{

    use AuthenticatesUsers;

    protected $guard = "admin";

    public function __construct()
    {
        $this->middleware('guest:admin', ['only' => 'showLogin']);
    }

    public function showLogin()
    {
        return view('home');
    }

    public function redirectToGoogle()
    {
        return Socialite::driver('google')->redirect();
    }


    public function handleGoogleCallback()
    {
        try {
            $user = Socialite::driver('google')->stateless()->user();
            $finduser = Usuario::where('email', $user->email)->first();

            if ($finduser) {
                if ($finduser->tipo_usuario_id == 1) {
                    Auth::guard('admin')->login($finduser);

                    return redirect()->intended('menu');
                }

                if ($finduser->tipo_usuario_id == 2) {
                    Auth::guard('admin')->login($finduser);

                    return redirect()->intended('menudirector');
                }

                if ($finduser->tipo_usuario_id == 3) {
                    Auth::guard('admin')->login($finduser);

                    return redirect()->intended('menuadmin');
                }


            } else {
                return redirect('/')
                    ->withErrors(
                        array(
                            'email' => "¡No tiene activada su cuenta!"
                        )
                    )
                    ->withInput(request(['email']));
            }

        } catch (Exception $e) {
            dd($e->getMessage());
        }
    }

    public function login()
    {

        if (request('email') == null) {
            return back()
                ->withErrors(
                    array(
                        'email' => "¡El campo usuario es requerido!"
                    )
                );
        } else if (request('password') == null) {
            return back()
                ->withErrors(
                    array(
                        'email' => "¡El campo contraseña es requerido!"
                    )
                );
        }


        $credentials = $this->validate(request(), [
            'email' => 'string',
            'password' => 'string'
        ]);

        if (Auth::guard('admin')->attempt($credentials)) {
            $this->handleUserLoggedin();
        }

        return back()
            ->withErrors(
                array(
                    'email' => "¡Contraseña o usuario incorrectos!"
                )
            )
            ->withInput(request(['email']));
    }

    public function logout()
    {
        Auth::guard('admin')->logout();

        return redirect('/');
    }

    private function handleUserLoggedin()
    {
        $user = auth()->guard('admin')->user();
        $id = $user->id;
        info($user);
        $fecha_actual = date("Y-m-d");

        if ($user->tipo_usuario_id == 1) {
            // Estudiante
            $estudiante = Estudiante::where("usuario_id", "=", $id)->first();
            $status = Usuario::where("id", "=", $id)->first();
            if ($estudiante != null) {
                if ($estudiante->grupo_trabajo_id == null) {
                    auth()->guard('admin')->logout();
                    return back()
                        ->withErrors(
                            array(
                                'email' => "¡No pertenece a ningun grupo actualmente!"
                            )
                        );
                }
                if ($fecha_actual > $status->fecha_limite) {
                    auth()->guard('admin')->logout();
                    return back()
                        ->withErrors(
                            array(
                                'email' => "Cuenta desactivada"
                            )
                        );
                }
                return redirect('/menu');

            } else {
                auth()->guard('admin')->logout();
                return back()
                    ->withErrors(
                        array(
                            'email' => "¡No tiene activada su cuenta!"
                        )
                    );
            }
        } elseif ($user->tipo_usuario_id == 2) {
            $director = DirectorCarrera::where("usuario_id", "=", $id)->first();
            if ($director != null) {
                if ($director->empleado_id == null) {
                    auth()->guard('admin')->logout();
                    return back()
                        ->withErrors(
                            array(
                                'email' => "¡No tiene activada su cuenta!"
                            )
                        );
                } else {
                    return redirect('/menudirector');
                }
            } else {
                auth()->guard('admin')->logout();
                return back()
                    ->withErrors(
                        array(
                            'email' => "¡No tiene activada su cuenta!"
                        )
                    );
            }
        } else {
            return redirect('/menuadmin');
        }
    }
}
