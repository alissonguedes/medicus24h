<?php

namespace App\Http\Requests\Clinica;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ExameTipoRequest extends FormRequest
{
	/**
	 * Determine if the user is authorized to make this request.
	 *
	 * @return bool
	 */
	public function authorize()
	{
		return true;
	}

	/**
	 * Get the validation rules that apply to the request.
	 *
	 * @return array<string, mixed>
	 */
	public function rules()
	{

		$rules = [
			'titulo'        => [
				'required',
				Rule::unique('tb_exame_categoria', 'titulo')->ignore($this->id, 'id'),
			],
			'descricao'     => 'required',
			'classificacao' => 'required',
		];

		return $rules;
	}
}
