<?php

namespace App\Http\Controllers\Core;

use App\Http\Controllers\Controller;
use App\Http\Requests\Core\TicketRequest;
use App\Models\Tickets\TicketModel;
use App\Models\Tickets\TopicModel;
use Illuminate\Http\Request;

class TicketsController extends Controller
{
	/**
	 * Display a listing of the resource.
	 */
	public function index(Request $request, TicketModel $ticket, $status = 'open')
	{

		$dados['paginate'] = $ticket->getTickets($request, null, $status);

		if ($request->ajax()) {

			return view('core.tickets.list', $dados);

		}

		return view('core.tickets.index', $dados);

	}

	/**
	 * Display a listing of the resource.
	 */
	public function form(Request $request, TicketModel $ticket, TopicModel $topic, $id = null)
	{

		if (!is_null($id)) {
			$dados['row'] = $ticket->getTickets(null, $id);
		}

		$dados['topics'] = $topic->getTopics();

		return view('core.tickets.form', $dados);

	}

	/**
	 * Show the form for creating a new resource.
	 */
	public function create(TicketRequest $request, TicketModel $ticket)
	{

		$id = $ticket->edit($request->all());

		if ($id) {
			$data = [
				'status' => 'success',
				'url'    => route('core.tickets.index'),
				'type'   => 'redirect',
			];
		} else {
			$data = [
				'status'  => 'success',
				'message' => 'Houve um erro ao tentar criar o ticket.',
			];
		}

		return response($data);

	}

	public function addResponse(TicketRequest $request, TicketModel $ticket)
	{

		$id = $ticket->addTicketResponse($request->all());

		if ($id) {
			$data = [
				'status' => 'success',
				'url'    => route('core.tickets.edit', $id),
				'type'   => 'redirect',
			];
		} else {
			$data = [
				'status'  => 'success',
				'message' => 'Houve um erro ao tentar criar o ticket.',
			];
		}

		return response($data);

	}

	/**
	 * Store a newly created resource in storage.
	 */
	public function store(TicketRequest $request, TicketModel $ticket)
	{

		$id = $ticket->create($request->all());

		if ($id) {
			$data = [
				'status' => 'success',
				'url'    => route('core.tickets.create', $id),
				'type'   => 'redirect',
			];
		} else {
			$data = [
				'status'  => 'success',
				'message' => 'Houve um erro ao tentar criar o ticket.',
			];
		}

		return response($data);

	}

	/**
	 * Display the specified resource.
	 */
	public function show(Request $request, TicketModel $ticket, $id, $status = 'open')
	{

		$dados['ticket']  = $ticket->getTickets($request, $id);
		$dados['content'] = $ticket->getTicketContent($request, $id);

		return view('core.tickets.details', $dados);

	}

	/**
	 * Show the form for editing the specified resource.
	 */
	public function edit(Request $request, string $id)
	{

		return view('core.tickets.details');

	}

	/**
	 * Update the specified resource in storage.
	 */
	public function update(Request $request, string $id)
	{
		//
	}

	/**
	 * Remove the specified resource from storage.
	 */
	public function destroy(string $id)
	{
		//
	}
}
