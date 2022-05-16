<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ContenidoSeccionCapitulo extends Model
{
    protected $table = 'contenido_seccion_capitulo';

    // Relación One To Many
    public function capitulo(){
        return $this -> belongsTo('App\Models\SeccionCapitulo', 'seccion_capitulo_id');
    }

    public function contenidoCapitulo2(){
        return $this -> hasMany('App\Models\SubcontenidoSeccionCapitulo')->orderBy('orden_subcontenido', 'asc');
    }
}
