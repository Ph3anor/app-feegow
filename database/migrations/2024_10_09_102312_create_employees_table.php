<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // if (!Schema::hasTable('employees')) {
            Schema::create('employees', function (Blueprint $table) {
                $table->id();
                $table->string('cpf')->unique(); // CPF stored in full
                $table->string('full_name');
                $table->date('birth_date');
                $table->boolean('has_comorbidity')->default(false);
                $table->date('first_dose_date')->nullable();
                $table->date('second_dose_date')->nullable();
                $table->date('third_dose_date')->nullable();
                $table->foreignId('vaccine_id')->constrained('vaccines'); // Relates to vaccines
                $table->timestamps();
            });
        // }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employees');
    }
};
