<?php

namespace Tests\Unit;

use App\Models\Employee;
use App\Repositories\EmployeeRepository;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class VaccineTest extends TestCase
{
    use RefreshDatabase;

    protected EmployeeRepository $employeeRepository;

    protected function setUp(): void
    {
        parent::setUp();
        $this->employeeRepository = new EmployeeRepository();
    }

    public function test_can_access_public_employee_api()
    {
        $response = $this->get('/api/employees/view/all');
        $response->assertStatus(200);
    }

    public function test_can_not_access_private_employee_api()
    {
        $response = $this->get('/api/employees');
        $response->assertStatus(401);
    }

    public function test_can_create_employee()
    {
        $totalEmployees = Employee::count();

        $employeeData = [
            'cpf'              => '05602362934',
            'full_name'        => 'John Doe1',
            'birth_date'       => '01/01/1990',
            'has_comorbidity'  => 0,
            'first_dose_date'  => '09/07/2024',
            'second_dose_date' => '09/09/2024',
            'third_dose_date'  => null,
            'vaccine_id'       => 1,
        ];

        $employee = $this->employeeRepository->create($employeeData);

        $this->assertDatabaseCount('employees', $totalEmployees + 1);
        $this->assertDatabaseHas('employees', $employeeData);
    }

    public function test_create_employee_with_invalid_data()
    {
        $this->expectException(\Exception::class);

        $invalidData = [
            'cpf'              => 'invalid_cpf',
            'full_name'        => '',
            'birth_date'       => 'not_a_date',
            'has_comorbidity'  => 0,
            'first_dose_date'  => '09/07/2024',
            'second_dose_date' => '09/09/2024',
            'third_dose_date'  => null,
            'vaccine_id'       => 1,
        ];

        $this->employeeRepository->create($invalidData);
    }

    public function test_can_retrieve_employee_by_id()
    {
        $employee = $this->employeeRepository->create([
            'cpf'              => '05602362934',
            'full_name'        => 'John Doe1',
            'birth_date'       => '01/01/1990',
            'has_comorbidity'  => 0,
            'first_dose_date'  => '09/07/2024',
            'second_dose_date' => '09/09/2024',
            'third_dose_date'  => null,
            'vaccine_id'       => 1,
        ]);

        $retrievedEmployee = $this->employeeRepository->find($employee->id);
        $this->assertEquals($employee->full_name, $retrievedEmployee->full_name);
        $this->assertEquals($employee->cpf, $retrievedEmployee->cpf);
    }
}
