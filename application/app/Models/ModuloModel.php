<?php

namespace App\Models{

	use Illuminate\Database\Eloquent\Factories\HasFactory;
	// use Illuminate\Database\Eloquent\Model;
	use Illuminate\Support\Facades\DB;
	use Illuminate\Support\Facades\Route;

	class ModuloModel extends Model
	{

		use HasFactory;
		private $order = [];

		protected $table = 'tb_acl_modulo';

		// protected $connection = 'mysql2';

		public function __construct()
		{
			$this->connection = env('DB_CONNECTION_2');
		}

		public function getModulos($request = null)
		{

			$get = $this->select(
				'Modulo.id',
				'Modulo.modulo',
				'Modulo.path',
				'Modulo.namespace',
				'Modulo.permissao',
				'Modulo.descricao',
				'Modulo.homepage',
				'Modulo.created_at',
				'Modulo.updated_at',
				'Modulo.restrict',
				DB::raw('IF(Modulo.status = "1", "Ativo", "Inativo") AS status')
			)
				->from('tb_acl_modulo AS Modulo');
			// ->where('status', '1');

			if (isset($request->id)) {
				$get->where('id', $request->id);
				return $get->first();
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
				'Modulo.modulo',
				'Modulo.path',
				'Modulo.namespace',
				'Modulo.restrict',
				DB::raw('IF(Modulo.status = "1", "Ativo", "Inativo")'),
				'',
			];

			// Order By
			if (isset($request->order) && isset($request->direction)) {
				$get->orderBy($this->order[$request->order], $request->direction);
			} else {
				$get->orderBy($this->order[2], 'asc');
			}

			return $get->paginate($_GET['length'] ?? null);

		}

		public function getModuloById($id)
		{
			return $this->from('tb_acl_modulo')
				->where('id', $id)
				->orWhere('path', $id)
				->get()
				->first();
		}

		public function getControllers($id_modulo = null)
		{

			return $this->from('tb_acl_modulo_controller')
				->where('id_modulo', $id_modulo)
			// ->where('status', '1')
				->get();

		}

		public function getRoutes($id = null, $id_parent = null)
		{

			$routes = $this->select(
				'id',
				'id_controller',
				DB::raw('(SELECT id_modulo FROM tb_acl_modulo_controller WHERE id = id_controller) AS id_modulo'),
				// DB::raw('(SELECT path FROM tb_acl_modulo WHERE id = (SELECT id_modulo FROM tb_acl_modulo_controller WHERE id = id_controller)) AS modulo'),
				'id_parent',
				'type',
				'route',
				DB::raw(
					'CONCAT(
						(SELECT namespace FROM tb_acl_modulo WHERE id =
							(SELECT id_modulo FROM tb_acl_modulo_controller WHERE id = id_controller)
						),
						(SELECT controller FROM tb_acl_modulo_controller WHERE id = id_controller)
					) AS controller'
				),
				'action',
				'name',
				'filter',
				'permissao',
				'restrict'
			)
				->from('tb_acl_modulo_routes');

			$routes = $routes->where('status', '1');

			if (gettype($id) === 'string') {
				$routes = $routes->where('name', $id);
				return $routes;
			}

			$routes->where('id_controller', function ($query) use ($id) {

				$query->select('C.id')
					->from('tb_acl_modulo_controller AS C')
					->whereColumn('id_controller', 'C.id')
					->where('C.id_modulo', $id);

			});

			$routes = $routes->where('id_parent', $id_parent)
				->orderBy('id_controller')
				->get();

			if ($routes->count() > 0) {

				foreach ($routes as $route) {

					$subroute = $this->from('tb_acl_modulo_routes')
						->where('id_parent', $route->id)
					// ->where('id_controller', $route->id_controller)
						->where('status', '1')
						->get();

					if ($subroute->count() === 0) {

						$type_route = $route->type;

						if (!empty($route->name)) {
							Route::$type_route($route->route, [$route->controller, $route->action])->name($route->name);
							// echo $route . '<br>';
							// echo 'Route::' . $type_route . '("' . $route->route . '", ["' . $route->controller . '", "' . $route->action . '"])->name("' . $route->name . '"); // ' . url($route->modulo . $route->route) . ' <br>';
						} else {
							Route::$type_route($route->route, [$route->controller, $route->action]);
							// echo $route . '<br>';
							// echo 'Route::' . $type_route . '("' . $route->route . '", ["' . $route->controller . '", "' . $route->action . '"]); // ' . route($route->name) . ' ;<br>';
						}

					} else {

						// echo 'Route::prefix("' . $route->route . '")->group(function ($router) use ($route) {<br>';
						Route::prefix($route->route)->group(function ($router) use ($route) {
							$this->getRoutes((int) $route->id_modulo, $route->id);
						});
						// echo '});<br>';

					}

				}

			}

		}

		public function getRoute($url)
		{

			return $this->getRoutes($url)->first() ?? 'Não existe uma rota válida';

		}

		public function getIsRestrictModulo($modulo)
		{

			return $this->from('tb_acl_modulo')
				->where(function ($query) use ($modulo) {
					$query->where('path', $modulo)
						->orWhere('id', $modulo);
				})
				->where('restrict', 'yes')
				->get()
				->first() ? true : false;

		}

		public function getIsRestrictController($controller)
		{

			return $this->from('tb_acl_modulo_controller')
				->where(DB::raw('CONCAT((SELECT namespace FROM tb_acl_modulo WHERE id = id_modulo), controller)'), $controller)
				->where('restrict', 'yes')
				->get()
				->first() ? true : false;
		}

		public function getIsRestrictRoute($controller, $action, $name)
		{

			$this->name = $name;

			return $this->from('tb_acl_modulo_routes')
				->where('id_controller', function ($query) use ($controller) {
					$query->select('id')
						->from('tb_acl_modulo_controller')
						->where(
							DB::raw('
								CONCAT(
									(SELECT namespace FROM tb_acl_modulo WHERE id = id_modulo),
									tb_acl_modulo_controller.controller
								)'
							),
							$controller
						);
				})
				->where('action', $action)
				->where(function ($where) {
					$where->orWhereNull('name')
						->orWhere('name', $this->name);
				})
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

			$namespace = limpa_string($input['namespace'], '\\', false);

			$input['namespace'] = 'App\Http\Controllers\\' . $namespace . '\\';
			$input['path']      = '/' . limpa_string($input['path']);

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
