<?php

namespace App\Http\Requests;

class VaccineRequest extends FormRequest
{
    /**
     * Regras de validação para o pedido.
     *
     * @return array
     */
    public function rules(): array
    {
        return [
            'name'        => [
                'required',
                'max:255',
                'unique:vaccines,name',
                'string', // Verifica se é uma string
                'min:3',  // Nome deve ter pelo menos 3 caracteres
            ],
            'batch'       => [
                'required',
                'max:100',
                'alpha_num',
                'regex:/^[A-Za-z0-9]+$/', // Verifica se contém apenas letras e números
            ],
            'expiry_date' => [
                'required',
                'date_format:d/m/Y', // Validação de formato de data
                'after:today', // Data deve ser futura
                'before:100 years from today' // Data deve ser no futuro próximo
            ],
        ];
    }

    /**
     * Verifica se o usuário está autorizado a fazer este pedido.
     *
     * @return bool
     */
    public function authorize(): bool
    {
        return true; // Todos os usuários estão autorizados
    }

    /**
     * Mensagens personalizadas de validação.
     *
     * @return array
     */
    public function messages(): array
    {
        return [
            'name.required'        => 'O campo "nome da vacina" é obrigatório.',
            'name.max'             => 'Máximo de :max caracteres para o nome da vacina.',
            'name.unique'          => 'Vacina com o nome ":input" já cadastrada.',
            'name.min'             => 'O nome da vacina deve ter pelo menos :min caracteres.',
            'name.string'          => 'O nome da vacina deve ser uma string.',
            'batch.required'       => 'O campo "lote" é obrigatório.',
            'batch.max'            => 'Máximo de :max caracteres para o lote.',
            'batch.alpha_num'      => 'O lote deve conter apenas letras e números.',
            'batch.regex'          => 'O lote deve ser alfanumérico e não pode conter caracteres especiais.',
            'expiry_date.required' => 'O campo "data de validade" é obrigatório.',
            'expiry_date.date_format' => 'Formato da data de validade deve ser DD/MM/YYYY.',
            'expiry_date.after'    => 'A data de validade deve ser uma data futura.',
            'expiry_date.before'   => 'A data de validade não pode ser mais de 100 anos a partir de hoje.',
        ];
    }
}
