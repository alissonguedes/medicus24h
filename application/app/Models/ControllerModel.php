<?php

namespace App\Models{

	use Illuminate\Database\Eloquent\Factories\HasFactory;
	// use Illuminate\Database\Eloquent\Model;
	use Illuminate\Support\Facades\DB;

	class ControllerModel extends Model
	{

		use HasFactory;
		private $order = [];

		protected $table   = 'tb_acl_modulo_controller';
		protected $datamap = ['modulo' => 'id_modulo'];

		// protected $connection = 'mysql2';

		public function __construct()
		{
			$this->connection = env('DB_CONNECTION_2');
		}

		public function getControllers($request = null, $id_modulo = null)
		{

			$get = $this->select(
				'C.id',
				'C.id_modulo',
				'C.nome',
				'C.descricao',
				'C.controller',
				'C.use_as',
				'C.permissao',
				'C.created_at',
				'C.updated_at',
				'C.restrict',
				DB::raw('IF(C.status = "1", "Ativo", "Inativo") AS status')
			)
				->from('tb_acl_modulo_controller AS C');
			// ->where('status', '1');

			if (isset($request->id)) {
				$get->where('id', $request->id);
				return $get->first();
			}

			if (isset($id_modulo)) {
				$get->where('id_modulo', $id_modulo);
			}

			// if (isset($_GET['search']['value']) && !empty($_GET['search']['value'])) {
			if (isset($request->search)) {
				$get->where(function ($get) use ($request) {
					$search = $request->search;
					$get->orWhere('tb_acl_usuario.id', 'like', $search . '%')
						->orWhere('tb_acl_usuario.login', 'like', $search . '%')
						->orWhere('tb_acl_usuario.email', 'like', $search . '%');
				});
			}

			$this->order = [
				'',
				'C.controller',
				'C.use_as',
				'',
				'C.restrict',
				DB::raw('IF(C.status = "1", "Ativo", "Inativo")'),
				'',
			];

			// Order By
			if (isset($request->order) && isset($request->direction)) {
				$get->orderBy($this->order[$request->order], $request->direction);
			} else {
				$get->orderBy($this->order[2], 'asc');
			}

			return $get->paginate($_GET['length'] ?? 100);

		}

		public function getControllerById($id)
		{
			return $this->from('tb_acl_modulo_controller')
				->where('id', $id)
				->get()
				->first();
		}

		public function getIsRestrictController($controller)
		{

			return $this->from('tb_acl_modulo_controller')
				->where(DB::raw('CONCAT((SELECT namespace FROM tb_acl_modulo WHERE id = id_modulo), controller)'), $controller)
				->where('restrict', 'yes')
				->get()
				->first() ? true : false;
		}

		/**
		 * Método para ordenar as colunas da tabela
		 * @param $input <array>
		 */
		private function sanitize(array $input = array())
		{

			if (!isset($input['status'])) {
				$input['status'] = '1';
			}

			if (!isset($input['permissao'])) {
				$input['permissao'] = 1111;
			}

			return $this->fields($input);

		}

		public function create(array $input = array())
		{

			$data = $this->sanitize($input);

			$id = $this->insertGetId($data);

			return $id;

		}

		public function edit(array $input = array())
		{

			$id   = $input['id'];
			$data = $this->sanitize($input);

			$this->where('id', $id)
				->update($data);

			return $id;

		}

		public function remove(array $id = array())
		{
			return $this->whereIn('id', $id)->delete();
		}

	}

}
