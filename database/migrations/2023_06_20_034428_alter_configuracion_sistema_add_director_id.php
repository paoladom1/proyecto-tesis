<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterConfiguracionSistemaAddDirectorId extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('configuracion_sistema', function (Blueprint $table) {
            $table->integer('director_id')->default('4');
            $table->foreign('director_id')->references('id')->on('director_carrera');
        });
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
