<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Carrera extends Model
{
    protected $table = 'carrera';

    public function facultad(){
        return $this -> belongsTo('App\Models\Facultad', 'facultad_id');
    }
    public function carrera()
    {
        return $this->hasMany(Carrera::class);
    }
}
