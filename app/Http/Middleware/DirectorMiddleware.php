<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class DirectorMiddleware
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
        if (auth()->guard('admin')->check()){
            if(auth()->guard('admin')->user()->tipo_usuario_id == 1)
                return redirect('/menu');
            return $next($request);
        } else{
            return redirect('/');
        }
    }
}
