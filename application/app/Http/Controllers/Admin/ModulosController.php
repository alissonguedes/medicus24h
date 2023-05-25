<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\ModuloRequest;
use Illuminate\Http\Request;
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

	public function form(Request $request, ModuloModel $modulo)
	{

		$dados = [];

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

}
