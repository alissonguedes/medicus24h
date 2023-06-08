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

		public function criar_estrutura($request)
		{

			// dd($request->all());
			$saida_controller = '';
			$saida_view       = '';

			$id_modulo = $request->id;

			// Primeiramente, criar estrutura dos controllers

			$modulo = $this->select('id', 'namespace', 'path')
				->from('tb_acl_modulo')
				->where('id', $id_modulo)
				->get()
				->first();

			if (isset($modulo)) {

				$controllers = $this->select('id', 'controller')
					->from('tb_acl_modulo_controller')
					->where('id_modulo', $id_modulo)
					->get();

				if ($controllers->count() > 0) {

					// Obter o último ID cadastrado no banco para atribui-lo à rota
					$id_view = $this->select(DB::raw('MAX(id) AS id'))
						->from('tb_acl_modulo_routes')
						->get()
						->first();

					$id_view = isset($id_view) ? $id_view->id + 2 : 1;

					foreach ($controllers as $c) {

						$controller = limpa_string($modulo->namespace, '/', false) . '/' . $c->controller;
						$command    = 'php ../application/artisan make:controller ' . $controller . ' --resource';

						/**
						 * Criação dos Controllers
						 */
						$file = app_path($controller . '.php');

						if (!file_exists($file)) {
							$exists = false;
						} else {
							$exists = true;
						}

						if (!$exists) {
							$execute = shell_exec($command);
							$saida_controller .= $command . ' - Executado com sucesso!!!<br>';
						} else {
							$saida_controller .= $command . ' - Não foi executado por que o arquivo ' . $file . ' já existe! <br>';
						}

						/**
						 * Criação das Views
						 */

						$file_view = limpa_string($modulo->path, '.') . '.' . limpa_string(substr($c->controller, 0, -10));
						$file      = resource_path(limpa_string($file_view, '/'));
						$view      = $file_view;

						$command = 'php ../application/artisan make:view ' . $view . ' --resource --verb=index --verb=list --verb=form --verb=table';

						if (!file_exists($file)) {
							$exists = false;
						} else {
							$exists = true;
						}

						if (!$exists) {
							$execute = shell_exec($command);
							$saida_view .= $command . ' - Executado com sucesso!!!<br>';
						} else {
							$saida_view .= $command . ' - Não foi executado por que o arquivo ' . $file . ' já existe!<br>';
						}

						/**
						 * Criação das Rotas
						 */

						$routes = [
							['name' => limpa_string($modulo->path, '.') . '.index', 'id_controller' => $c->id, 'id_parent' => null, 'type' => 'any', 'route' => '/', 'action' => 'index', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
							['name' => $view . '.index', 'id_controller' => $c->id, 'id_parent' => null, 'type' => 'any', 'route' => '/' . limpa_string(substr($c->controller, 0, -10)), 'action' => 'index', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
							['name' => $view . '.index', 'id_controller' => $c->id, 'id_parent' => $id_view, 'type' => 'any', 'route' => '/', 'action' => 'index', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
							['name' => $view . '.add', 'id_controller' => $c->id, 'id_parent' => $id_view, 'type' => 'any', 'route' => '/cadastro', 'action' => 'form', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
							['name' => $view . '.show', 'id_controller' => $c->id, 'id_parent' => $id_view, 'type' => 'get', 'route' => '/{id}', 'action' => 'show', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
							['name' => $view . '.autocomplete', 'id_controller' => $c->id, 'id_parent' => $id_view, 'type' => 'get', 'route' => '/json/autocomplete', 'action' => 'autocomplete', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
							['name' => $view . '.post', 'id_controller' => $c->id, 'id_parent' => $id_view, 'type' => 'post', 'route' => '/', 'action' => 'store', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
							['name' => $view . '.post', 'id_controller' => $c->id, 'id_parent' => $id_view, 'type' => 'put', 'route' => '/', 'action' => 'update', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
							['name' => $view . '.edit', 'id_controller' => $c->id, 'id_parent' => $id_view, 'type' => 'get', 'route' => '/id/{id}', 'action' => 'form', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
							['name' => $view . '.patch', 'id_controller' => $c->id, 'id_parent' => $id_view, 'type' => 'patch', 'route' => '/{id}', 'action' => 'patch', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
							['name' => $view . '.delete', 'id_controller' => $c->id, 'id_parent' => $id_view, 'type' => 'delete', 'route' => '/', 'action' => 'destroy', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
						];

						foreach ($routes as $r) {

							$exists = $this->from('tb_acl_modulo_routes')
								->where('type', $r['type'])
								->where('route', $r['route'])
								->where('action', $r['action'])
								->where('name', $r['name'])
								->exists();

							if (!$exists) {
								$this->from('tb_acl_modulo_routes')
									->insert($r);
							}

						}

					}

				}

			} else {

				$saida_controller = 'Nenhuma ação foi realizada porque não há dados';

			}

			echo $saida_controller . '
			' . $saida_view;

			// $id_controller     = null;
			// $create_controller = null;
			// $create_view       = null;
			// $controller        = limpa_string($request->namespace, '/', false) . '/HomeController';
			// $view              = limpa_string($request->path, '.') . '.home.index';
			// $f_controller      = app_path(str_replace('App/', '', $controller) . '.php');
			// $f_view            = resource_path('views/' . str_replace('.', '/', $view) . '.blade.php');

			// if (!file_exists($f_controller)) {
			// 	$create_controller = shell_exec('php ../application/artisan make:controller ' . $controller . ' --resource');
			// }

			// if (!file_exists($f_view)) {
			// 	$create_view = shell_exec('php ../application/artisan make:view ' . $view . ' --extends=app --section="title:OS Tickets" --section=body');
			// }

			// $routes = [
			// 	['name' => 'index', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'any', 'route' => $request->diretorio, 'action' => 'index', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
			// 	['name' => 'index', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'any', 'route' => '/', 'action' => 'index', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
			// 	['name' => 'add', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'any', 'route' => '/cadastro', 'action' => 'form', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
			// 	['name' => 'show', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'get', 'route' => '/{id}', 'action' => 'show', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
			// 	['name' => 'autocomplete', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'get', 'route' => '/json/autocomplete', 'action' => 'autocomplete', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
			// 	['name' => 'post', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'post', 'route' => '/', 'action' => 'store', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
			// 	['name' => 'post', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'put', 'route' => '/', 'action' => 'update', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
			// 	['name' => 'edit', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'get', 'route' => '/id/{id}', 'action' => 'form', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
			// 	['name' => 'patch', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'patch', 'route' => '/id/{id}', 'action' => 'patch', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
			// 	['name' => 'delete', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'delete', 'route' => '/id/{id}', 'action' => 'destroy', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
			// ];

			// foreach ($routes as $ind => $val) {

			// }

			// $message = null;
			// $message .= !is_null($create_controller) ? 'Controller ' . $controller . ' criado com sucesso!' : null;
			// $message .= !is_null($create_view) ? 'View ' . $view . ' criado com sucesso!' : null;

		}

	}

}
