<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Externo extends Model
{
    protected $table = 'externo';

    public function departamento(){
        return $this -> belongsTo('App\Models\DepartamentoU', 'departamento_unidad_id');
    }
}
