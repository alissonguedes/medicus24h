@extends('core.tickets.mail_layout')

@section('app-mail')
	<div class="app-email-content animated fadeInRight slow" data-animation="fadeOutDown">
		<div class="content-area content-right">
			<div class="app-wrapper">
				<div class="card card-default border-radius-6 fixed-width">
					<div class="card-content no-padding">
						<!-- Email Header -->
						<div class="email-header">
							<div class="subject">
								<div class="back-to-mails">
									<button class="btn btn-flat btn-floating waves-effect transparent black-text no-margin" data-href="{{ route('core.tickets.index') }}">
										<span class="material-icons-outlined">arrow_back</span>
									</button>
								</div>
								<h5 class="email-title black-text">
									{{ $ticket->number }} - {{ $ticket->subject }}
								</h5>
							</div>
							<div class="header-action">
								@isset($ticket->priority)
									<span class="badge grey lighten-2" data-tooltip="Prioridade {{ $ticket->priority }}" data-position="left">
										<i class="material-icons small-icons mr-2" style="color: {{ $ticket->priority_color ?? '#ffffff' }}">fiber_manual_record</i>
										{{ $ticket->priority ?? 'Baixa' }}
									</span>
								@endisset
								{{-- <div class="favorite">
										<i class="material-icons">star_border</i>
									</div>
									<div class="email-label">
										<i class="material-icons">label_outline</i>
									</div> --}}
							</div>
						</div>
						<!-- Email Header Ends -->
						@if ($content->count() > 0)
							@foreach ($content as $i => $body)
								<!-- Email Content -->
								<div class="email-content">
									<div class="list-title-area indigo">
										<div class="user-media">
											<img src="{{ asset('img/avatar/icon.png') }}" alt="" class="circle z-depth-2 responsive-img avtar">
											<div class="list-title">
												<span class="bold white-text">{{ $body->user_id }}</span>
												<small class="white-text">HapVida - plano bronze</small>
											</div>
										</div>
										<div class="title-right white-text">
											<span class="mail-time">{{ date('D, d F Y, H:i', strtotime($body->created)) }}</span>
											<i class="material-icons">reply</i>
											<i class="material-icons">more_vert</i>
										</div>
									</div>
									<div class="email-desc flow-text black-text">
										@php
											echo $body->body;
										@endphp
									</div>
								</div>
								<!-- Email Content Ends -->

								<!-- Email Footer -->
								<div class="email-footer">
									<h6 class="footer-title"> Anexos: (3)</h6>
									<div class="footer-action">
										<div class="attachment-list">
											<div class="attachment">
												<img src="../../../app-assets/images/gallery/35.png" alt="" class="responsive-img attached-image">
												<div class="size">
													<span class="grey-text">(0.75Mb)</span>
												</div>
												<div class="links">
													<a href="#" class="left">
														<i class="material-icons">remove_red_eye</i>
													</a>
													<a href="#" class="Right">
														<i class="material-icons">file_download</i>
													</a>
												</div>
											</div>
											<div class="attachment">
												<img src="../../../app-assets/images/gallery/36.png" alt="" class="responsive-img attached-image">
												<div class="size">
													<span class="grey-text">(1Mb)</span>
												</div>
												<div class="links">
													<a href="#" class="left">
														<i class="material-icons">remove_red_eye</i>
													</a>
													<a href="#" class="Right">
														<i class="material-icons">file_download</i>
													</a>
												</div>
											</div>
											<div class="attachment">
												<img src="../../../app-assets/images/gallery/39.png" alt="" class="responsive-img attached-image">
												<div class="size">
													<span class="grey-text">(1.2Mb)</span>
												</div>
												<div class="links">
													<a href="#" class="left">
														<i class="material-icons">remove_red_eye</i>
													</a>
													<a href="#" class="Right">
														<i class="material-icons">file_download</i>
													</a>
												</div>
											</div>
										</div>
										<div class="footer-buttons">
											<a class="btn reply mb-1"><i class="material-icons left">reply</i><span>Reply</span></a>
											<a class="btn forward mb-1"><i class="material-icons left">reply</i><span>Forward</span></a>
										</div>
									</div>
									<div class="reply-box d-none">
										<form action="#">
											<div class="input-field col s12">
												<div class="snow-container mt-2">
													<div class="compose-editor"></div>
													<div class="compose-quill-toolbar">
														<span class="ql-formats mr-0">
															<button class="ql-bold"></button>
															<button class="ql-italic"></button>
															<button class="ql-underline"></button>
															<button class="ql-link"></button>
															<button class="ql-image"></button>
														</span>
													</div>
												</div>
											</div>
											<div class="input-field col s12">
												<a class="btn reply-btn right">Reply</a>
											</div>
										</form>
									</div>
									<div class="forward-box d-none">
										<hr>
										<form action="#">
											<div class="input-field col s12">
												<i class="material-icons prefix"> person_outline </i>
												<input id="email" type="email" class="validate">
												<label for="email">To</label>
											</div>
											<div class="input-field col s12">
												<i class="material-icons prefix"> title </i>
												<input id="subject" type="text" class="validate">
												<label for="subject">Subject</label>
											</div>
											<div class="input-field col s12">
												<div class="snow-container mt-2">
													<div class="forward-email"></div>
													<div class="forward-email-toolbar">
														<span class="ql-formats mr-0">
															<button class="ql-bold"></button>
															<button class="ql-italic"></button>
															<button class="ql-underline"></button>
															<button class="ql-link"></button>
															<button class="ql-image"></button>
														</span>
													</div>
												</div>
											</div>
											<div class="input-field col s12">
												<a class="btn forward-btn right">Forward</a>
											</div>
										</form>
									</div>
								</div>
								<!-- Email Footer Ends -->
							@endforeach
						@endif
					</div>
				</div>
			</div>
		</div>
	</div>
@endsection

@section('left-sidebar')
@endsection

@section('right-sidebar')
@endsection
