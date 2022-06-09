<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GrupoTrabajo extends Model
{
    protected $table = 'grupo_trabajo';

    public function lector_interno(){
        return $this -> belongsTo('App\Models\Empleado', 'lector_interno_id');
    }

    public function asesor_interno(){
        return $this -> belongsTo('App\Models\Empleado', 'asesor_interno_id');
    }

    public function lector_externo(){
        return $this -> belongsTo('App\Models\Externo', 'lector_externo_id');
    }

    public function asesor_externo(){
        return $this -> belongsTo('App\Models\Externo', 'asesor_externo_id');
    }

    public function estudiante()
    {
        return $this -> hasMany('App\Models\Estudiante');        
    }
}
