<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubcontenidoSeccionCapitulo extends Model
{
    protected $table = 'subcontenido_seccion_capitulo';

    // Relación One To Many
    public function contenidoSeccionCapitulo(){
        return $this -> hasOne('App\Models\ContenidoSeccionCapitulo');
    }
}
