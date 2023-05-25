@extends('clinica.body')

@php

	$limit = 50;

	$ini_date = date('Y-m-d');
	$end_date = date('Y-m-d', time() - 60 * 60 * 24 * 50);

	$cur_date = date_create($ini_date);
	$end_date = date_create($end_date);

	$interval = date_diff($cur_date, $end_date);
	$interval = $interval->format('%R%a');

	for($i = $interval; $i <= 0; $i++):

		$cur_date=date('Y-m-d', time() + 60 * 60 * 24 * $i);
		$mail_ids[$cur_date] = $mailbox->searchMailbox('ON "' . $cur_date . '"');

	endfor;

	// dump($mail_ids);

	if (isset($mail_ids) && count($mail_ids) > 0 ) {

		foreach($mail_ids as $date => $mail) {
			if ( !empty($mail)){
				foreach($mail as $m) {
					$email = $mailbox->getMail($m, false);
					echo '<b>' . (string) $email->subject . '</b>';
				}
					echo 'Date: ' . $date . '<br>';
	//			$email = $mailbox->getMail($mail, false);
	//			echo 'subject: ' . (string) $email->subject . "\n<br>";
			}
		}

	}

@endphp

@section('body')

@endsection

{{-- @php


	foreach ($mail_ids as $mail_id) {
	echo "+------ P A R S I N G ------+\n";

	$email = $mailbox->getMail($mail_id, false);

	// echo 'from-name: ' . (string) ($email->fromName ?? $email->fromAddress) . "\n";
	// echo 'from-email: ' . (string) $email->fromAddress . "\n";
	// echo 'to: ' . (string) $email->toString . "\n";
	echo 'subject: ' . (string) $email->subject . "\n<br>";
	// echo 'message_id: ' . (string) $email->messageId . "\n";

	echo 'mail has attachments? ';
	if ($email->hasAttachments()) {
	echo "Yes\n";
	} else {
	echo "No\n";
	}

	if (!empty($email->getAttachments())) {
	echo \count($email->getAttachments()) . " attachements\n";
	}
	if ($email->textHtml) {
	// echo "Message HTML:\n" . $email->textHtml;
	} else {
	// echo "Message Plain:\n" . $email->textPlain;
	}

	if (!empty($email->autoSubmitted)) {
	// Mark email as "read" / "seen"
	$mailbox->markMailAsRead($mail_id);
	echo "+------ IGNORING: Auto-Reply ------+\n";
	}

	if (!empty($email_content->precedence)) {
	// Mark email as "read" / "seen"
	$mailbox->markMailAsRead($mail_id);
	echo "+------ IGNORING: Non-Delivery Report/Receipt ------+\n";
	}
	}

@endphp--}}
