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

    protected $hidden = [
        'password'
    ];
}
