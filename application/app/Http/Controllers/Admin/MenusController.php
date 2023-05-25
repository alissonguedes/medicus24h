<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\MenuRequest;
use Illuminate\Http\Request;
use \App\Models\MenuModel;
use \App\Models\ModuloModel;

class MenusController extends Controller
{

	public function __construct()
	{

	}

	public function index(Request $request, MenuModel $menu)
	{

		$dados['paginate'] = $menu->getMenus($request);

		if ($request->ajax()) {
			return response(view('admin.menus.grupos.list', $dados), 200);
		}

		return response(view('admin.menus.grupos.index', $dados), 200);

	}

	public function form(Request $request, MenuModel $menu, ModuloModel $modulo)
	{

		$dados = [];

		if ($request->id) {
			$id           = $request->id;
			$dados['row'] = $menu->getMenuById($id);
		}

		$dados['modulos'] = $modulo->getModulos();

		return response(view('admin.menus.grupos.form', $dados), 200);

	}

	public function create(MenuRequest $request, MenuModel $menu)
	{

		return $this->post($request, $menu);

	}

	public function post(MenuRequest $request, MenuModel $menu)
	{

		$id = $menu->editOrCreate($request->all());

		return response()->json([
			'status'      => 'success',
			'message'     => 'Menu editado com sucesso!',
			'clean_form'  => true,
			'close_modal' => false,
			'type'        => 'redirect',
			'url'         => url()->route('admin.menus.edit', $id),
		]);

	}

	public function edit(MenuRequest $request, MenuModel $menu)
	{

		return $this->put($request, $menu);

	}

	public function put(MenuRequest $request, MenuModel $menu)
	{

		$id = $menu->editOrCreate($request->all());

		return response()->json([
			'status'      => 'success',
			'message'     => 'Menu editado com sucesso!',
			'clean_form'  => true,
			'close_modal' => false,
			// 'type'=>'redirect',
			// 'url'         => url()->route('admin.menus.grupos.edit', $id),
		]);

	}

	public function delete(Request $request, MenuModel $menu)
	{

		$menu->remove($request->id);

		return response()->json([
			'status'      => 'success',
			'message'     => 'Menu removido com sucesso!',
			'clean_form'  => true,
			'close_modal' => false,
			// 'type'=>'redirect',
			// 'url'         => url()->route('admin.menus.grupos.edit', $id),
		]);
	}

}
