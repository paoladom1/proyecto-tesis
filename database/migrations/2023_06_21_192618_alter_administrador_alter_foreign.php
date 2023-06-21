<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterAdministradorAlterForeign extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("ALTER TABLE administrador ADD CONSTRAINT FK_administrador FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE;");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('administrador', function (Blueprint $table) {
            //
        });
    }
}
