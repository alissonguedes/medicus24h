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

	public function getMenuModulo()
	{

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

		// if (!isset($input['status'])) {
		// $input['status'] = '1';
		// }

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

		$idioma = $this->select('id')
			->from('tb_sys_idioma')
			->where('sigla', $_COOKIE['idioma'] ?? get_config('language'))
			->get()
			->first();

		$where['id_menu']   = $id;
		$where['id_idioma'] = $idioma->id;

		$this->from('tb_acl_menu_descricao')
			->updateOrInsert($where, $data);

		return $id;

	}

	public function remove(array $id = array())
	{
		return $this->whereIn('id', $id)->delete();
	}

}
