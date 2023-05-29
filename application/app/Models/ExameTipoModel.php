<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;

class ExameTipoModel extends Model
{

	use HasFactory;

	private $path      = 'assets/clinica/img/exames/';
	protected $table   = 'tb_exame_categoria';
	protected $order   = [];
	protected $datamap = [];

	public function __construct()
	{

	}

	public function getTipoExames($data = null)
	{

		$get = $this->select(
			'id',
			'titulo',
			'descricao',
			'classificacao',
			'status',
		);

		if (isset($data->search) && $search = $data->search) {
			$get->where(function ($query) use ($search) {
				$query
					->orWhere('titulo', 'like', $search . '%')
					->orWhere('descricao', 'like', $search . '%')
					->orWhere('classificacao', 'like', $search . '%');
			});
		}

		if (isset($data->status) && $data->status) {
			$get->where('status', $data->status);
		}

		// Order By

		$this->order = [
			null,
			'titulo',
			'classificacao',
			'status',
			null,
		];

		if (isset($data->order) && $data->direction) {
			$get->orderBy($this->order[$data->order], $data->direction);
		} else {
			$get->orderBy($this->order[1], 'asc');
		}

		return $get->paginate(isset($_GET['length']) ? $_GET['length'] : 50);

	}

	public function getTipoExameById($id)
	{

		return $this->getTipoExames()
			->where('id', $id)
			->first();

	}

	public function isBlocked($id)
	{

		return $this->getExames()
			->where('id', $id)
			->where('status', '0')
			->first() ? true : false;

	}

	/**
	 * Método para ordenar as colunas da tabela
	 * @param $input <array>
	 */
	private function sanitize(array $input = array())
	{

		if (!isset($input['status'])) {
			$input['status'] = '0';
		}

		return $this->fields($input);

	}

	public function create(array $input = array())
	{

		$data = $this->sanitize($input);

		$id = $this->insertGetId($data);

		return $id;

	}

	private function insertConvenios(array $convenios = array(), $id_exame)
	{

		if (is_array($convenios)) {

			foreach ($convenios as $convenio) {

				$c             = json_decode($convenio, true);
				$c['id_exame'] = $id_exame;

				$issetConvenio = $this->from('tb_exame_convenio')
					->where('id_exame', $id_exame)
					->where('id_convenio', $c['id_convenio'])
					->first();

				if (!isset($issetConvenio)) {
					$this->from('tb_exame_convenio')
						->insert($c);
				}

			}

		}

	}

	public function edit(array $input = array())
	{

		$id   = $input['id'];
		$data = $this->sanitize($input);

		$this->where('id', $id)
			->update($data);

		return $id;

	}

	public function remove()
	{

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
