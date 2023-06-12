<?php

namespace App\Http\Middleware;


use Closure;
use Illuminate\Http\Request;
use App\Models\Usuario;
use App\Models\Estudiante;
use Illuminate\Support\Facades\Auth;

//timezone El Salvador
date_default_timezone_set('America/El_Salvador');

class EstudianteMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {

        if (auth()->guard('admin')->check()) {
            if (auth()->guard('admin')->user()->tipo_usuario_id == 2)
                return redirect('/menudirector');
            if (auth()->guard('admin')->user()->tipo_usuario_id == 3)
                return redirect('/menuadmin');

            $user = auth()->guard('admin')->user();
            $id = $user->id;
            $status = Usuario::where("id", "=", $id)->first();
            $fecha_actual = date("Y-m-d");

            if ($fecha_actual > $status->fecha_limite) {
                Auth::guard('admin')->logout();
                return redirect('/');
            }
            return $next($request);
        } else {
            return redirect('/');
        }
    }
}
