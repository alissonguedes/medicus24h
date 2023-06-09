<?php

namespace App\Http\Controllers\Clinica{

	use App\Models\ConvenioModel;
	use App\Models\EstadoCivilModel;
	use App\Models\HomecareModel;
	use Illuminate\Http\Request;
	use Illuminate\Validation\Rule;

	class HomeCareController extends Controller
	{

		public function __construct()
		{

			$this->convenio_model    = new ConvenioModel();
			$this->paciente_model    = new HomecareModel();
			$this->estadoCivil_model = new EstadoCivilModel();

		}

		public function index(Request $request)
		{

			// Pesquisar pacientes
			if ($request->ajax()) {
				$dados['pacientes'] = $this->paciente_model->getPacientes($request);
				return response(view('clinica.homecare.results', $dados), 200);
			}

			$dados['pacientes'] = $this->paciente_model->getPacientes($request);
			return response(view('clinica.homecare.index', $dados), 200);

		}

		public function form(Request $request, $id = null)
		{

			$dados['row']          = $this->paciente_model->getPacienteById($request->id);
			$dados['acomodacoes']  = $this->paciente_model->getAcomodacao();
			$dados['etnias']       = $this->paciente_model->getEtnia();
			$dados['convenios']    = $this->convenio_model->getConvenio();
			$dados['estado_civil'] = $this->estadoCivil_model->getEstadoCivil();
			return view('clinica.homecare.form', $dados);

		}

		public function get(Request $request, $id)
		{

			$result = $this->paciente_model->getPacienteById($id);

			$paciente['mae']             = $result->mae;
			$paciente['pai']             = $result->pai;
			$paciente['data_nascimento'] = $result->data_nascimento;
			$paciente['cpf']             = $result->cpf;
			$paciente['telefone']        = $result->telefone;
			$paciente['convenio']        = $result->convenio;
			$paciente['matricula']       = $result->matricula_convenio;
			$paciente['validade']        = $result->validade_convenio;
			$paciente['observacao']      = $result->notas;
			$paciente['enviar_email']    = $result->enviar_email;

			return $paciente;

		}

		public function autocomplete(Request $request)
		{

			$dados = $this->paciente_model->getPacientes($request);

			$complete = [];

			if ($dados->count() > 0) {
				foreach ($dados as $row) {
					$complete['items'][] = [
						'id'   => $row->id,
						'text' => $row->nome,
					];
				}
			} else {
				$complete['items'][] = ['id' => null, 'text' => 'Nenhum registro encontrado.'];
			}

			return response($complete, 200);

		}

		public function agendar(Request $request, $id = null)
		{

			if ($this->paciente_model->isBlocked($request->id)) {

				$status  = 'warn';
				$title   = 'Paciente inativo!';
				$message = 'Não é possível realizar o agendamento.';

				return response()->json(['status' => $status, 'title' => $title, 'message' => $message]);

			}

			$dados['row']          = null;
			$dados['paciente']     = $this->paciente_model->getPacienteById($request->id);
			$dados['acomodacoes']  = $this->paciente_model->getAcomodacao();
			$dados['etnias']       = $this->paciente_model->getEtnia();
			$dados['convenios']    = $this->convenio_model->getConvenio();
			$dados['estado_civil'] = $this->estadoCivil_model->getEstadoCivil();
			return view('clinica.agendamentos.form', $dados);

		}

		public function create(Request $request)
		{

			$request->validate([
				'nome'       => 'required',
				'telefone'   => 'required_if:celular,null',
				'celular'    => 'required_if:telefone,null',
				'email'      => 'email|required_if:receber_notificacoes,on',
				'data_obito' => 'required_if:obito,true',
				'hora_obito' => Rule::requiredIf($request->obito == 1 || $request->data_obito),
			]);

			$id = $this->paciente_model->cadastraPaciente($request);

			$status = 'success';
			$url    = url()->route('clinica.homecare.edit', $id);
			$type   = 'redirect';

			return response()->json([
				'status'      => $status,
				'message'     => 'Paciente cadastrado com sucesso!',
				'clean_form'  => true,
				'close_modal' => false,
				'type'        => $type,
				'url'         => $url,
			]);
		}

		public function edit(Request $request)
		{

			$request->validate([
				'nome'       => 'required',
				'email'      => 'nullable|email|required_if:receber_notificacoes,on',
				'data_obito' => 'required_if:obito,1',
				'hora_obito' => Rule::requiredIf($request->obito == 1 || $request->data_obito),
			]);

			$id = $request->id;
			$this->paciente_model->editaPaciente($request, $id);

			$status = 'success';
			$url    = url()->route('clinica.homecare.index');
			$type   = 'redirect';

			if (request()->ajax()) {

				return response()->json([
					'status'      => $status,
					'message'     => 'Dados atualizados com sucesso!',
					'clean_form'  => true,
					'close_modal' => false,
					'type'        => $type,
					'url'         => $url,
				]);
			} else {
				return redirect($url)
					->with([
						'status'  => 'success',
						'message' => 'Dados atualizados com sucesso',
					]);
			}

		}

		public function patch(Request $request)
		{

			$this->paciente_model->from('tb_paciente')
				->whereIn('id', $request->id)
				->update([$request->field => $request->value]);

			return response()->json([
				'message' => 'Paciente atualizado com sucesso!',
			]);

		}

		public function delete(Request $request)
		{

			$this->paciente_model->from('tb_paciente')->whereIn('id', $request->id)->delete();

			$status  = 'success';
			$message = 'Paciente removido com sucesso!';
			$url     = url()->route('clinica.homecare.index');
			$type    = 'send';

			return json_encode(['status' => $status, 'message' => $message, 'type' => $type, 'url' => $url], 200);

		}

	}

}
