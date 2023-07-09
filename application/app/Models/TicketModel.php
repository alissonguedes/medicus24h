<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\DB;

class TicketModel extends Model
{

	use HasFactory;

	protected $table = 'ost_medicus_ticket';
	protected $order = [];

	protected $datamap = [];

	private $path = 'assets/clinica/img/tickets/';

	public function __construct()
	{

		$this->connection = env('TICKETS');

	}

	public function getTickets($data = null, $status = 'open')
	{

		$get = $this->select(
			'ticket_id AS id',
			'number',
			DB::raw('(SELECT subject FROM ost_medicus_ticket__cdata WHERE ost_medicus_ticket__cdata.ticket_id = ost_medicus_ticket.ticket_id) AS subject'),
			DB::raw('(SELECT name FROM ost_medicus_department WHERE ost_medicus_department.id = ost_medicus_ticket.dept_id) AS department'),
			DB::raw('(DATE_FORMAT(lastupdate, "%h:%i %d/%m/%Y")) AS lastupdate'),
			DB::raw('(
				SELECT priority_desc FROM ost_medicus_ticket_priority WHERE
				ost_medicus_ticket_priority.priority_id = (
						SELECT priority FROM ost_medicus_ticket__cdata
							WHERE ost_medicus_ticket__cdata.priority = ost_medicus_ticket_priority.priority_id
							AND ticket_id = ost_medicus_ticket.ticket_id
				)) AS priority'),
			DB::raw('(
				SELECT priority_color FROM ost_medicus_ticket_priority WHERE
				ost_medicus_ticket_priority.priority_id = (
						SELECT priority FROM ost_medicus_ticket__cdata
							WHERE ost_medicus_ticket__cdata.priority = ost_medicus_ticket_priority.priority_id
							AND ticket_id = ost_medicus_ticket.ticket_id
				)) AS priority_color')
		);

		if (isset($data->order)) {
			$this->order = [
				'ticket_id',
				'number',
				DB::raw('(SELECT subject FROM ost_medicus_ticket__cdata WHERE ost_medicus_ticket__cdata.ticket_id = ost_medicus_ticket.ticket_id)'),
				DB::raw('(SELECT name FROM ost_medicus_department WHERE ost_medicus_department.id = ost_medicus_ticket.dept_id)'),
				DB::raw('(DATE_FORMAT(lastupdate, "%h:%i %d/%m/%Y")) AS lastupdate'),
				DB::raw('(
				SELECT priority_desc FROM ost_medicus_ticket_priority WHERE
				ost_medicus_ticket_priority.priority_id = (
						SELECT priority FROM ost_medicus_ticket__cdata
							WHERE ost_medicus_ticket__cdata.priority = ost_medicus_ticket_priority.priority_id
							AND ticket_id = ost_medicus_ticket.ticket_id
				))'),
				DB::raw('(
				SELECT priority_color FROM ost_medicus_ticket_priority WHERE
				ost_medicus_ticket_priority.priority_id = (
						SELECT priority FROM ost_medicus_ticket__cdata
							WHERE ost_medicus_ticket__cdata.priority = ost_medicus_ticket_priority.priority_id
							AND ticket_id = ost_medicus_ticket.ticket_id
				))'),
			];
			$get = $get->orderBy($this->order[$data->order], $data->direction);
		}

		return $get->paginate();

	}

	public function isBlocked($id)
	{

	}

	/**
	 * Método para ordenar as colunas da tabela
	 * @param $input <array>
	 */
	private function sanitize(array $input = array())
	{

		return $this->fields($input);

	}

	public function create(array $input = array())
	{

		$data = $this->sanitize($input);

		// $id = $this->insertGetId($data);

		return $id;

	}

	public function edit(array $input = array())
	{

		$id = $input['id'];

		$data = $this->sanitize($input);

		$this->where('id', $id)
			->update($data);

		return $id;

	}

	public function remove()
	{

	}

}
