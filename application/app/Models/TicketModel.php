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

	public function getTickets($data = null, $id = null, $status = 'open')
	{

		$query_status = $this->select('state')
			->from('ost_medicus_ticket_status')
			->whereColumn('id', 'status_id')->toSql();

		$get = $this->select(
			'ticket_id AS id',
			'number',
			DB::raw('(SELECT subject FROM ost_medicus_ticket__cdata WHERE ost_medicus_ticket__cdata.ticket_id = ost_medicus_ticket.ticket_id) AS subject'),
			DB::raw('(SELECT name FROM ost_medicus_department WHERE ost_medicus_department.id = ost_medicus_ticket.dept_id) AS department'),
			DB::raw('(DATE_FORMAT(lastupdate, "%d/%m/%Y, %h:%i")) AS lastupdate'),
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
				)) AS priority_color'),
			DB::raw('(' . $query_status . ') AS status')
		);

		if (!is_null($id)) {
			return $get->where(function ($query) use ($id) {
				$query->where('ticket_id', $id)
					->orWhere('number', $id);
			})->get()->first();
		}

		$get->where('status_id', function ($query) use ($status) {
			$query->select('id')
				->from('ost_medicus_ticket_status')
				->whereColumn('ost_medicus_ticket_status.id', 'ost_medicus_ticket.status_id')
				->where('state', $status);
		});

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

	public function getTicketContent($data = null, $id)
	{

		$get = $this->select('id', 'body', 'created')
			->from('ost_medicus_thread_entry')
			->where('thread_id', function ($query) use ($id) {
				$query->select('ticket_id')
					->from('ost_medicus_ticket')
					->whereColumn('thread_id', 'ticket_id')
					->where('number', $id);
			})
			->orderBy('id', 'desc')
			->limit(10)
			->get();

		return $get;

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
