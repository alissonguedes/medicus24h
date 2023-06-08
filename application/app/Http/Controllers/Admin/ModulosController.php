<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\ControllerRequest;
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
			$id              = $request->id;
			$dados['modulo'] = $modulo->getModuloById($id);
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

		// if (is_null($create_controller) && is_null($create_view)) {
		// 	$message = 'Nenhuma ação foi realizada';
		// }

		if (!$modulo->criar_estrutura($request)) {
			$message = 'Nenhuma ação foi realizada';
		}

		return response()->json([
			'status'      => 'success',
			'message'     => $message,
			'clean_form'  => true,
			'close_modal' => false,
		]);

	}

	public function list_controller(Request $request, ControllerModel $controller)
	{

		$dados['paginate'] = $controller->getControllers(null, $request->id_modulo);

		return response(view('admin.modulos.controllers.list', $dados), 200);

	}

	/**
	 * Display the specified resource.
	 */
	public function form_controller(Request $request, ControllerModel $controller, ModuloModel $modulo)
	{

		$dados['modulo']     = $modulo->getModuloById($request->id_modulo);
		$dados['controller'] = $controller->getControllerById($request->id_controller, $request->id_modulo);

		return response(view('admin.modulos.controllers.form', $dados), 200);

	}

	/**
	 * Show the form for creating a new resource.
	 */
	public function create_controller(ControllerRequest $request, ControllerModel $controller, ModuloModel $modulo)
	{

		$controller->create($request->all());

		return response()->json([
			'status'      => 'success',
			'message'     => 'Controller adicionado com sucesso!',
			'clean_form'  => true,
			'close_modal' => true,
			'type'        => 'refresh',
			'url'         => url()->route('admin.modulos.controller.index', $request->modulo),
		]);

	}

	/**
	 * Update the specified resource in storage.
	 */
	public function update_controller(ControllerRequest $request, ControllerModel $controller)
	{

		$controller->edit($request->all());

		return response()->json([
			'status'      => 'success',
			'message'     => 'Controller editado com sucesso!',
			'clean_form'  => true,
			'close_modal' => true,
			'type'        => 'refresh',
			'url'         => url()->route('admin.modulos.controller.index', $request->modulo),
		]);

	}

}
