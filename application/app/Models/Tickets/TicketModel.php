<?php

namespace App\Models\Tickets;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class TicketModel extends Model
{

	use HasFactory;

	protected $table = 'tb_ticket';
	protected $order = [];

	protected $datamap = [
		'department' => 'dept_id',
		'sla'        => 'sla_id',
		'topic'      => 'topic_id',
	];

	private $path = 'assets/clinica/img/tickets/';

	public function getTickets($data = null, $id = null, $status = 'open')
	{

		$query_status = $this->select('state')
			->from('tb_ticket_status')
			->whereColumn('id', 'status_id')->toSql();

		$get = $this->select(
			'ticket_id AS id',
			'number',
			'dept_id',
			DB::raw('(SELECT subject FROM tb_ticket__cdata WHERE tb_ticket__cdata.ticket_id = tb_ticket.ticket_id) AS subject'),
			DB::raw('(SELECT name FROM tb_department WHERE tb_department.id = tb_ticket.dept_id) AS department'),
			DB::raw('(DATE_FORMAT(created, "%d/%m/%Y, %H:%i:%s")) AS created'),
			DB::raw('(DATE_FORMAT(updated, "%d/%m/%Y, %H:%i:%s")) AS updated'),
			DB::raw('(DATE_FORMAT(lastupdate, "%d/%m/%Y, %H:%i:%s")) AS lastupdate'),
			DB::raw('(
				SELECT priority_desc FROM tb_ticket_priority WHERE
				tb_ticket_priority.priority_id = (
						SELECT priority FROM tb_ticket__cdata
							WHERE tb_ticket__cdata.priority = tb_ticket_priority.priority_id
							AND ticket_id = tb_ticket.ticket_id
				)) AS priority'),
			DB::raw('(
				SELECT priority_color FROM tb_ticket_priority WHERE
				tb_ticket_priority.priority_id = (
						SELECT priority FROM tb_ticket__cdata
							WHERE tb_ticket__cdata.priority = tb_ticket_priority.priority_id
							AND ticket_id = tb_ticket.ticket_id
				)) AS priority_color'),
			DB::raw('(' . $query_status . ') AS status')
		);

		if (!is_null($id)) {
			return $get->where(function ($query) use ($id) {
				$query->where('ticket_id', $id)
					->orWhere('number', $id);
			})
				->get()
				->first();
		}

		$get->where('status_id', function ($query) use ($status) {
			$query->select('id')
				->from('tb_ticket_status')
				->whereColumn('tb_ticket_status.id', 'tb_ticket.status_id')
				->where('state', $status);
		});

		if (isset($data->order)) {
			$this->order = [
				null,
				DB::raw('(
				SELECT priority_desc FROM tb_ticket_priority WHERE
				tb_ticket_priority.priority_id = (
						SELECT priority FROM tb_ticket__cdata
							WHERE tb_ticket__cdata.priority = tb_ticket_priority.priority_id
							AND ticket_id = tb_ticket.ticket_id
				))'),
				DB::raw('(SELECT subject FROM tb_ticket__cdata WHERE tb_ticket__cdata.ticket_id = tb_ticket.ticket_id)'),
				DB::raw('(SELECT name FROM tb_department WHERE tb_department.id = tb_ticket.dept_id)'),
				DB::raw('(DATE_FORMAT(lastupdate, "%h:%i %d/%m/%Y"))'),
				DB::raw('(' . $query_status . ')'),
				// 'ticket_id',
				// 'number',
				// DB::raw('(
				// SELECT priority_desc FROM tb_ticket_priority WHERE
				// tb_ticket_priority.priority_id = (
				// 		SELECT priority FROM tb_ticket__cdata
				// 			WHERE tb_ticket__cdata.priority = tb_ticket_priority.priority_id
				// 			AND ticket_id = tb_ticket.ticket_id
				// ))'),
				// DB::raw('(
				// SELECT priority_color FROM tb_ticket_priority WHERE
				// tb_ticket_priority.priority_id = (
				// 		SELECT priority FROM tb_ticket__cdata
				// 			WHERE tb_ticket__cdata.priority = tb_ticket_priority.priority_id
				// 			AND ticket_id = tb_ticket.ticket_id
				// ))'),
			];
			$get = $get->orderBy($this->order[$data->order], $data->direction);
		}

		return $get->paginate();

	}

	public function getTicketContent($data = null, $id)
	{

		$get = $this->select(
			'id',
			'body',
			'created',
			'user_id'
		)
			->from('tb_thread_entry')
			->where('thread_id', function ($query) use ($id) {
				$query->select('id')
					->from('tb_thread')
					->whereColumn('thread_id', 'id')
					->where('object_id', function ($query) use ($id) {
						$query->select('ticket_id')
							->from('tb_ticket')
							->whereColumn('object_id', 'ticket_id')
							->where(function ($query) use ($id) {
								$query->where('ticket_id', $id)
									->orWhere('number', $id);
							});
					})
					->where('object_type', 'T');
			})
		// ->orderBy('id', 'desc')
			->limit(10)
			->get();

		return $get;

	}

	public function getTicketDraft($dept_id, $number = null, $user_id = 0, $crated = '0000-00-00 00:00:00')
	{

		if ($user_id == 0) {
			$user_id = Session::get('userdata')[Session::get('app_session')]['id'];
		}

		$get = $this->select('ticket_id')
			->where('dept_id', $dept_id)
			->where('number', $number)
			->where('user_id', $user_id)
			->where('created', $crated)
			->first();

		return $get->ticket_id ?? null;

	}

	public function ticketIsBlocked($id)
	{

	}

	private function ticketNumberGenerate($begin = 100000, $end = 999999)
	{
		return rand($begin, $end);
	}

	public static function isTicketNumberUnique($number)
	{
		$num = TicketModel::select('number')
			->where('number', $number)
			->first();

		return ($num === 0);
	}

	public static function getTicketStatus($status)
	{
		$status = TicketModel::select('id')
			->from('tb_ticket_status')
			->where('state', $status)
			->first();

		return $status->id;

	}

	/**
	 * Método para ordenar as colunas da tabela
	 * @param $input <array>
	 */
	private function sanitize(array $input = array())
	{

		if (!isset($input['number'])) {

			do {

				$input['number'] = $this->TicketNumberGenerate();

			} while (self::isTicketNumberUnique($input['number']));

		}

		$input['lastupdate'] = date('Y-m-d H:i:s');
		$input['sla_id']     = isset($input['sla']) ? $input['sla'] : 1;
		$input['user_id']    = Session::get('userdata')[Session::get('app_session')]['id'];
		$input['source']     = 'Web';

		return $this->fields($input);

	}

	public function create(array $input = array())
	{

		$input['created']   = date('Y-m-d H:i:s');
		$input['updated']   = date('Y-m-d H:i:s');
		$input['status_id'] = self::getTicketStatus('draft');
		$data               = $this->sanitize($input);

		$id = $this->insertGetId($data);

		// Inserir o cabeçalho do ticket na tabela `tb_thread`
		$where   = ['object_id' => $id];
		$content = [
			'object_id'   => $id,
			'object_type' => 'T',
			'lastmessage' => date('Y-m-d H:i:s'),
			'created'     => $input['created'],
		];

		$this->from('tb_thread')
			->updateOrInsert($where, $content);

		return $this->select('number')->where('ticket_id', $id)->first()->number;

	}

	public function edit(array $input = array())
	{

		$id                 = $input['id'];
		$input['updated']   = date('Y-m-d H:i:s');
		$input['status_id'] = self::getTicketStatus('open');
		$input['user_id']   = $input['user'];
		$input['user']      = Session::get('userdata')[Session::get('app_session')]['nome'];

		// Inserir o título e prioridade do ticket na tabela `tb_ticket__cdata`
		$this->addTicketSubject($id, $input);

		// Inserir o conteúdo do ticket na tabela `tb_thread_entry`
		$this->addTicketResponse($id, $input);

		// Para finalizar, altera as informações na tablea `tb_ticket`

		// Remover campos que não pertencem à tabela `tb_ticket`
		unset($input['id'], $input['subject'], $input['body'], $input['user']);

		$data = $this->sanitize($input);

		$this->where('ticket_id', $id)
			->update($data);

		return $id;

	}

	public function addTicketSubject($id, array $input = array())
	{

		$priority = $input['priority'] ?? null;
		$subject  = $input['subject'];

		$content = [
			'subject'  => $subject,
			'priority' => $priority,
		];

		$where = ['ticket_id' => $id];

		$this->from('tb_ticket__cdata')
			->updateOrInsert($where, $content);
	}

	public function addTicketResponse($id, array $input = array())
	{

		$user_id = $input['user_id'];
		$user    = $input['user'];
		$body    = $input['body'];

		$input['created']   = date('Y-m-d H:i:s');
		$input['status_id'] = self::getTicketStatus('draft');
		$data               = $this->sanitize($input);

		// Inserir o conteúdo do ticket na tabela `tb_thread_entry`
		$thread_id = $this->select('id')
			->from('tb_thread')
			->where('object_id', $id)
			->where('object_type', 'T')
			->first()->id;

		$content = [
			'thread_id'  => $thread_id,
			'user_id'    => $user_id,
			'poster'     => $user,
			'ip_address' => '',
			'created'    => date('Y-m-d H:i:s'),
			'updated'    => '0000-00-00 00:00:00',
			'body'       => $body,
			'type'       => 'M',
		];

		$where = ['thread_id' => $thread_id];

		$this->from('tb_thread_entry')
			->updateOrInsert($where, $content);

	}

	public function remove()
	{

	}

}
