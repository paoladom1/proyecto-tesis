<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;

class Usuario extends Authenticatable
{
    protected $table = 'usuario';

    public function director2(){
        return $this -> hasOne('App\Models\DirectorCarrera');
    }

    public function scopeDirector($query)
    {
        return $query->where('tipo_usuario_id', 2);
    }

    public function scopeEstudiante($query)
    {
        return $query->where('tipo_usuario_id', 1);
    }

    protected $hidden = [
        'password'
    ];
}
