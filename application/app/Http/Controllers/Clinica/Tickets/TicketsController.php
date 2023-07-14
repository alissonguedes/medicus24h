<?php

namespace App\Http\Controllers\Clinica\Tickets;

use App\Http\Controllers\OSTicket\HomeController as Controller;
use App\Models\Tickets\DepartmentModel;
use Illuminate\Http\Request;

class TicketsController extends Controller
{

	public function getDepartments(Request $request, DepartmentModel $ticket)
	{

		if (!$request->ajax()) {
			return redirect()->route('core.tickets.index');
		}

		// switch ($tipo) {
		// 	case 'categorias':
		// 		$dados = $this->atendimento_model->getCategorias();
		// 		break;
		// 	case 'tipos':
		// 		$dados = $this->atendimento_model->getTipos();
		// 		break;
		// }

		$complete = [];

		if ($ticket->getDepartments()->count() > 0) {
			foreach ($ticket->getDepartments() as $row) {
				$complete['items'][] = [
					'id'   => $row->id,
					'text' => $row->name,
				];
			}
		} else {
			$complete['items'][] = ['id' => null, 'text' => 'Nenhum registro encontrado.'];
		}

		return response($complete, 200);

	}

}
