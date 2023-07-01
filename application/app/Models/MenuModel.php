<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\DB;

class MenuModel extends Model
{

	use HasFactory;

	protected $table = 'tb_acl_menu';

	protected $order = [
		null,
		'titulo',
		'tb_acl_menu.created_at',
		'tb_acl_menu.updated_at',
		'tb_acl_menu.status',
		null,
	];

	public function __construct()
	{
		$this->connection = env('DB_CONNECTION_2');
	}

	public function getMenus($request = null)
	{

		$get = $this->select(
			'tb_acl_menu.id',
			// DB::raw('(SELECT titulo FROM tb_acl_menu_descricao WHERE id_menu = tb_acl_menu.id AND id_idioma = ' . DB::raw('(SELECT id FROM tb_sys_idioma WHERE sigla = "' . $_COOKIE['idioma']) . '")) AS titulo'),
			// DB::raw('(SELECT descricao FROM tb_acl_menu_descricao WHERE id_menu = tb_acl_menu.id AND id_idioma = ' . DB::raw('(SELECT id FROM tb_sys_idioma WHERE sigla = "' . $_COOKIE['idioma']) . '")) AS slug'),
			DB::raw('(SELECT titulo FROM tb_acl_menu_descricao WHERE id_menu = tb_acl_menu.id AND id_idioma = (SELECT id FROM tb_sys_idioma WHERE sigla = "' . ($_COOKIE['idioma'] ?? get_config('language')) . '")) AS titulo'),
			DB::raw('(SELECT descricao FROM tb_acl_menu_descricao WHERE id_menu = tb_acl_menu.id AND id_idioma = (SELECT id FROM tb_sys_idioma WHERE sigla = "' . ($_COOKIE['idioma'] ?? get_config('language')) . '")) AS slug'),
			'tb_acl_menu.created_at',
			'tb_acl_menu.updated_at',
			DB::raw('IF(tb_acl_menu.status = "1", "Ativo", "Inativo") AS status'),
		);

		// $get->join('tb_acl_modulo_grupo AS G', 'G.id_menu', '=', 'tb_acl_menu.id');

		// $get->join('tb_acl_menu_descricao AS D', 'D.id_menu', '=', 'tb_acl_menu.id');
		// $get->join('tb_sys_idioma AS I', 'I.id', '=', 'D.id_idioma');

		// $get->where('status', '1');

		// if (!is_null($menu)) {
		// 	$get->where('slug', $menu);
		// 	$get->orWhere('link', $menu);
		// }

		if (isset($_GET['search']['value']) && !empty($_GET['search']['value'])) {
			$get->where(function ($query) {
				$query
					->orWhere('D.titulo', 'like', $_GET['search']['value'] . '%')
					->orWhere('D.descricao', 'like', $_GET['search']['value'] . '%')
					->orWhere('D.meta_description', 'like', $_GET['search']['value'] . '%')
					->orWhere('D.meta_title', 'like', $_GET['search']['value'] . '%')
					->orWhere('D.meta_keywords', 'like', $_GET['search']['value'] . '%');
			});

		}

		// $this->orderBy($request->post('order')[0]['column']);

		// // Order By
		// if (isset($_GET['order']) && $_GET['order'][0]['column'] != 0) {
		// 	$get->orderBy($this->order[$_GET['order'][0]['column']], $_GET['order'][0]['dir']);
		// } else {
		// 	$get->orderBy($this->order[1], 'asc');
		// }
		$this->order = [
			'',
			DB::raw('(SELECT titulo FROM tb_acl_menu_descricao WHERE id_menu = tb_acl_menu.id AND id_idioma = (SELECT id FROM tb_sys_idioma WHERE sigla = "' . ($_COOKIE['idioma'] ?? get_config('language')) . '"))'),
			DB::raw('(SELECT descricao FROM tb_acl_menu_descricao WHERE id_menu = tb_acl_menu.id AND id_idioma = (SELECT id FROM tb_sys_idioma WHERE sigla = "' . ($_COOKIE['idioma'] ?? get_config('language')) . '"))'),
			'',
			'',
			DB::raw('IF(Modulo.status = "1", "Ativo", "Inativo")'),
			'',
		];

		// Order By
		if (isset($request->order) && isset($request->direction)) {
			$get->orderBy($this->order[$request->order], $request->direction);
		} else {
			$get->orderBy($this->order[1], 'asc');
		}

		return $get->paginate(isset($request->length) ? $request->length : 50);

	}

	public function getMenuById($id)
	{

		return $this->getMenus()
			->where('id', $id)
			->first();

	}

	public function getMenusItens($id_menu, $id_parent = null): array
	{

		$list = [];

		$items = $this->select(
			'Item.id',
			'Item.id_controller',
			'Item.id_parent',
			'Item.id_route',
			'Item.icon',
			'Item.divider',
			'Item.item_type',
			DB::raw('(SELECT titulo FROM tb_acl_menu_item_descricao WHERE id_item = Item.id AND id_idioma = ' . lang(true) . ') AS titulo'),
			DB::raw('(SELECT descricao FROM tb_acl_menu_item_descricao WHERE id_item = Item.id AND id_idioma = ' . lang(true) . ') AS descricao'),
		)
			->from('tb_acl_menu_item AS Item')
			->whereIn('Item.id', function ($query) use ($id_menu, $id_parent) {
				$query->select('I.id_item')
					->from('tb_acl_menu_item_menu AS I')
					->whereColumn('I.id_item', 'Item.id')
					->where('I.status', '1')
					->where('I.id_menu', $id_menu);
			})
			->where('id_parent', $id_parent)
			->where('status', '1')
			->orderBy('ordem', 'asc')
			->orderBy('descricao', 'asc')
			->get();

		if ($items->count() > 0) {

			foreach ($items as $item) {

				$submenus = $this->from('tb_acl_menu_item')
					->where('id_parent', $item->id)
					->where('status', '1')
					->whereIn('id', function ($query) use ($id_menu) {
						$query->select('id_item')
							->from('tb_acl_menu_item_menu')
							->whereColumn('id_item', 'id')
							->where('status', '1')
							->where('id_menu', $id_menu);
					})
					->first();

				$list[$item->id] = ['id' => $item->id, 'item' => $item->titulo];

				if (isset($submenus)) {
					$list[$item->id]['children'][] = $this->getMenusItens($id_menu, $item->id);
				}

			}

		}

		return $list;

	}

	public function getMenuByModulo($id_modulo)
	{

		$get = $this->select(
			'M.id',
			DB::raw('(SELECT titulo FROM tb_acl_menu_descricao WHERE id_menu = M.id AND id_idioma = (SELECT id FROM tb_sys_idioma WHERE sigla = "' . ($_COOKIE['idioma'] ?? get_config('language')) . '")) AS titulo'),
			DB::raw('(SELECT descricao FROM tb_acl_menu_descricao WHERE id_menu = M.id AND id_idioma = (SELECT id FROM tb_sys_idioma WHERE sigla = "' . ($_COOKIE['idioma'] ?? get_config('language')) . '")) AS slug'),
			'M.created_at',
			'M.updated_at',
			DB::raw('IF(M.status = "1", "Ativo", "Inativo") AS status'),
		);

		$get->from('tb_acl_menu AS M');
		$get->join('tb_acl_modulo_grupo_menu AS GM', 'GM.id_menu', '=', 'M.id', 'left');

		// Left join aqui

		$get->where('GM.id_modulo_grupo', function ($query) use ($id_modulo) {
			$query->select('id')
				->from('tb_acl_modulo_grupo')
				->whereColumn('id', 'id_modulo_grupo')
				->where('id_modulo', $id_modulo);
		});

		$menus = $get->paginate();

		return $menus;

	}

	public function insertMenu($post)
	{

		$titulo    = $post->titulo;
		$modulo    = $post->modulo;
		$id_idioma = 1;
		$id_menu   = $this->insertGetId(['id_modulo' => $modulo]);
		$data      = [
			'id_menu'   => $id_menu,
			'id_idioma' => $id_idioma,
			'titulo'    => $titulo,
			'descricao' => limpa_string($titulo),
		];

		$this->from('tb_acl_menu_descricao')
			->insert($data);

		return $id_menu;

	}

	/**
	 * Método para ordenar as colunas da tabela
	 * @param $input <array>
	 */
	private function sanitize(array $input = array())
	{

		$input['descricao'] = limpa_string($input['titulo'], '-');

		return $this->fields($input);

	}

	public function editOrCreate(array $input = array())
	{

		if (isset($input['id'])) {
			$id = $input['id'];
		} else {
			$id = $this->insertGetId([]);
		}

		$data = $this->sanitize($input);

		if (isset($data['estrutura'])) {
			$estrutura = $data['estrutura'];
			unset($data['estrutura']);
		}

		$idioma = $this->select('id')
			->from('tb_sys_idioma')
			->where('sigla', $_COOKIE['idioma'] ?? get_config('language'))
			->get()
			->first();

		$where['id_menu']   = $id;
		$where['id_idioma'] = $idioma->id;

		$this->from('tb_acl_menu_descricao')
			->updateOrInsert($where, $data);

		if (isset($estrutura)) {
			// Ajusta Itens do Menu
			$this->itens_menu($id, $estrutura);
		}

		return $id;

	}

	public function itens_menu($id_menu, $itens)
	{

		dump($id_menu, $itens);

	}

	public function remove(array $id = array())
	{
		return $this->whereIn('id', $id)->delete();
	}

}
