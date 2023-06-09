<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\DB;

class HomecareModel extends Model
{

	use HasFactory;

	protected $table = 'tb_paciente AS P';
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
		'data_obito'   => 'datahora_obito'];

	private $path = 'assets/clinica/img/pacientes/';

	public function __construct()
	{

	}

	public function getPacientes($data = null)
	{

		$get = $this->select(
			'P.id', 'P.nome', 'P.codigo', 'P.imagem', 'P.associado', 'P.id_estado_civil', 'P.id_etnia',
			'P.sexo', 'P.data_nascimento', 'P.cpf', 'P.rg', 'P.cns', 'P.mae', 'P.pai', 'P.notas_gerais',
			'P.notas_alergias', 'P.notas_clinicas', 'P.logradouro', 'P.numero', 'P.complemento', 'P.cidade',
			'P.bairro', 'P.cep', 'P.uf', 'P.pais', 'P.email', 'P.telefone', 'P.celular', 'P.receber_notificacoes',
			'P.receber_email', 'P.receber_sms', 'P.obito', 'P.status',
			'P.matricula', 'P.id_tipo_convenio AS convenio', 'P.id_acomodacao AS acomodacao', 'P.validade',
			DB::raw('DATE_FORMAT(P.datahora_obito, "%d/%m/%Y") AS data_obito'),
			DB::raw('DATE_FORMAT(P.datahora_obito, "%H:%i") AS hora_obito'),
			DB::raw('(SELECT descricao FROM tb_etnia WHERE id = id_etnia) AS etnia'),
			DB::raw('DATE_FORMAT(data_nascimento, "%d/%m/%Y") AS data_nascimento'),
		);

		if (isset($data) && $search = $data['query']) {
			$get->where(function ($query) use ($search) {
				$query
					->orWhere('codigo', 'like', $search . '%')
					->orWhere('nome', 'like', $search . '%')
					->orWhere('matricula', 'like', $search . '%')
					->orWhere('rg', 'like', $search . '%')
					->orWhere('email', 'like', $search . '%')
					->orWhere('cpf', 'like', $search . '%')
					->orWhere('cns', 'like', $search . '%')
					->orWhere('telefone', 'like', $search . '%')
					->orWhere('celular', 'like', $search . '%');
			});
		}

		$get->join('tb_paciente_homecare', 'P.id', 'tb_paciente_homecare.id_paciente');

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
			DB::raw('(SELECT nome FROM tb_paciente WHERE id = id_paciente) AS paciente'),
			DB::raw('(SELECT descricao FROM tb_convenio WHERE id = id_convenio) AS convenio'),
			DB::raw('(SELECT descricao FROM tb_convenio WHERE id = id_tipo) AS tipo'),
			DB::raw('(SELECT descricao FROM tb_acomodacao WHERE id = id_acomodacao) AS acomodacao'),
			'matricula',
			'validade_mes',
			'validade_ano'
		)->from('tb_paciente_convenio');

		$get = $get->where('id_paciente', $id_paciente)
			->where('status', '1');

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

		$input['validade'] = null;

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

		return $this->fields($input);

	}

	public function create(array $input = array())
	{

		$input = $this->sanitize($input);

		dump($input);

		return $this->insert($input);

	}

	public function edit(array $input = array())
	{

		$id = $input['id'];

		$input = $this->sanitize($input);

		if (isset($input['convenios'])) {
			$convenios = $input['convenios'];
			unset($input['convenios']);
		}

		$this->where('id', $id)
			->update($input);

		if (isset($convenios)) {

			foreach ($convenios as $convenio) {
				$c                = json_decode($convenio, true);
				$c['id_paciente'] = $id;
				$this->from('tb_paciente_convenio')
					->insert($c);
			}

		}

		return $id;

	}

	public function remove()
	{

	}

}
