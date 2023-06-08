<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\ControllerRequest;
use App\Models\ControllerModel;
use Illuminate\Http\Request;
use \App\Models\ModuloModel;

class ControllersController extends Controller
{
	/**
	 * Display a listing of the resource.
	 */
	public function index(Request $request, ControllerModel $controller)
	{

		$dados['controllers'] = $controller->getControllers(null, $request->modulo);

		if ($request->ajax()) {
			return response(view('admin.controllers.list', $dados), 200);
		}

		return response(view('admin.controllers.index', $dados), 200);

	}

	/**
	 * Show the form for creating a new resource.
	 */
	public function create(ControllerRequest $request, ControllerModel $controller, ModuloModel $modulo)
	{

		$controller->create($request->all());

		return response()->json([
			'status'      => 'success',
			'message'     => 'Controller adicionado com sucesso!',
			'clean_form'  => true,
			'close_modal' => true,
			'type'        => 'refresh',
			// 'url'         => url()->route('admin.modulos.edit', $id),
		]);

	}

	/**
	 * Store a newly created resource in storage.
	 */
	public function store(Request $request)
	{
		//
	}

	/**
	 * Display the specified resource.
	 */
	public function show(string $id)
	{
		//
	}

	/**
	 * Display the specified resource.
	 */
	public function form(Request $request, ModuloModel $modulo, ControllerModel $controller)
	{

		$dados['modulo']     = $modulo->getModuloById($request->id_modulo);
		$dados['controller'] = $controller->getControllerById($request->id, $request->id_modulo);

		return response(view('admin.modulos.controllers.form', $dados), 200);

	}

	/**
	 * Show the form for editing the specified resource.
	 */
	public function edit(string $id)
	{
		//
	}

	/**
	 * Update the specified resource in storage.
	 */
	public function update(ControllerRequest $request, ControllerModel $controller)
	{

		$controller->edit($request->all());

		return response()->json([
			'status'      => 'success',
			'message'     => 'Controller editado com sucesso!',
			'clean_form'  => true,
			'close_modal' => true,
			'type'        => 'refresh',
			// 'url'         => url()->route('clinica.funcionarios.index'),
		]);

	}

	/**
	 * Remove the specified resource from storage.
	 */
	public function destroy(string $id)
	{
		//
	}
}
