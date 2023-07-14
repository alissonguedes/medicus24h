<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model as ModelCore;

class Model extends ModelCore
{

	private $request;

	protected $fields  = [];
	protected $datamap = [];
	protected $order   = [];

	/**
	 * The attributes that should be cast.
	 *
	 * @var array<string, string>
	 */
	protected $casts = [
		'created_at' => 'created',
		'updated_at' => 'updated',
	];

	public $timestamps = false;

	protected function map(string $key)
	{

		if (empty($this->datamap)) {
			return $key;
		}

		if (!empty($this->datamap[$key])) {
			return $this->datamap[$key];
		}

		return $key;

	}

	protected function fields($field)
	{

		$data = [];

		unset($field['id']);
		unset($field['_token']);
		unset($field['_method']);

		foreach ($field as $i => $v) {

			$k = $this->map($i);

			$data[$k] = $v;

		}

		// dd($data);

		return $data;

	}

	public function uploadImage(Request $image)
	{
		$imagem = null;

		if ($image->file('imagem')) {
			$file     = $image->imagem;
			$fileName = sha1($file->getClientOriginalName());
			$fileExt  = $file->getClientOriginalExtension();
			$imgName  = explode('.', $file->getClientOriginalName());
			$origName = limpa_string($imgName[count($imgName) - 2], '-') . '.' . $fileExt;
			$imagem   = limpa_string($fileName) . '.' . $fileExt;
			$file->storeAs($this->path, $imagem);
			$imagem = $this->path . $imagem;
		}

		return $imagem;

	}

}
