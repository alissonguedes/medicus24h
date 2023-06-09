<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\DB;

class PacienteModel extends Model
{

	use HasFactory;

	protected $table = 'tb_paciente';
	protected $order = [
		null,
		'nome',
		'telefone',
		'codigo',
		'data_nascimento',
		'convenio',
		'status',
		'status',
	];

	protected $datamap = [
		'convenio'     => 'id_convenio',
		'estado_civil' => 'id_estado_civil',
		'etnia'        => 'id_etnia',
		'notas'        => 'observacoes',
		'data_obito'   => 'datahora_obito',
	];

	private $path = 'assets/clinica/img/pacientes/';

	public function __construct()
	{

	}

	public function getPacientes($data = null)
	{

		$get = $this->select(
			'id', 'nome', 'codigo', 'imagem', 'associado', 'id_estado_civil', 'id_etnia',
			'sexo', 'data_nascimento', 'cpf', 'rg', 'cns', 'mae', 'pai', 'notas_gerais',
			'notas_alergias', 'notas_clinicas', 'logradouro', 'numero', 'complemento', 'cidade',
			'bairro', 'cep', 'uf', 'pais', 'email', 'telefone', 'celular', 'receber_notificacoes',
			'receber_email', 'receber_sms', 'obito', 'status',
			'matricula', 'id_tipo_convenio', 'id_acomodacao', 'validade',
			DB::raw('(SELECT descricao FROM tb_convenio WHERE id = id_convenio) AS convenio'),
			DB::raw('(SELECT descricao FROM tb_convenio_planos WHERE id = id_tipo_convenio) AS tipo_plano'),
			DB::raw('(SELECT descricao FROM tb_acomodacao WHERE id = id_acomodacao) AS acomodacao'),
			DB::raw('DATE_FORMAT(datahora_obito, "%d/%m/%Y") AS data_obito'),
			DB::raw('DATE_FORMAT(datahora_obito, "%H:%i") AS hora_obito'),
			DB::raw('(SELECT descricao FROM tb_etnia WHERE id = id_etnia) AS etnia'),
			DB::raw('DATE_FORMAT(data_nascimento, "%d/%m/%Y") AS data_nascimento'),
		);

		if (isset($data) && $search = $data['query']) {
			$get->where(function ($query) use ($search) {
				$query
					->orWhere(DB::raw('REGEXP_REPLACE(codigo, "[^\\x20-\\x7E]", "")'), 'like', limpa_string($search, '') . '%')
					->orWhere('nome', 'like', $search . '%')
					->orWhere(DB::raw('REGEXP_REPLACE(matricula, "[^\\x20-\\x7E]", "")'), 'like', limpa_string($search, '') . '%')
					->orWhere(DB::raw('REGEXP_REPLACE(rg, "[^\\x20-\\x7E]", "")'), 'like', limpa_string($search, '') . '%')
					->orWhere('email', 'like', $search . '%')
					->orWhere(DB::raw('REGEXP_REPLACE(cpf, "[^\\x20-\\x7E]", "")'), 'like', limpa_string($search, '') . '%')
					->orWhere(DB::raw('REGEXP_REPLACE(cns, "[^\\x20-\\x7E]", "")'), 'like', limpa_string($search, '') . '%')
					->orWhere(DB::raw('REGEXP_REPLACE(telefone, "[^\\x20-\\x7E]", "")'), 'like', limpa_string($search, '') . '%')
					->orWhere(DB::raw('REGEXP_REPLACE(celular, "[^\\x20-\\x7E]", "")'), 'like', limpa_string($search, '') . '%');
			});
		}

		if (isset($data['status'])) {
			$get->where('status', $data['status']);
		}

		if (isset($data['obito'])) {
			$get->where('obito', $data['obito']);
		}

		// Order By
		if (isset($_GET['order']) && $_GET['order'][0]['column'] != 0) {
			$get->orderBy($this->order[$_GET['order'][0]['column']], $_GET['order'][0]['dir']);
		} else {
			$get->orderBy($this->order[1], 'asc');
		}

		return $get->paginate(isset($_GET['length']) ? $_GET['length'] : 50);

	}

	public function getPacienteById($id)
	{

		return $this->getPacientes()
			->where('id', $id)
			->first();

	}

	/**
	 * Retorna informações do paciente consultado no site para validar se existe e está ativo no sistema
	 */
	public function getCadastro($matricula)
	{

		$get = $this->select('id', 'status', 'associado')
			->from('tb_paciente')
			->where(DB::raw('REGEXP_REPLACE(matricula, "[^\\x20-\\x7E]", "")'), limpa_string($matricula, ''))
		// ->where('status', '1')
			->where('obito', '0')
			->where('associado', 'yes')
			->get()
			->first();

		return $get;

	}

	public function isBlocked($id)
	{

		return $this->getPacientes()
			->where('id', $id)
			->where('status', '0')
			->first() ? true : false;

	}

	public function getEtnia()
	{
		return $this->select('id', 'descricao')
			->from('tb_etnia')
		// ->orderBy('descricao')
			->get();
	}

	public function getConvenios($id = null, $id_paciente = null)
	{

		$get = $this->select(
			'id',
			'id_convenio', 'id_tipo', 'id_acomodacao',
			DB::raw('(SELECT descricao FROM tb_convenio WHERE id = id_convenio) AS convenio'),
			DB::raw('(SELECT descricao FROM tb_convenio_planos WHERE tb_convenio_planos.id = id_tipo) AS tipo'),
			DB::raw('(SELECT descricao FROM tb_acomodacao WHERE id = id_acomodacao) AS acomodacao'),
			'matricula',
			'validade_mes',
			'validade_ano'
		)->from('tb_paciente_convenio');

		$get = $get->where('id_paciente', $id_paciente);
		// ->where('status', '1');

		if (!is_null($id)) {
			return $get->where('id', $id)
				->get()
				->first();
		}

		return $get->get();

	}

	/**
	 * Método para ordenar as colunas da tabela
	 * @param $input <array>
	 */
	private function sanitize(array $input = array())
	{

		$input['data_nascimento'] = !empty($input['data_nascimento']) ? date('Y-m-d', strtotime(str_replace('/', '-', $input['data_nascimento']))) : null;
		$input['validade']        = null;

		if (!isset($input['status'])) {
			$input['status'] = '0';
		}

		if (!isset($input['obito'])) {
			$input['obito']          = '0';
			$input['datahora_obito'] = null;
		} else {
			$data_obito              = $input['data_obito'];
			$hora_obito              = $input['hora_obito'];
			$data_obito              = str_replace('/', '-', $data_obito);
			$input['datahora_obito'] = date('Y-m-d', strtotime($data_obito)) . ' ' . $hora_obito;
			unset($input['data_obito']);
			unset($input['hora_obito']);
		}

		if (!isset($input['associado'])) {
			$input['associado'] = 'no';
		} else {

			if ($input['associado'] === 'yes') {

				$validade          = $input['validade_ano'] . '-' . $input['validade_mes'];
				$input['validade'] = $validade;

			}

		}

		unset($input['validade_mes']);
		unset($input['validade_ano']);

		if (request()->method() == 'PUT') {
			unset($input['matricula']);
			unset($input['codigo']);
		}

		if (isset($input['convenios'])) {
			unset($input['convenios']);
		}

		return $this->fields($input);

	}

	public function create(array $input = array())
	{

		$data              = $this->sanitize($input);
		$data['matricula'] = $input['matricula'] ?? session()->put('matricula', gera_cartao(null, true));
		// 'P-' . rand(111111, 999999);

		$id = $this->insertGetId($data);

		if (isset($input['convenios'])) {
			$this->insertConvenios($input['convenios'], $id);
		}

		return $id;

	}

	private function insertConvenios(array $convenios = array(), $id_paciente)
	{

		if (is_array($convenios)) {

			foreach ($convenios as $convenio) {

				$c                = json_decode($convenio, true);
				$c['id_paciente'] = $id_paciente;

				$issetConvenio = $this->from('tb_paciente_convenio')
					->where('id_paciente', $id_paciente)
					->where('id_convenio', $c['id_convenio'])
					->first();

				if (!isset($issetConvenio)) {
					$this->from('tb_paciente_convenio')
						->insert($c);
				}

			}

		}

	}

	public function edit(array $input = array())
	{

		$id = $input['id'];

		$data              = $this->sanitize($input);
		$data['matricula'] = $input['matricula']; //

		$this->where('id', $id)
			->update($data);

		if (isset($input['convenios'])) {
			$this->insertConvenios($input['convenios'], $id);
		}

		return $id;

	}

	public function remove()
	{

	}

	public function uploadImage(Request $image)
	{
		$imagem = null;

		if ($image->file('imagem')) {
			$file     = $image->imagem;
			$fileName = sha1($file->getClientOriginalName());
			$fileExt  = $file->getClientOriginalExtension();
			$imgName  = explode('.', $file->getClientOriginalName());
			$origName = limpa_string($imgName[count($imgName) - 2], '-') . '.' . $fileExt;
			$imagem   = limpa_string($fileName) . '.' . $fileExt;
			$file->storeAs($this->path, $imagem);
			$imagem = $this->path . $imagem;
		}

		return $imagem;

	}

}
