<?php

namespace App\Http\Requests\Admin;

use App\Http\Requests\Request;
use App\Models\ModuloModel;
use Closure;
use Illuminate\Validation\Rule;

class ModuloRequest extends Request
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

		$model = new ModuloModel();

		$id        = isset($_POST['id']) ? $_POST['id'] : null;
		$path      = '/' . limpa_string($_POST['path']);
		$namespace = 'App\Http\Controllers\\' . $_POST['modulo'] . '\\';

		$exists = $model->from('tb_acl_modulo')
			->where(function ($query) use ($namespace, $path) {
				$query
					->where('namespace', $namespace)
					->orWhere('path', $path);
			});

		if (!is_null($id)) {
			$exists->where('id', '<>', $id);
		}

		$exists = $exists->first();

		$rules = [
			'modulo'    => [
				'required',
				Rule::unique('mysql2.tb_acl_modulo', 'modulo')->ignore($this->id, 'id'),
			],
			'path'      => [
				function (string $attribute, mixed $value, Closure $fail) use ($exists, $path) {

					if (isset($exists)) {
						if ($path == $exists->path) {
							$fail('O path já existe para este módulo.');
						}
					}

				},
			],
			'namespace' => [
				'required',
				'unique' => function (string $attribute, mixed $value, Closure $fail) use ($exists, $namespace) {

					if (isset($exists)) {
						if ($namespace == $exists->namespace) {
							$fail('O namespace já existe para este módulo.');
						}
					}

				},
			],
			'restrict'  => 'required',
		];

		return $rules;
	}

}
