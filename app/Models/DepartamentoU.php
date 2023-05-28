<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DepartamentoU extends Model
{
    protected $table = 'departamento_unidad';

    public function departamento_u()
    {
        return $this->hasMany(DepartamentoU::class);
    }
}
