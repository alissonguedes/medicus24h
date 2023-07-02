<?php

namespace App\Http\Controllers\Clinica {

	use App\Models\DepartamentoModel;
	use App\Models\EmpresaModel;
	use App\Models\EspecialidadeModel;
	use App\Models\EstadoCivilModel;
	use App\Models\FuncaoModel;
	use App\Models\FuncionarioModel;
	use App\Models\MedicoModel;
	use Illuminate\Http\Request;
	use Illuminate\Validation\Rule;

	class FuncionariosController extends Controller
	{

		public function __construct()
		{

			$this->departamento_model  = new DepartamentoModel();
			$this->estadoCivil_model   = new EstadoCivilModel();
			$this->especialidade_model = new EspecialidadeModel();
			$this->empresa_model       = new EmpresaModel();
			$this->funcoes_model       = new FuncaoModel();
			$this->funcionario_model   = new FuncionarioModel();
			$this->medico_model        = new MedicoModel();

		}

		public function index(Request $request)
		{

			$dados['paginate'] = $this->funcionario_model->getFuncionarios($request);

			if ($request->ajax()) {
				return response(view('clinica.funcionarios.list', $dados), 200);
			}

			return view('clinica.funcionarios.index', $dados);

		}

		public function autocomplete_clinica(Request $request)
		{

			$dados = $this->empresa_model->getClinicas($request, false);

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

			$dados['row']            = $this->funcionario_model->getFuncionarioById($id);
			$dados['departamentos']  = $this->departamento_model->getDepartamentos();
			$dados['etnias']         = $this->funcionario_model->getEtnia();
			$dados['estado_civil']   = $this->estadoCivil_model->getEstadoCivil();
			$dados['funcoes']        = $this->funcoes_model->getFuncoes();
			$dados['clinicas']       = $this->empresa_model->getEmpresasComDepartamento();
			$dados['medico']         = $this->medico_model->getMedicoById($id);
			$dados['especialidades'] = $this->especialidade_model->getEspecialidades();
			// $dados['clinicas']      = $this->empresa_model->getEmpresas();

			return view('clinica.funcionarios.form', $dados);

		}

		public function formValidate(Request $request)
		{

			return $request->validate([
				'clinica'       => 'required',
				'departamento'  => 'required',
				'nome'          => 'required',
				'email'         => [
					'nullable|email|required_if:receber_notificacoes,on',
					Rule::unique('tb_funcionario', 'email')->ignore($request->post('id'), 'id'),
				],
				'cpf'           => [
					'required',
					Rule::unique('tb_funcionario', 'cpf')->ignore($request->post('id'), 'id'),
				],
				'rg'            => [
					'required',
					Rule::unique('tb_funcionario', 'rg')->ignore($request->post('id'), 'id'),
				],
				'funcao'        => 'required',
				'crm'           => [
					'required_if:funcao,2',
					Rule::unique('tb_medico', 'crm')->ignore($request->post('id'), 'id_funcionario'),
				],
				'especialidade' => [
					'required_if:funcao,2',
				],

			]);

		}

		public function create(Request $request)
		{

			$this->formValidate($request);

			$id = $this->funcionario_model->cadastraFuncionario($request);

			$status = 'success';
			$url    = url()->route('clinica.funcionarios.index');
			$type   = 'send';

			$data['status']      = 'success';
			$data['type']        = 'refresh';
			$data['clean_form']  = true;
			$data['close_modal'] = true;
			$data['message']     = 'Funcionário cadastrado com sucesso!';

			return response()->json($data);

		}

		public function edit(Request $request)
		{

			$this->formValidate($request);

			$id = $request->id;
			$this->funcionario_model->editaFuncionario($request, $id);

			$data['status']      = 'success';
			$data['type']        = 'refresh';
			$data['clean_form']  = true;
			$data['close_modal'] = true;
			$data['message']     = 'Funcionário editado com sucesso!';

			return response()->json($data);

		}

		public function patch(Request $request)
		{

			$this->funcionario_model->updateColumn($request);

			return response()->json([
				'message' => 'Funcionário atualizado com sucesso!',
			]);

		}

		public function delete(Request $request)
		{

			$this->funcionario_model->from('tb_funcionario')->whereIn('id', $request->id)->delete();

			$status  = 'success';
			$message = 'Funcionário removido com sucesso!';
			$type    = 'refresh';

			return json_encode(['status' => $status, 'message' => $message, 'type' => $type], 200);

		}

	}

}
