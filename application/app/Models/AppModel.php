<?php

namespace App\Models;

// use App\Models\FuncionarioModel;
// use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

// use Illuminate\Http\Request;
// use Illuminate\Support\Facades\DB;

class AppModel extends Model
{

	protected $error   = [];
	protected $message = [];

	public function getErros()
	{
		return implode('<br>', $this->error);
	}

	public function getMessage()
	{
		return implode('<br>', $this->message);
	}

}
