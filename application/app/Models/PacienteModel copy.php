<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
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
		null,
		null,
	];

	public function getPacientes($menu = null)
	{

		$get = $this->select(
			'id',
			'nome',
			'telefone',
			'celular',
			'codigo',
			DB::raw('DATE_FORMAT(data_nascimento, "%d/%m/%Y") AS data_nascimento'),
		);

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
		// Order By
		if (isset($_GET['order']) && $_GET['order'][0]['column'] != 0) {
			$get->orderBy($this->order[$_GET['order'][0]['column']], $_GET['order'][0]['dir']);
		} else {
			$get->orderBy($this->order[1], 'asc');
		}

		return $get;

	}

	public function getPacienteById($id = null)
	{
		return $this->getPacientes()
			->where('id', $id)
			->first();
	}

	public function cadastraPaciente($post)
	{

		$nome                 = $post->nome;
		$cpf                  = $post->cpf;
		$rg                   = $post->rg;
		$sexo                 = $post->sexo;
		$data_nascimento      = convert_to_date($post->data_nascimento, 'd/m/Y', 'Y-m-d');
		$sus                  = $post->sus;
		$mae                  = $post->mae;
		$pai                  = $post->pai;
		$notas                = $post->notas;
		$logradouro           = $post->logradouro;
		$complemento          = $post->complemento;
		$numero               = $post->numero;
		$cidade               = $post->cidade;
		$bairro               = $post->bairro;
		$cep                  = $post->cep;
		$uf                   = $post->uf;
		$pais                 = $post->pais;
		$email                = $post->email;
		$telefone             = $post->telefone;
		$celular              = $post->celular;
		$receber_notificacoes = $post->receber_notificacoes ?? 'off';
		$receber_email        = $post->receber_email ?? 'off';
		$receber_sms          = $post->receber_sms ?? 'off';
		$obito                = $post->obito ?? '0';
		$status               = $post->status ?? '1';

		$data = [
			'codigo'               => 'P-' . rand(111111, 999999),
			'nome'                 => $nome,
			'cpf'                  => $cpf,
			'rg'                   => $rg,
			'sus'                  => $sus,
			'data_nascimento'      => $data_nascimento,
			'mae'                  => $mae,
			'pai'                  => $pai,
			'notas'                => $notas,
			'logradouro'           => $logradouro,
			'numero'               => $numero,
			'complemento'          => $complemento,
			'cidade'               => $cidade,
			'bairro'               => $bairro,
			'cep'                  => $cep,
			'uf'                   => $uf,
			'pais'                 => $pais,
			'email'                => $email,
			'telefone'             => $telefone,
			'celular'              => $celular,
			'receber_notificacoes' => $receber_notificacoes,
			'receber_email'        => $receber_email,
			'receber_sms'          => $receber_sms,
			'obito'                => $obito,
			'status'               => $status,
		];

		$id = $this->from('tb_paciente')
			->insertGetId($data);

		return $id;

	}

}
