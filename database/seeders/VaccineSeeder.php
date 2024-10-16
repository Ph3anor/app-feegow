<?php

namespace Database\Seeders;

use App\Models\Vaccine;
use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class VaccineSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('vaccines')->delete();
        $data = [
            [
                'name' => 'Pfizer-BioNTech',
                'batch' => 'B1234',
                'expiry_date' => Carbon::now()->addMonths(12),

            ],
            [
                'name' => 'Moderna',
                'batch' => 'M5678',
                'expiry_date' => Carbon::now()->addMonths(12),
            ],
            [
                'name' => 'AstraZeneca',
                'batch' => 'A9876',
                'expiry_date' => Carbon::now()->addMonths(12)

            ],
        ];

        // Inserindo as vacinas no banco de dados
        Vaccine::insert($data);
        // Vaccine::factory(3)->create();
    }
}
