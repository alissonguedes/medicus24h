<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\ModuloRequest;
use Illuminate\Http\Request;
use \App\Models\ControllerModel;
use \App\Models\ModuloModel;

class ModulosController extends Controller
{

	public function __construct()
	{

	}

	public function index(Request $request, ModuloModel $modulo)
	{

		$dados['paginate'] = $modulo->getModulos($request);

		if ($request->ajax()) {
			return response(view('admin.modulos.list', $dados), 200);
		}

		return response(view('admin.modulos.index', $dados), 200);

	}

	public function form(Request $request, ModuloModel $modulo, ControllerModel $controller)
	{

		$dados             = [];
		$dados['modulos']  = $modulo->getModulos();
		$dados['paginate'] = $controller->getControllers(null, $request->id);

		if ($request->id) {
			$id           = $request->id;
			$dados['row'] = $modulo->getModuloById($id);
		}

		return response(view('admin.modulos.form', $dados), 200);

	}

	public function create(ModuloRequest $request, ModuloModel $modulo)
	{

		return $this->post($request, $modulo);

	}

	public function post(ModuloRequest $request, ModuloModel $modulo)
	{

		$id = $modulo->create($request->all());
		$this->criar_estrutura($request, $modulo);

		return response()->json([
			'status'      => 'success',
			'message'     => 'Modulo editado com sucesso!',
			'clean_form'  => true,
			'close_modal' => false,
			'type'        => 'redirect',
			'url'         => url()->route('admin.modulos.edit', $id),
		]);

	}

	public function edit(ModuloRequest $request, ModuloModel $modulo)
	{

		return $this->put($request, $modulo);

	}

	public function put(ModuloRequest $request, ModuloModel $modulo)
	{

		$id = $modulo->edit($request->all());

		return response()->json([
			'status'      => 'success',
			'message'     => 'Modulo editado com sucesso!',
			'clean_form'  => true,
			'close_modal' => false,
			// 'type'=>'redirect',
			'url'         => url()->route('admin.modulos.edit', $id),
		]);

	}

	public function delete(Request $request, ModuloModel $modulo)
	{

		$modulo->remove($request->id);

		return response()->json([
			'status'      => 'success',
			'message'     => 'Modulo removido com sucesso!',
			'clean_form'  => true,
			'close_modal' => false,
			// 'type'=>'redirect',
			// 'url'         => url()->route('admin.modulos.edit', $id),
		]);

	}

	public function criar_estrutura(Request $request, ModuloModel $modulo)
	{

		$id_controller     = null;
		$create_controller = null;
		$create_view       = null;
		$controller        = limpa_string($request->namespace, '/', false) . '/HomeController';
		$view              = limpa_string($request->path, '.') . '.home.index';
		$f_controller      = app_path(str_replace('App/', '', $controller) . '.php');
		$f_view            = resource_path('views/' . str_replace('.', '/', $view) . '.blade.php');

		if (!file_exists($f_controller)) {
			$create_controller = shell_exec('php ../application/artisan make:controller ' . $controller . ' --resource');
		}

		if (!file_exists($f_view)) {
			$create_view = shell_exec('php ../application/artisan make:view ' . $view . ' --extends=app --section="title:OS Tickets" --section=body');
		}

		$routes = [
			['name' => 'index', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'any', 'route' => $request->diretorio, 'action' => 'index', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
			['name' => 'index', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'any', 'route' => '/', 'action' => 'index', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
			['name' => 'add', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'any', 'route' => '/cadastro', 'action' => 'form', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
			['name' => 'show', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'get', 'route' => '/{id}', 'action' => 'show', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
			['name' => 'autocomplete', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'get', 'route' => '/json/autocomplete', 'action' => 'autocomplete', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
			['name' => 'post', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'post', 'route' => '/', 'action' => 'store', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
			['name' => 'post', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'put', 'route' => '/', 'action' => 'update', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
			['name' => 'edit', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'get', 'route' => '/id/{id}', 'action' => 'form', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
			['name' => 'patch', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'patch', 'route' => '/id/{id}', 'action' => 'patch', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
			['name' => 'delete', 'id_controller' => $id_controller, 'id_parent' => null, 'type' => 'delete', 'route' => '/id/{id}', 'action' => 'destroy', 'filter' => null, 'permissao' => '1111', 'restrict' => 'inherit', 'status' => '1'],
		];

		foreach ($routes as $ind => $val) {

		}

		$message = null;
		$message .= !is_null($create_controller) ? 'Controller ' . $controller . ' criado com sucesso!' : null;
		$message .= !is_null($create_view) ? 'View ' . $view . ' criado com sucesso!' : null;

		if (is_null($create_controller) && is_null($create_view)) {
			$message = 'Nenhuma ação foi realizada';
		}

		return response()->json([
			'status'      => 'success',
			'message'     => $message,
			'clean_form'  => true,
			'close_modal' => false,
		]);

	}

}
