<?php

namespace App\Http\Controllers\Main{

	use App\Http\Requests\Main\PacienteRequest;
	use App\Mail\ContactMail;
	use App\Models\ContatoModel;
	use App\Models\PacienteModel;
	use Illuminate\Http\Request;
	use Illuminate\Support\Facades\Mail;

	// use Illuminate\Support\Facades\Blade;

	class HomeController extends Controller
	{

		public function index()
		{

			return view('main.home.index');

		}

		public function contato()
		{

			return view('main.home.contato');
			// return view('main.mails.contact_mail');

		}

		public function validateForm(Request $request)
		{

			return $request->validate([
				'nome'                 => 'required',
				'email'                => [
					'required',
					'regex:/(\w(\.?(\w)))+\@((\w)+\.(\w)+)+/i',
				],
				'telefone'             => [
					'required',
					'regex:/\([\d]{2}\)\s([\d]{1}\s)?[\d]{4}\.[\d]{4}/i',
				],
				'assunto'              => 'required',
				'mensagem'             => 'required',
				'g-recaptcha-response' => 'required|recaptchav3:send_mail,0.5',
			]);

		}

		public function send_mail(Request $request)
		{

			$this->validateForm($request);

			$this->contato_model = new ContatoModel();
			Mail::to('atendimento@medicus24h.com.br')->send(new ContactMail($request));
			// Mail::to('alissonguedes87@gmail.com')->send(new ContactMail($request));

			return response()->json([
				'status'     => 'success',
				'type'       => 'redirect',
				'url'        => route('main.contact'),
				'message'    => 'Contato enviado com sucesso',
				'clean_form' => true,
				'reset_form' => true,
			]);

		}

		public function get_consulta_cadastro_paciente()
		{

			return response(view('main.home.consulta_paciente'), 200);

		}

		public function post_consulta_cadastro_paciente(PacienteRequest $request, PacienteModel $paciente)
		{

			$status  = null;
			$message = null;

			$cadastro = $paciente->getCadastro($request->matricula);

			// 918498994737515
			if (isset($cadastro)) {

				if ($cadastro->status === '1') {

					$message = [
						'status'  => 'success',
						'title'   => 'Paciente Ativo',
						'message' => 'O paciente é apto para consultas e/ou procedimentos médicos.',
					];

				} else {

					$message = [
						'status'  => 'error',
						'title'   => 'Paciente Inativo',
						'message' => 'O paciente não é apto para consultas e/ou procedimentos médicos.',
					];

				}

			} else {

				$message = [
					'status'  => 'error',
					'title'   => 'Paciente Não Encontrado',
					'message' => 'Número de matrícula inválido ou o paciente não é um associado!',
				];

			}

			return redirect()
				->route('main.cadastro.paciente')
				->with($message);

		}

	}

}
