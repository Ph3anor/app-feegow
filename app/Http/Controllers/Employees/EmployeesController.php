<?php

namespace App\Http\Controllers\Employees;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\EmployeeRequest;

use App\Repositories\EmployeeRepository;
use App\Traits\ResponseTrait;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;
use Carbon\Carbon;

class EmployeesController extends Controller
{

    use ResponseTrait;

    public $employeeRepository;

    public function __construct(EmployeeRepository $employeeRepository)
    {
        $this->employeeRepository = $employeeRepository;
    }


    public function index(): JsonResponse
{
    try {
        $employees = $this->employeeRepository->getAll();

        if ($employees->isEmpty()) {
            return $this->responseSuccess([], 'Nenhum funcionário encontrado.');
        }

        return $this->responseSuccess($employees, 'Lista de funcionários obtida com sucesso!');
    } catch (\Throwable $e) {

        \Log::error('Erro ao buscar lista de funcionários: ' . $e->getMessage(), ['exception' => $e]);

        return $this->responseError(null, 'Erro interno no servidor. Por favor, tente novamente mais tarde.', Response::HTTP_INTERNAL_SERVER_ERROR);
    }
}



    public function indexAll(Request $request): JsonResponse
    {
        try {
            $data = $this->employeeRepository->getPaginatedData($request->perPage);
            return $this->responseSuccess($data, 'Lista de funcionários obtida com sucesso!');
        } catch (\Exception $e) {
            return $this->responseError(null, $e->getMessage(), Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }


    public function search(Request $request): JsonResponse
    {
        try {
            $searchKeyword = $request->input('search', ''); // Palavra-chave de busca, padrão é string vazia
            $perPage = $request->input('perPage', 10); // Valor padrão para paginação é 10

            $data = $this->employeeRepository->searchEmployee($searchKeyword, $perPage);

            return $this->responseSuccess($data, 'Lista de funcionários obtida com sucesso!');
        } catch (\Throwable $e) {
            \Log::error("Erro ao buscar funcionários: {$e->getMessage()}");

            return $this->responseError(null, 'Ocorreu um erro ao buscar os funcionários. Por favor, tente novamente.', Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }




public function store(EmployeeRequest $request): JsonResponse
{
    try {
        // Converte as datas usando Carbon
        $data = $request->all();
        $data['birth_date'] = Carbon::createFromFormat('d/m/Y', $data['birth_date'])->format('Y-m-d');
        $data['first_dose_date'] = $request->input('first_dose_date')
            ? Carbon::createFromFormat('d/m/Y', $data['first_dose_date'])->format('Y-m-d')
            : null;
        $data['second_dose_date'] = $request->input('second_dose_date')
            ? Carbon::createFromFormat('d/m/Y', $data['second_dose_date'])->format('Y-m-d')
            : null;
        $data['third_dose_date'] = $request->input('third_dose_date')
            ? Carbon::createFromFormat('d/m/Y', $data['third_dose_date'])->format('Y-m-d')
            : null;

        $Employee = $this->employeeRepository->create($data);
        return $this->responseSuccess($Employee, 'Novo Funcionário cadastrado com sucesso!');
    } catch (\Exception $exception) {
        return $this->responseError(null, $exception->getMessage(), Response::HTTP_INTERNAL_SERVER_ERROR);
    }
}



    public function show($id): JsonResponse
    {
        try {
            $data = $this->employeeRepository->getByID($id);
            if (is_null($data)) {
                return $this->responseError(null, 'Colaborador Não Encontrado', Response::HTTP_NOT_FOUND);
            }

            return $this->responseSuccess($data, 'Detalhes do Colaborador Recuperados com Sucesso !');
        } catch (\Exception $e) {
            return $this->responseError(null, $e->getMessage(), Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }


    public function update(EmployeeRequest $request, $id): JsonResponse
    {
        try {
            // Converte a data de nascimento para o formato YYYY-MM-DD
            $birthDate = \DateTime::createFromFormat('d/m/Y', $request->input('birth_date'));
            if ($birthDate === false) {
                return $this->responseError(null, 'Formato de data de nascimento inválido. Use DD/MM/YYYY.', Response::HTTP_BAD_REQUEST);
            }

            // Verifica erros de data, apenas se a conversão foi bem-sucedida
            $dateErrors = \DateTime::getLastErrors();
            if ($dateErrors && ($dateErrors['error_count'] > 0 || $dateErrors['warning_count'] > 0)) {
                return $this->responseError(null, 'Formato de data de nascimento inválido. Use DD/MM/YYYY.', Response::HTTP_BAD_REQUEST);
            }

            // Converte as datas de dose, se estiverem presentes
            $firstDoseDate = \DateTime::createFromFormat('d/m/Y', $request->input('first_dose_date'));
            if ($firstDoseDate) {
                $firstDoseDateErrors = \DateTime::getLastErrors();
                if ($firstDoseDateErrors && ($firstDoseDateErrors['error_count'] > 0 || $firstDoseDateErrors['warning_count'] > 0)) {
                    return $this->responseError(null, 'Formato de data da primeira dose inválido. Use DD/MM/YYYY.', Response::HTTP_BAD_REQUEST);
                }
            }

            $secondDoseDate = $request->input('second_dose_date')
                ? \DateTime::createFromFormat('d/m/Y', $request->input('second_dose_date'))
                : null;

            if ($secondDoseDate) {
                $secondDoseDateErrors = \DateTime::getLastErrors();
                if ($secondDoseDateErrors && ($secondDoseDateErrors['error_count'] > 0 || $secondDoseDateErrors['warning_count'] > 0)) {
                    return $this->responseError(null, 'Formato de data da segunda dose inválido. Use DD/MM/YYYY.', Response::HTTP_BAD_REQUEST);
                }
            }

            $thirdDoseDate = $request->input('third_dose_date')
                ? \DateTime::createFromFormat('d/m/Y', $request->input('third_dose_date'))
                : null;

            if ($thirdDoseDate) {
                $thirdDoseDateErrors = \DateTime::getLastErrors();
                if ($thirdDoseDateErrors && ($thirdDoseDateErrors['error_count'] > 0 || $thirdDoseDateErrors['warning_count'] > 0)) {
                    return $this->responseError(null, 'Formato de data da terceira dose inválido. Use DD/MM/YYYY.', Response::HTTP_BAD_REQUEST);
                }
            }

            // Prepara os dados para atualização
            $data = $request->all();
            $data['birth_date'] = $birthDate->format('Y-m-d');
            $data['first_dose_date'] = $firstDoseDate ? $firstDoseDate->format('Y-m-d') : null;
            $data['second_dose_date'] = $secondDoseDate ? $secondDoseDate->format('Y-m-d') : null;
            $data['third_dose_date'] = $thirdDoseDate ? $thirdDoseDate->format('Y-m-d') : null;

            // Atualiza o funcionário
            $employee = $this->employeeRepository->update($id, $data);

            if (is_null($employee)) {
                return $this->responseError(null, 'Funcionário não encontrado.', Response::HTTP_NOT_FOUND);
            }

            return $this->responseSuccess($employee, 'Funcionário atualizado com sucesso!');
        } catch (\Exception $e) {
            \Log::error("Erro ao atualizar funcionário: {$e->getMessage()}");
            return $this->responseError(null, "Erro ao atualizar funcionário: {$e->getMessage()}", Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }



    public function destroy($id): JsonResponse
    {
        try {
            $employee = $this->employeeRepository->getByID($id);

            if (is_null($employee)) {
                return $this->responseError(null, 'Funcionário não encontrado.', Response::HTTP_NOT_FOUND);
            }

            if (!$this->employeeRepository->delete($id)) {
                return $this->responseError(null, 'Ocorreu um erro ao deletar funcionário.', Response::HTTP_INTERNAL_SERVER_ERROR);
            }

            return $this->responseSuccess($employee, 'Funcionário deletado com sucesso!');
        } catch (\Exception $e) {
            return $this->responseError(null, 'Ocorreu um erro ao deletar funcionário: ' . $e->getMessage(), Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function listReports()
    {
        $directory = storage_path('reports');
        $files = array_diff(scandir($directory), ['..', '.']); // Exclui '.' e '..'
        $reports = [];

        foreach ($files as $file) {
            $filePath = $directory . '/' . $file;
            $reports[] = [
                'file_name' => $file,
                'download_link' => url('storage/reports/' . $file), // Gera o link de download
                'created_at' => date("Y-m-d H:i:s", filemtime($filePath)), // Data e hora da última modificação
            ];
        }

        return response()->json($reports);
    }

}
