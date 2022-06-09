<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bitacora extends Model
{
    protected $table = 'bitacora';

    public function estudiante(){
        return $this -> belongsTo('App\Models\Estudiante', 'estudiante_id');
    }

    public function bitacora_seccion(){
        return $this -> belongsTo('App\Models\BitacoraSeccion', 'bitacora_seccion_id');
    }

    public function bitacora_modificacion(){
        return $this -> belongsTo('App\Models\BitacoraModificacion', 'bitacora_modificacion_id');
    }
}
