@extends('core.body')

@section('main')
	<div class="row">
		<div class="col s12">
			<div class="card mt-0 mb-3 animated delay-10 fadeIn">
				<div class="card-content no-padding">
					<div class="card-title border-bottom padding-1 pb-0 no-margin">
						<button class="btn left mr-2 btn-flat btn-floating waves-effect transparent black-text" data-href="{{ route('core.tickets.index') }}">
							<span class="material-icons-outlined">arrow_back</span>
						</button>
						<h4 class="mt-0">
							{{ $ticket->number }} - {{ $ticket->subject }}
							@isset($ticket->priority)
								<span class="badge grey lighten-2" data-tooltip="Prioridade {{ $ticket->priority }}" data-position="left">
									<i class="material-icons small-icons mr-2" style="color: {{ $ticket->priority_color ?? '#ffffff' }}">fiber_manual_record</i>
									{{ $ticket->priority ?? 'Baixa' }}
								</span>
							@endisset
						</h4>
					</div>
					<div class="card-body no-margin no-padding">

						<style>
							.badge {
								font-size: .75rem;
								display: -webkit-box;
								display: -webkit-flex;
								display: -ms-flexbox;
								display: flex;
								float: left;
								margin-left: 0;
								padding-right: 10px !important;
								color: #616161 !important;
								border-radius: 2px;
								align-items: center;
							}
						</style>

						@if ($content->count() > 0)
							@foreach ($content as $i => $body)
								<div class="mail-body @if ($i < $content->count() - 1) border-bottom @endif no-margin" style="position: relative;">

									<style>
										nav.navbar ul.user-profile li {
											margin-right: 10px;
										}

										nav.navbar ul.user-profile li span,
										nav.navbar ul.user-profile li small {
											display: block;
											margin: 0;
											line-height: normal;
										}

										nav.navbar ul.datetime li {
											margin-left: 10px;
										}
									</style>
									<nav class="navbar transprent lighten-4 z-depth-0 pl-2 pr-2">
										<ul class="user-profile">
											<li>
												<p class="avatar no-margin">
													<img src="{{ asset('img/avatar/icon.png') }}" alt="" class="circle left mr-3" width="50" style="margin: 7px 0;">
												</p>
											</li>
											<li class="mt-1">
												<span class="bold white-text">Alisson Guedes</span>
												<small class="white-text">HapVida - plano bronze</small>
											</li>
										</ul>
										@if ($i === 0)
											<ul class="datetime right" style="font-size: 13px;">
												<li>
													<span class="white-text">{{ date('D, d F Y, h:i', strtotime($body->created)) }}</span>
												</li>
												<li>
													<button type="button" class="btn-flat btn-floating transparent white-text waves-effect waves-light" data-tooltip="Responder">
														<span class="material-symbols-outlined">
															reply
														</span>
													</button>
												</li>
												{{-- <li>
													<button type="button" class="btn-flat btn-floating transparent white-text" data-tooltip="Encaminhar">
														<span class="material-symbols-outlined">
															forward
														</span>
													</button>
												</li> --}}
											</ul>
										@endif
									</nav>

									<div class="content padding-2 mb-3">

										<div class="row">
											<div class="col s12">
												@php
													echo $body->body;
												@endphp
											</div>
										</div>

										@if ($i === 0)
											<div class="row">
												<div class="col s12 mt-3">
													<button type="button" class="btn border-round transparent black-text waves-effect" data-tooltip="Responder">
														<span class="bold">Responder</span>
													</button>
												</div>
											</div>
										@endif

									</div>

								</div>
							@endforeach
						@endif

					</div>
				</div>
				{{-- <div class="card-action"></div> --}}
			</div>
		</div>
	</div>
@endsection

@section('left-sidebar')
	{{-- @include('clinica.agendamentos.form') --}}
@endsection

@section('right-sidebar')
	{{-- @include('clinica.atendimentos.datelhes_atendimento') --}}
	{{-- @include('clinica.atendimentos.form') --}}
@endsection
