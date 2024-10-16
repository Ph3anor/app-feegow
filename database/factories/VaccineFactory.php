<?php

namespace Database\Factories;
use App\Models\Vaccine;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Vaccine>
 */
class VaccineFactory extends Factory
{

    protected $model = Vaccine::class;

    public function definition(): array
    {
        return [
            'name' => $this->faker->randomElement(['Pfizer-BioNTech', 'Moderna', 'AstraZeneca']),
            'batch' => $this->faker->unique()->word() . '-' . $this->faker->numberBetween(1000, 9999),
            'expiry_date' => $this->faker->dateTimeBetween('+1 year', '+2 years')->format('Y-m-d'),
        ];
    }
}
