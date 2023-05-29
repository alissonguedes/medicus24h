<?php

namespace App\Http\Controllers\Mail;

use App\Http\Controllers\Controller;
use App\Models\MailModel;
use Illuminate\Http\Request;

class HomeController extends Controller
{

	public function __construct(
		Request $request,
		MailModel $mail
	) {
		$this->request = $request;
		$this->mail    = $mail;
	}

	public function index()
	{

		$mailbox = mailbox();

		$dados['mailbox'] = $mailbox;

		$mailbox->disconnect();

		return response(view('mail.inbox.index', $dados), 200);

	}
}
