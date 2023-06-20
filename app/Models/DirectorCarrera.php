<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;

class DirectorCarrera extends Model
{
    protected $table = 'director_carrera';

    protected $guarded = [];

    public function empleado()
    {
        return $this->belongsTo('App\Models\Empleado', 'empleado_id');
    }

    public static function boot() {
        parent::boot();

        self::created(function($model) {
            $configuracion = new ConfiguracionSistema;
            $configuracion->fecha_entrega = Carbon::now();
            $configuracion->fecha_prorroga = Carbon::now();
            $configuracion->numero_integrantes = 4;
            $configuracion->director_id = $model->id;

            $configuracion->save();
        });
    }
}
