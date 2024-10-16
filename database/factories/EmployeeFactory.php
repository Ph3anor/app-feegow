<?php

namespace Database\Factories;

use App\Models\Employee;
use Illuminate\Database\Eloquent\Factories\Factory;
use Carbon\Carbon;

class EmployeeFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Employee::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'birth_date' => $this->faker->date('Y-m-d', 'now - 18 years'), // Data de nascimento aleatória, mínimo 18 anos
            'cpf' => $this->faker->unique()->numerify('###########'), // CPF único
            'full_name' => $this->faker->name(), // Gera um nome completo aleatório
            'has_comorbidity' => $this->faker->boolean(30), // 30% de chance de ter comorbidade
            'first_dose_date' => $this->faker->dateTimeBetween('-1 year', 'now'), // Data da primeira dose
            'second_dose_date' => $this->faker->dateTimeBetween('-1 year', 'now'), // Data da segunda dose
            'third_dose_date' => $this->faker->optional()->dateTimeBetween('-1 year', 'now'), // Data da terceira dose opcional
            'vaccine_id' => $this->faker->numberBetween(1, 3), // ID da vacina aleatório entre 1 e 3
        ];
    }
}
