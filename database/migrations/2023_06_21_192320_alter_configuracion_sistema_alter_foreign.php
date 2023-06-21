<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterConfiguracionSistemaAlterForeign extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("ALTER TABLE configuracion_sistema ADD CONSTRAINT FK_configuracion_sistema FOREIGN KEY (director_id) REFERENCES director_carrera(id) ON DELETE CASCADE;");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('configuracion_sistema', function (Blueprint $table) {
            //
        });
    }
}
