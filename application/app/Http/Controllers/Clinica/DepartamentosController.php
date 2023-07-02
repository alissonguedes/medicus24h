<?php

namespace App\Http\Controllers\Clinica {

	use App\Models\DepartamentoModel;
	use App\Models\EmpresaModel;
	use Illuminate\Http\Request;
	use Illuminate\Validation\Rule;

	class DepartamentosController extends Controller
	{

		public function __construct()
		{

			$this->departamento_model = new DepartamentoModel();
			$this->empresa            = new EmpresaModel();

		}

		public function index(Request $request)
		{

			$dados['paginate'] = $this->departamento_model->getDepartamentos($request);

			if ($request->ajax()) {
				return response(view('clinica.departamentos.list', $dados), 200);
			}

			return view('clinica.departamentos.index', $dados);

		}

		public function autocomplete(Request $request, $especialidade = null)
		{

			$dados = $this->empresa->getDepartamentos($request->clinica);

			$complete = [];

			if ($dados->count() > 0) {
				foreach ($dados as $row) {
					$complete['items'][] = [
						'id'   => $row->id,
						'text' => $row->titulo,
					];
				}
			} else {
				$complete['items'][] = ['id' => null, 'text' => 'Nenhum registro encontrado.'];
			}

			return response($complete, 200);

		}

		public function form(Request $request, $id = null)
		{

			$dados['row'] = $this->departamento_model->getDepartamentoById($id);
			return view('clinica.departamentos.form', $dados);

		}

		public function create(Request $request)
		{

			$request->validate([
				'titulo'    => [
					'required',
					Rule::unique('tb_departamento', 'titulo')->ignore($request->post('id'), 'id'),
				],
				'descricao' => 'nullable',
			]);

			$id = $this->departamento_model->cadastraDepartamento($request);

			$data['status']      = 'success';
			$data['type']        = 'refresh';
			$data['clean_form']  = true;
			$data['close_modal'] = true;
			// $data['url']         = url()->route('clinica.departamentos.index');
			$data['message'] = 'Departamento cadastrado com sucesso!';

			return response()->json($data);

		}

		public function edit(Request $request)
		{

			$request->validate([
				'titulo'    => [
					'required',
					Rule::unique('tb_departamento', 'titulo')->ignore($request->post('id'), 'id'),
				],
				'descricao' => 'nullable',
			]);

			$id = $request->id;
			$this->departamento_model->editaDepartamento($request, $id);

			$data['status'] = 'success';
			// $data['url']         = url()->route('clinica.departamentos.index');
			$data['type']        = 'refresh';
			$data['clean_form']  = true;
			$data['close_modal'] = true;
			$data['message']     = 'Dados atualizados com sucesso!';

			return response()->json($data);

		}

		public function patch(Request $request)
		{

			$this->departamento_model->from('tb_departamento')
				->whereIn('id', $request->id)
				->update([$request->field => $request->value]);

			return response()->json([
				'message' => 'Departamento atualizado com sucesso!',
			]);

		}

		public function delete(Request $request)
		{

			if ($this->departamento_model->removeDepartamento($request->id)) {
				$status  = 'success';
				$message = 'Clínia removida com sucesso!';
			} else {
				$status  = 'error';
				$message = $this->departamento_model->getErros();
			}

			$status  = $status;
			$message = $message;
			$url     = url()->route('clinica.departamentos.index');
			$type    = 'send';

			return json_encode(['status' => $status, 'message' => $message, 'type' => $type, 'url' => $url], 200);

		}

	}

}
