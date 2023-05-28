<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DirectorCarrera extends Model
{
    protected $table = 'director_carrera';

    public function empleado(){
        return $this -> belongsTo('App\Models\Empleado', 'empleado_id');
    }
}
