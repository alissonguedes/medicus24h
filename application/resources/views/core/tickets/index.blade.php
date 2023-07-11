@extends('core.body')

@section('main')
	<div class="row animated delay-1 fadeInLeft slow">
		<div class="col s12">
			<h3 class="mt-0">Meus Tickets</h3>
		</div>
	</div>

	<div class="row animated delay-2 fadeInLeft slow">
		<div class="col s12">
			<ul class="tabs">
				<li class="tab">
					<a href="#open">Abertos</a>
				</li>
				<li class="tab">
					<a href="#in-progress">Em Análise</a>
				</li>
				<li class="tab">
					<a href="#awaiting-client-response">Respondidos</a>
				</li>
				<li class="tab">
					<a href="#closed">Concluídos</a>
				</li>
				{{-- <li class="tab">
					<a href="#">Cancelados</a>
				</li> --}}
			</ul>
		</div>
	</div>

	<div class="row animated delay-3 fadeInLeft slow">
		<div class="col s12">
			<div id="open" class="card" data-url="{{ route('core.tickets.status', 'open') }}" data-target="open-results">
				<div class="card-content">
					<div class="card-title">Abertos</div>
					<div class="card-body">
						<div class="table grid bordered">
							<div class="grid-head">
								<div class="grid grid-row">
									<div class="grid-col center-align" data-order="asc" data-width="20fr" data-orderable="false" data-disabled="true">
										<span class="direction">#</span>
									</div>
									<div class="grid-col left-align" data-width="20fr" data-orderable="false">
										<span class="direction"></span>
									</div>
									<div class="grid-col left-align" data-width="100fr">
										<span class="direction">Assunto</span>
									</div>
									<div class="grid-col left-align" data-width="100fr">
										<span class="direction">Departamento</span>
									</div>
									<div class="grid-col left-align" data-width="100fr">
										<span class="direction">Última Atualização</span>
									</div>
									<div class="grid-col left-align" data-width="60fr">
										<span class="direction">Status</span>
									</div>
								</div>
							</div>
							<div id="open-results" class="grid grid-body">
								{{-- @include('core.tickets.list') --}}
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="in-progress" class="card" data-url="{{ route('core.tickets.status', 'in-progress') }}" data-target="in-progress-results">
				<div class="card-content">
					<div class="card-title">Em Análise</div>
					<div class="card-body">
						<div class="table grid bordered">
							<div class="grid-head">
								<div class="grid grid-row">
									<div class="grid-col center-align" data-order="asc" data-width="20fr" data-orderable="false" data-disabled="true">
										<span class="direction">#</span>
									</div>
									<div class="grid-col left-align" data-width="20fr">
										<span class="direction"></span>
									</div>
									<div class="grid-col left-align" data-width="100fr">
										<span class="direction">Assunto</span>
									</div>
									<div class="grid-col left-align" data-width="100fr">
										<span class="direction">Departamento</span>
									</div>
									<div class="grid-col left-align" data-width="100fr">
										<span class="direction">Última Atualização</span>
									</div>
									<div class="grid-col left-align" data-width="60fr">
										<span class="direction">Status</span>
									</div>
								</div>
							</div>
							<div id="in-progress-results" class="grid grid-body">
								{{-- @include('clinica.atendimentos.list') --}}
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="awaiting-client-response" class="card" data-url="{{ route('core.tickets.status', 'awaiting-client-response') }}" data-target="awaiting-client-response-results">
				<div class="card-content">
					<div class="card-title">Respondidos</div>
					<div class="card-body">
						<div class="table grid bordered">
							<div class="grid-head">
								<div class="grid grid-row">
									<div class="grid-col center-align" data-order="asc" data-width="20fr" data-orderable="false" data-disabled="true">
										<span class="direction">#</span>
									</div>
									<div class="grid-col left-align" data-width="20fr">
										<span class="direction"></span>
									</div>
									<div class="grid-col left-align" data-width="100fr">
										<span class="direction">Assunto</span>
									</div>
									<div class="grid-col left-align" data-width="100fr">
										<span class="direction">Departamento</span>
									</div>
									<div class="grid-col left-align" data-width="100fr">
										<span class="direction">Última Atualização</span>
									</div>
									<div class="grid-col left-align" data-width="60fr">
										<span class="direction">Status</span>
									</div>
								</div>
							</div>
							<div class="grid grid-body" id="awaiting-client-response-results">
								{{-- @include('clinica.atendimentos.list') --}}
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="closed" class="card" data-url="{{ route('core.tickets.status', 'closed') }}" data-target="closed-results">
				<div class="card-content">
					<div class="card-title">Concluídos</div>
					<div class="card-body">
						<div class="table grid bordered">
							<div class="grid-head">
								<div class="grid grid-row">
									<div class="grid-col center-align" data-order="asc" data-width="20fr" data-orderable="false" data-disabled="true">
										<span class="direction">#</span>
									</div>
									<div class="grid-col left-align" data-width="20fr">
										<span class="direction"></span>
									</div>
									<div class="grid-col left-align" data-width="100fr">
										<span class="direction">Assunto</span>
									</div>
									<div class="grid-col left-align" data-width="100fr">
										<span class="direction">Departamento</span>
									</div>
									<div class="grid-col left-align" data-width="100fr">
										<span class="direction">Última Atualização</span>
									</div>
									<div class="grid-col left-align" data-width="60fr">
										<span class="direction">Status</span>
									</div>
								</div>
							</div>
							<div class="grid grid-body" id="closed-results">
								{{-- @include('clinica.atendimentos.list') --}}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
@endsection

@section('left-sidebar')
	@include('clinica.agendamentos.form')
@endsection

@section('right-sidebar')
	@include('clinica.atendimentos.datelhes_atendimento')
	{{-- @include('clinica.atendimentos.form') --}}
@endsection
