<?php

namespace App\Http\Requests\Core;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class TicketRequest extends FormRequest
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
			'department' => 'required',
			'subject'    => Rule::requiredIf(isset($this->created)),
			'body'       => Rule::requiredIf(isset($this->created)),
		];

		return $rules;

	}

}
