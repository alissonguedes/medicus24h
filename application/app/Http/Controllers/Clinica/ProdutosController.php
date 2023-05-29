<?php

namespace App\Http\Controllers\Clinica{

	use App\Http\Requests\Clinica\ProdutoRequest;
	use App\Models\ProdutoModel;
	use Illuminate\Http\Request;

	class ProdutosController extends Controller
	{

		private $request;
		private $produto;

		public function __construct(
			Request $request,
			ProdutoModel $produto
		) {

			$this->request = $request;
			$this->produto = $produto;

		}

		public function index()
		{

			$dados['paginate'] = $this->produto->getProdutos($this->request);

			if ($this->request->ajax()) {
				return response(view('clinica.produtos.list', $dados), 200);
			}

			return view('clinica.produtos.index', $dados);

		}

		public function form($id = null)
		{

			$dados['row'] = $this->produto->getProdutoById($id);

			return view('clinica.produtos.form', $dados);

		}

		public function create(ProdutoRequest $request)
		{

			$id = $this->produto->create($this->request->all());

			return response()->json([
				'status'      => 'success',
				'message'     => 'Produto cadastrado com sucesso!',
				'clean_form'  => true,
				'close_modal' => true,
				'url'         => url()->route('clinica.funcionarios.index'),
				'type'        => 'refresh',
			]);

		}

		public function edit(ProdutoRequest $request)
		{

			$id = $request->id;
			$this->produto->edit($this->request->all(), $id);

			return response()->json([
				'status'      => 'success',
				'message'     => 'Produto atualizado com sucesso!',
				'clean_form'  => true,
				'close_modal' => true,
				'type'        => 'refresh',
			]);

		}

		public function patch(Request $request)
		{

			// $this->funcionario_model->updateColumn($request);

			// return response()->json([
			// 	'message' => 'Médico atualizado com sucesso!',
			// ]);

		}

		public function delete(Request $request)
		{

			$this->produto->from('tb_produto')->whereIn('id', $request->id)->delete();

			$status  = 'success';
			$message = 'Produto removido com sucesso!';
			$url     = url()->route('clinica.produtos.index');
			$type    = 'send';

			return json_encode(['status' => $status, 'message' => $message, 'type' => $type, 'url' => $url], 200);

		}

	}

}
