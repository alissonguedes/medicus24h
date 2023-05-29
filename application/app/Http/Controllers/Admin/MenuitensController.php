<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\MenuitemRequest;
use Illuminate\Http\Request;
use \App\Models\MenuitemModel;

class MenuitensController extends Controller
{

	public function __construct()
	{

	}

	public function index(Request $request, MenuitemModel $menu)
	{

		$dados['paginate'] = $menu->getMenus($request);

		if ($request->ajax()) {
			return response(view('admin.menus.grupos.list', $dados), 200);
		}

		return response(view('admin.menus.grupos.index', $dados), 200);

	}

	public function form(Request $request, Menuitem $menu)
	{

		$dados = [];

		if ($request->id) {
			$id           = $request->id;
			$dados['row'] = $menu->getMenuById($id);
		}

		return response(view('admin.menus.grupos.form', $dados), 200);

	}

	public function create(MenuitemRequest $request, Menuitem $menu)
	{

		return $this->post($request, $menu);

	}

	public function post(MenuitemRequest $request, Menuitem $menu)
	{

		$id = $menu->create($request->all());

		return response()->json([
			'status'      => 'success',
			'message'     => 'Menu editado com sucesso!',
			'clean_form'  => true,
			'close_modal' => false,
			'type'        => 'redirect',
			'url'         => url()->route('admin.menus.grupos.edit', $id),
		]);

	}

	public function edit(MenuitemRequest $request, Menuitem $menu)
	{

		return $this->put($request, $menu);

	}

	public function put(MenuitemRequest $request, Menuitem $menu)
	{

		$id = $menu->edit($request->all());

		return response()->json([
			'status'      => 'success',
			'message'     => 'Menu editado com sucesso!',
			'clean_form'  => true,
			'close_modal' => false,
			// 'type'=>'redirect',
			'url'         => url()->route('admin.menus.grupos.edit', $id),
		]);

	}

	public function delete(Request $request, MenuitemModel $menu)
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
