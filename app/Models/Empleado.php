<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Empleado extends Model
{
    protected $table = 'empleado';
    
    public function departamento(){
        return $this -> belongsTo('App\Models\DepartamentoU', 'departamento_unidad_id');
    }
}
