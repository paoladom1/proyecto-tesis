<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SeccionCapitulo extends Model
{
    protected $table = 'seccion_capitulo';

    public function contenidoSeccionCapitulo(){
        return $this -> hasMany('App\Models\ContenidoSeccionCapitulo')->orderBy('orden_contenido', 'asc');
    }
}
