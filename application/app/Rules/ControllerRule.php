<?php

namespace App\Rules;

use App\Models\ControllerModel;
use Closure;
use Illuminate\Contracts\Validation\ValidationRule;

class ControllerRule implements ValidationRule
{
	/**
	 * Run the validation rule.
	 *
	 * @param  \Closure(string): \Illuminate\Translation\PotentiallyTranslatedString  $fail
	 */
	public function validate(string $attribute, mixed $value, Closure $fail): void
	{

	}

	public function rules()
	{
		//
		$controller = new ControllerModel();

		dd($this->modulo);

		// $controller -> where('id_modulo', $this->modulo)
	}
}
