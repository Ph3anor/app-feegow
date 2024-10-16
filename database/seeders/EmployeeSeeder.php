<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Employee;
use Carbon\Carbon;

class EmployeeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \DB::table('employees')->delete();
        $data = [
            [
                'birth_date' => '1990-01-01',
                'cpf' => '12345678900',
                'full_name' => 'John Doe',
                'has_comorbidity' => 0,
                'first_dose_date' => Carbon::create('2024-07-09'),
                'second_dose_date' => Carbon::create('2024-09-09'),
                'third_dose_date' => null, // Defina como null se ainda não aplicada
                'vaccine_id' => 1,
            ],
            [
                'birth_date' => '1985-06-15',
                'cpf' => '23456789011',
                'full_name' => 'Maria DOe',
                'has_comorbidity' => 1,
                'first_dose_date' => Carbon::create('2024-05-09'),
                'second_dose_date' => Carbon::create('2024-07-09'),
                'third_dose_date' => Carbon::create('2024-09-09'),
                'vaccine_id' => 2,
            ],
            [
                'birth_date' => '2000-11-20',
                'cpf' => '34567890122',
                'full_name' => 'Anderson Silva',
                'has_comorbidity' => 0,
                'first_dose_date' => Carbon::create('2024-04-09'),
                'second_dose_date' => Carbon::create('2024-06-09'),
                'third_dose_date' => null, // Defina como null se ainda não aplicada
                'vaccine_id' => 3,
            ],
        ];
        Employee::insert($data);

        // Testing Dummy Employees
        Employee::factory(100)->create();
    }
}
