<?php

namespace App\Http\Controllers\Clinica{

	use App\Http\Requests\Clinica\ExameTipoRequest;
	use App\Models\ExameTipoModel;
	use Illuminate\Http\Request;

	class ExamesTiposController extends Controller
	{

		private $request;
		private $exame;

		public function __construct(
			Request $request,
			ExameTipoModel $exame
		) {

			$this->request = $request;
			$this->exame   = $exame;

		}

		public function index()
		{

			$dados['paginate'] = $this->exame->getTipoExames($this->request);

			if ($this->request->ajax()) {
				return response(view('clinica.categorias.exames.list', $dados), 200);
			}

			return view('clinica.categorias.exames.index', $dados);

		}

		public function form($id = null)
		{

			$dados['row'] = $this->exame->getTipoExameById($id);

			return view('clinica.categorias.exames.form', $dados);

		}

		public function create(ExameTipoRequest $request)
		{

			$id = $this->exame->create($this->request->all());

			return response()->json([
				'status'      => 'success',
				'message'     => 'Exame cadastrado com sucesso!',
				'clean_form'  => true,
				'close_modal' => true,
				'url'         => url()->route('clinica.funcionarios.index'),
				'type'        => 'refresh',
			]);

		}

		public function edit(ExameTipoRequest $request)
		{

			$id = $request->id;
			$this->exame->edit($this->request->all(), $id);

			return response()->json([
				'status'      => 'success',
				'message'     => 'Exame atualizado com sucesso!',
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

			$this->exame->from('tb_exame_categoria')->whereIn('id', $request->id)->delete();

			$status  = 'success';
			$message = 'Exame removido com sucesso!';
			$url     = url()->route('clinica.exames.index');
			$type    = 'refresh';

			return json_encode(['status' => $status, 'message' => $message, 'type' => $type, 'url' => $url], 200);

		}

	}

}
