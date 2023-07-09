<?php

namespace App\Http\Controllers\Core;

use App\Http\Controllers\Main\ApiController as MainController;

class ApiController extends MainController
{

	public function check_mail()
	{

		$data = [
			'url'         => route('clinica.tickets.index'),
			'message'     => 'Hey! Existem mensagens pendentes na caixa de entrada!',
			'mail_exists' => true,
		];

		return $data;

	}

	public function include_js_app()
	{

		return response()->json([]);
	}

}
