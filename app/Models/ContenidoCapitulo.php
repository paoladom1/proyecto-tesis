<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ContenidoCapitulo extends Model
{
    protected $table = 'contenido_capitulo';

    // Relación One To Many
    public function capitulo(){
        return $this -> belongsTo('App\Models\Capitulos', 'capitulos_id');
    }

    public function contenidoCapitulo2(){
        return $this -> hasMany('App\Models\ContenidoCapitulo2')->orderBy('orden_contenido', 'asc');
    }
}
