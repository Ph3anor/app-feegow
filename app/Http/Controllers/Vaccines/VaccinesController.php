<?php

namespace App\Http\Controllers\Vaccines;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\VaccineRequest;
use App\Repositories\VaccineRepository;
use App\Traits\ResponseTrait;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;

class VaccinesController extends Controller
{
    use ResponseTrait;

    public $vaccineRepository;

    public function __construct(VaccineRepository $vaccineRepository)
    {
        $this->vaccineRepository = $vaccineRepository;
    }

    public function index(): JsonResponse
    {
        try {
            // Obtém todas as vacinas
            $data = $this->vaccineRepository->getAll();

            // Retorna erro se não houver vacinas
            if ($data->isEmpty()) {
                return $this->responseError(null, 'Nenhuma vacina encontrada.', Response::HTTP_NOT_FOUND);
            }

            return $this->responseSuccess($data, 'Lista de vacinas obtida com sucesso.');
        } catch (\Exception $e) {
            // Loga o erro
            \Log::error("Erro ao buscar vacinas: {$e->getMessage()}");

            return $this->responseError(null, 'Erro ao buscar vacinas. Tente novamente.', Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function indexAll(Request $request): JsonResponse
    {
        try {
            // Padrão de paginação
            $perPage = $request->input('perPage', 15);

            // Valida paginação
            if (!is_numeric($perPage) || $perPage <= 0) {
                return $this->responseError(null, 'Valor de paginação inválido.', Response::HTTP_BAD_REQUEST);
            }

            // Busca vacinas paginadas
            $data = $this->vaccineRepository->getPaginatedData((int)$perPage);

            // Retorna erro se não houver vacinas
            if ($data->isEmpty()) {
                return $this->responseError(null, 'Nenhuma vacina encontrada.', Response::HTTP_NOT_FOUND);
            }

            return $this->responseSuccess($data, 'Lista de vacinas encontrada com sucesso.');
        } catch (\Exception $e) {
            // Loga o erro
            \Log::error("Erro ao buscar vacinas: {$e->getMessage()}");

            return $this->responseError(null, 'Erro ao buscar vacinas. Tente novamente.', Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function search(Request $request): JsonResponse
    {
        try {
            // Valida termo de busca
            $searchTerm = trim($request->input('search'));
            if (empty($searchTerm)) {
                return $this->responseError(null, 'Termo de busca vazio.', Response::HTTP_BAD_REQUEST);
            }

            // Padrão de paginação
            $perPage = $request->input('perPage', 15);

            // Valida paginação
            if (!is_numeric($perPage) || $perPage <= 0) {
                return $this->responseError(null, 'Valor de paginação inválido.', Response::HTTP_BAD_REQUEST);
            }

            // Busca vacinas
            $data = $this->vaccineRepository->searchVaccine($searchTerm, (int)$perPage);

            // Retorna erro se não houver resultados
            if ($data->isEmpty()) {
                return $this->responseError(null, 'Nenhuma vacina encontrada com esse termo.', Response::HTTP_NOT_FOUND);
            }

            return $this->responseSuccess($data, 'Lista de vacinas encontrada com sucesso.');
        } catch (\Exception $e) {
            // Loga o erro
            \Log::error("Erro ao buscar vacinas: {$e->getMessage()}");

            return $this->responseError(null, 'Erro ao buscar vacinas. Tente novamente.', Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function store(VaccineRequest $request): JsonResponse
    {
        try {
            $expiryDate = \DateTime::createFromFormat('d/m/Y', $request->input('expiry_date'));
            // Prepara os dados da vacina
            $data = $request->all();
            $data['expiry_date'] = $expiryDate->format('Y-m-d');

            // Cria a vacina
            $vaccine = $this->vaccineRepository->create($data);
            return $this->responseSuccess($vaccine, 'Vacina criada com sucesso!');
        } catch (\Exception $e) {
            dd($e);
            return $this->responseError(null, $e->getMessage(), Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function show($id): JsonResponse
    {
        try {
            // Verifica se o ID é válido
            if (!is_numeric($id)) {
                return $this->responseError(null, 'ID inválido.', Response::HTTP_BAD_REQUEST);
            }

            // Busca a vacina
            $vaccine = $this->vaccineRepository->getByID($id);

            // Retorna erro se não encontrado
            if (!$vaccine) {
                return $this->responseError(null, 'Vacina não encontrada.', Response::HTTP_NOT_FOUND);
            }

            return $this->responseSuccess($vaccine, 'Detalhes da vacina obtidos com sucesso.');
        } catch (\Exception $e) {
            // Loga o erro
            \Log::error("Erro ao buscar vacina ID {$id}: {$e->getMessage()}");

            return $this->responseError(null, 'Erro ao buscar detalhes da vacina.', Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function update(VaccineRequest $request, $id): JsonResponse
    {
        try {
            // Converte a data para o formato YYYY-MM-DD
            $expiryDate = \DateTime::createFromFormat('d/m/Y', $request->input('expiry_date'));

            // Verifica a conversão da data
            if ($expiryDate === false) {
                return $this->responseError(null, 'Formato de data inválido. Use DD/MM/YYYY.', Response::HTTP_BAD_REQUEST);
            }

            // Verifica erros de data, apenas se a conversão foi bem-sucedida
            $dateErrors = \DateTime::getLastErrors();
            if ($dateErrors && ($dateErrors['error_count'] > 0 || $dateErrors['warning_count'] > 0)) {
                return $this->responseError(null, 'Formato de data inválido. Use DD/MM/YYYY.', Response::HTTP_BAD_REQUEST);
            }

            // Prepara os dados para atualização
            $data = $request->all();
            $data['expiry_date'] = $expiryDate->format('Y-m-d');

            // Atualiza a vacina
            $vaccine = $this->vaccineRepository->update($id, $data);

            return $this->responseSuccess($vaccine, 'Vacina atualizada com sucesso!');
        } catch (\Exception $e) {
            // Loga o erro
            \Log::error("Erro ao atualizar vacina: {$e->getMessage()}");
            // dd($e);
            return $this->responseError(null, 'Erro ao atualizar vacina. Tente novamente.', Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }



    public function destroy($id): JsonResponse
    {
        try {
            // Busca a vacina
            $vaccine = $this->vaccineRepository->getByID($id);

            // Retorna erro se não encontrada
            if (!$vaccine) {
                return $this->responseError(null, 'Vacina não encontrada.', Response::HTTP_NOT_FOUND);
            }

            // Tenta deletar a vacina
            if (!$this->vaccineRepository->delete($id)) {
                return $this->responseError(null, 'Falha ao deletar a vacina.', Response::HTTP_INTERNAL_SERVER_ERROR);
            }

            return $this->responseSuccess($vaccine, 'Vacina deletada com sucesso.');
        } catch (\Exception $e) {
            // Loga o erro
            \Log::error("Erro ao deletar vacina ID {$id}: {$e->getMessage()}");

            return $this->responseError(null, 'Erro ao deletar a vacina.', Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
