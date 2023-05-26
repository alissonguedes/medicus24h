<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ModuloRequest extends FormRequest
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
			'modulo'    => [
				'required',
				Rule::unique('mysql2.tb_acl_modulo', 'modulo')->ignore($this->id, 'id'),
			],
			'path'      => 'required',
			'namespace' => [
				'required',
				Rule::unique('mysql2.tb_acl_modulo', 'namespace')->ignore($this->id, 'id'),
			],
			'restrict'  => 'required',
		];

		return $rules;
	}
}
