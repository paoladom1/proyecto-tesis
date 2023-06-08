<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Estudiante extends Model
{
    protected $table = 'estudiante';

    protected $guarded = [];

    public function estudiante()
    {
        return $this->hasMany(Estudiante::class);
    }
}
