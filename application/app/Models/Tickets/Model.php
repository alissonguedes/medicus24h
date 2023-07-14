<?php

namespace App\Models\Tickets;

use App\Models\Model as ModelCore;

class Model extends ModelCore
{

	public function __construct()
	{

		dd('Teste');

		$this->connection = env('DB_CONNECTION_TICKETS');

	}

}
