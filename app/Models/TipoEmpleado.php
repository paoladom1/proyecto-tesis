<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TipoEmpleado extends Model
{
    protected $table = 'tipo_empleado';

    public function tipo_empleado()
    {
        return $this->hasMany(TipoEmpleado::class);
    }
}
