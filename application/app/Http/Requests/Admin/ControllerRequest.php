<?php

namespace App\Http\Requests\Admin;

use App\Rules\ControllerRule;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ControllerRequest extends FormRequest
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
			'controller' => [
				'required',
				new ControllerRule(),
			],
			'filename'   => 'required',
			'modulo'     => [
				'required',
			],
			'restrict'   => 'required',
		];

		if ($this->use_as) {
			$rules['use_as'] = [
				Rule::unique('mysql2.tb_acl_modulo_controller', 'use_as')->ignore($this->id, 'id'),
			];
		}

		return $rules;
	}
}
