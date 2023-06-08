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
	 * @param  \Closure(string): \Illuminate\Translation\PotentiallyTranslatedString $fail
	 */
	public function validate(string $attribute, mixed $value, Closure $fail): void
	{

		$controllerModel = new ControllerModel();

		$id         = isset($_POST['id']) ? $_POST['id'] : null;
		$controller = $_POST['controller'];
		$modulo     = $_POST['modulo'];

		$exists = $controllerModel->from('tb_acl_modulo_controller')
			->where('id_modulo', $modulo)
			->where('controller', $controller);

		if (!is_null($id)) {
			$exists->where('id', '<>', $id);
		}

		$exists = $exists->exists();

		if ($exists) {
			$fail('Nome de Controller já está em uso.');
		}

	}

}
