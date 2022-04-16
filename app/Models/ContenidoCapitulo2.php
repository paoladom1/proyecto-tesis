<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ContenidoCapitulo2 extends Model
{
    protected $table = 'contenido_capitulo2';

    // Relación One To Many
    public function contenidoCapitulo(){
        return $this -> hasOne('App\Models\ContenidoCapitulo');
    }
}
