<?php

namespace Tests\Unit;

use App\Models\Vaccine;
use App\Repositories\VaccineRepository;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class EmployeeTest extends TestCase
{
    use RefreshDatabase;

    protected VaccineRepository $vaccineRepository;

    protected function setUp(): void
    {
        parent::setUp();
        $this->vaccineRepository = new VaccineRepository();
    }

    public function test_can_create_vaccine()
    {
        $totalVaccines = Vaccine::count();

        $vaccineData = [
            'name'         => 'Teste',
            'batch'        => 'T11231223',
            'expiry_date'  => '2026-02-02',
        ];

        $vaccine = $this->vaccineRepository->create($vaccineData);

        $this->assertDatabaseCount('vaccines', $totalVaccines + 1);
        $this->assertDatabaseHas('vaccines', $vaccineData);
    }

    public function test_create_vaccine_with_invalid_data()
    {
        $this->expectException(\Exception::class);

        $invalidData = [
            'name'         => '',
            'batch'        => '',
            'expiry_date'  => 'not_a_date',
        ];

        $this->vaccineRepository->create($invalidData);
    }

    public function test_can_retrieve_vaccine_by_id()
    {
        $vaccine = $this->vaccineRepository->create([
            'name'         => 'Teste',
            'batch'        => 'T11231223',
            'expiry_date'  => '2026-02-02',
        ]);

        $retrievedVaccine = $this->vaccineRepository->find($vaccine->id);
        $this->assertEquals($vaccine->name, $retrievedVaccine->name);
        $this->assertEquals($vaccine->batch, $retrievedVaccine->batch);
    }
}
