<?php

namespace App\Rules;

use App\Models\ControllerModel;
use Closure;
use Illuminate\Contracts\Validation\InvokableRule;
use Illuminate\Contracts\Validation\ValidationRule;

class ControllerRule implements ValidationRule, InvokableRule
{
	/**
	 * Run the validation rule.
	 *
	 * @param  \Closure(string): \Illuminate\Translation\PotentiallyTranslatedString  $fail
	 */
	public function validate(string $attribute, mixed $value, Closure $fail): void
	{

		$this->__invoke($attribute, $value, $fail);

	}

	// public function rules()
	public function __invoke(string $attribute, mixed $value, Closure $fail): void
	{

		$controllerModel = new ControllerModel();

		$id         = $_POST['id'];
		$controller = $_POST['controller'];
		$modulo     = $_POST['modulo'];

		$exists = $controllerModel->from('tb_acl_modulo_controller')
			->where('id_modulo', $modulo)
			->where('controller', $controller)
			->where('id', '<>', $id)
			->exists();

		if ($exists) {
			$fail('Nome de Controller já está em uso.');
		}

	}
}
