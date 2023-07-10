<?php

namespace App\Http\Controllers\Core;

use App\Http\Controllers\Controller;
use App\Models\TicketModel;
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
	public function form()
	{
		return view('core.tickets.form');
	}

	/**
	 * Show the form for creating a new resource.
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created resource in storage.
	 */
	public function store(Request $request)
	{
		//
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
