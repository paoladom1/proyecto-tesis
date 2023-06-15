<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Administrador extends Model
{
    protected $table = 'administrador';

    protected $guarded = [];

    public function administrador()
    {
        return $this->hasMany(Administrador::class);
    }

    public function usuario()
    {
        return $this->belongsTo('App\Models\Usuario', 'usuario_id');
    }
}
