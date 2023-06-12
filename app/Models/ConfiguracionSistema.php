<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ConfiguracionSistema extends Model
{
    protected $table = 'configuracion_sistema';

    protected $guarded = [];

    public function config_sistema()
    {
        return $this->hasMany(ConfiguracionSistema::class);
    }
}
