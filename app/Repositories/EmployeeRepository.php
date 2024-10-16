<?php

namespace App\Repositories;

use Illuminate\Support\Str;
use App\Helpers\UploadHelper;
use App\Interfaces\CrudInterface;
use App\Models\Employee;
use Illuminate\Contracts\Pagination\Paginator;

class EmployeeRepository implements CrudInterface
{
    public function __construct()
    {
        // Inicializações, se necessário.
    }

    public function getAll(): object
    {
        // return Employee::orderBy('id', 'desc')->get();
        return Employee::orderBy('id', 'desc')->get()->map(function ($employee) {
            $employee->cpf = $employee->anonymized_cpf; // Anonimiza o CPF
            return $employee;
        });
    }

    public function getPaginatedData($perPage): Paginator
    {
        $perPage = intval($perPage) ?: 12;
        return Employee::orderBy('id', 'desc')->paginate($perPage)->through(function ($employee) {
            $employee->cpf = $employee->anonymized_cpf; // Anonimiza o CPF
            return $employee;
        });
    }

    public function searchEmployee($keyword, $perPage): Paginator
    {
        $perPage = intval($perPage) ?: 10;

        return Employee::where('full_name', 'like', '%' . $keyword . '%')
            ->orWhere('cpf', 'like', '%' . $keyword . '%')
            ->orWhere('birth_date', 'like', '%' . $keyword . '%')
            ->orderBy('id', 'desc')
            ->paginate($perPage)
            ->through(function ($employee) {
                $employee->cpf = $employee->anonymized_cpf; // Anonimiza o CPF
                return $employee;
            });
    }

    public function create(array $data): Employee
    {
        return Employee::create($data);
    }

    public function delete(int $id): bool
    {
        $employee = Employee::find($id);
        if (empty($employee)) {
            return false;
        }

        return $employee->delete();
    }

    public function getByID(int $id): ?Employee
    {
        $employee = Employee::find($id);

        if ($employee) {
            $employee->cpf = $employee->anonymized_cpf; // Anonimiza o CPF
        }

        return $employee;
    }


    public function update(int $id, array $data): ?Employee
    {
        $employee = Employee::find($id);
        if (is_null($employee)) {
            return null;
        }
        unset($data['cpf']);
        $employee->update($data);
        return $this->getByID($employee->id);
    }


}
