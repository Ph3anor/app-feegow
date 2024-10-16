<?php

namespace App\Http\Requests;


class EmployeeRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize(): bool
    {
        return true; // O usuário é autorizado a fazer essa requisição
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules(): array
    {

        $employeeId = $this->route('employee'); // Supondo que o ID do funcionário seja passado na rota como 'employee'
        $isUpdate = $this->isMethod('put');

        return [
            // CPF é obrigatório apenas na criação
            'cpf'               => $isUpdate ? 'nullable' : 'required|regex:/^[0-9]{11}$/|unique:employees,cpf', // CPF deve ter 11 dígitos e ser único
            'full_name'         => 'required|string|max:255', // Nome completo é obrigatório
            'birth_date'        => 'required|date|before:today', // Data de nascimento obrigatória
            'has_comorbidity'   => 'required|boolean', // Comorbidade deve ser booleano
            'first_dose_date'   => 'required|date|before_or_equal:today', // Primeira dose obrigatória
            'second_dose_date'  => 'nullable|date|after_or_equal:first_dose_date', // Segunda dose opcional
            'third_dose_date'   => 'nullable|date|after_or_equal:second_dose_date', // Terceira dose opcional
            'vaccine_id'        => 'required|exists:vaccines,id', // ID da vacina deve existir
        ];
    }

    /**
     * Custom validation messages.
     *
     * @return array
     */
    public function messages(): array
    {
        return [
            'cpf.required'               => 'O CPF é obrigatório.',
            'cpf.regex'                  => 'O CPF deve conter exatamente 11 dígitos.',
            'cpf.unique'                 => 'Este CPF já está cadastrado.',
            'full_name.required'         => 'O nome completo é obrigatório.',
            'full_name.string'           => 'O nome completo deve ser uma string.',
            'full_name.max'              => 'O nome completo deve ter no máximo 255 caracteres.',
            'birth_date.required'        => 'A data de nascimento é obrigatória.',
            'birth_date.date'            => 'Forneça uma data de nascimento válida.',
            'birth_date.before'          => 'A data de nascimento deve ser anterior à data atual.',
            'has_comorbidity.required'   => 'Informe se o funcionário tem comorbidade.',
            'has_comorbidity.boolean'    => 'O valor de comorbidade deve ser verdadeiro ou falso.',
            'first_dose_date.required'   => 'A data da primeira dose é obrigatória.',
            'first_dose_date.date'       => 'Forneça uma data válida para a primeira dose.',
            'first_dose_date.before_or_equal' => 'A data da primeira dose deve ser anterior ou igual à data atual.',
            'second_dose_date.date'      => 'Forneça uma data válida para a segunda dose.',
            'second_dose_date.after_or_equal' => 'A data da segunda dose deve ser posterior ou igual à primeira dose.',
            'third_dose_date.date'       => 'Forneça uma data válida para a terceira dose.',
            'third_dose_date.after_or_equal' => 'A data da terceira dose deve ser posterior ou igual à segunda dose.',
            'vaccine_id.required'        => 'A vacina é obrigatória.',
            'vaccine_id.exists'          => 'A vacina selecionada não existe.',
        ];
    }
}
