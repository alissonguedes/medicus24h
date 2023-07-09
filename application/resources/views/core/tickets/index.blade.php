@extends('core.body')

@section('main')
	<div class="row">
		<div class="col s12">
			<h3 class="mt-0">Meus Tickets</h3>
		</div>
	</div>

	<div class="row">
		<div class="col s12">
			<ul class="tabs">
				<li class="tab">
					<a href="#open">Abertos</a>
				</li>
				<li class="tab">
					<a href="#progress">Em Análise</a>
				</li>
				<li class="tab">
					<a href="#answered">Respondidos</a>
				</li>
				<li class="tab">
					<a href="#complete">Concluídos</a>
				</li>
				{{-- <li class="tab">
					<a href="#">Cancelados</a>
				</li> --}}
			</ul>
		</div>
	</div>

	<div class="row">
		<div class="col s12">
			<div id="open" class="card" data-url="{{ route('core.tickets.index', 'open') }}" data-target="open-results">
				<div class="card-content">
					<div class="card-title">Abertos</div>
					<div class="card-body">
						<div class="table grid bordered">
							<div class="grid-head">
								<div class="grid grid-row">
									<div class="grid-col center-align" data-order="asc" data-width="20fr" data-orderable="false" data-disabled="true">
										<span class="direction">#</span>
									</div>
									<div class="grid-col left-align" data-width="100fr">
										<span class="direction">Prioridade</span>
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
							<div class="grid grid-body">
								<div id="open-results" class="scroller" style="height: calc(100vh - 290px)">
									@include('core.tickets.list')
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="progress" class="card" data-url="{{ route('core.tickets.index', 'progress') }}">
				<div class="card-content">
					<div class="card-title">Em Análise</div>
					<div class="card-body">
						<div class="table grid bordered">
							<div class="grid-head">
								<div class="grid grid-row">
									<div class="grid-col left-align" data-order="asc" data-width="60fr">
										<span class="direction">Horário</span>
									</div>
									<div class="grid-col left-align" data-width="100fr">
										<span class="direction">Paciente</span>
									</div>
									<div class="grid-col left-align" data-width="100fr">
										<span class="direction">Médico</span>
									</div>
									<div class="grid-col left-align" data-width="60fr">
										<span class="direction">Tipo</span>
									</div>
									<div class="grid-col left-align" data-width="60fr">
										<span class="direction">Convênio</span>
									</div>
									<div class="grid-col left-align" data-width="60fr">
										<span class="direction">Situação</span>
									</div>
								</div>
							</div>
							<div class="grid grid-body">
								<div class="scroller" style="height: calc(100vh - 290px)">
									{{-- @include('clinica.atendimentos.list') --}}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="answered" class="card" data-url="{{ route('core.tickets.index', 'answered') }}">
				<div class="card-content">
					<div class="card-title">Respondidos</div>
					<div class="card-body">
						<div class="table grid bordered">
							<div class="grid-head">
								<div class="grid grid-row">
									<div class="grid-col left-align" data-order="asc" data-width="60fr">
										<span class="direction">Horário</span>
									</div>
									<div class="grid-col left-align" data-width="100fr">
										<span class="direction">Paciente</span>
									</div>
									<div class="grid-col left-align" data-width="100fr">
										<span class="direction">Médico</span>
									</div>
									<div class="grid-col left-align" data-width="60fr">
										<span class="direction">Tipo</span>
									</div>
									<div class="grid-col left-align" data-width="60fr">
										<span class="direction">Convênio</span>
									</div>
									<div class="grid-col left-align" data-width="60fr">
										<span class="direction">Situação</span>
									</div>
								</div>
							</div>
							<div class="grid grid-body">
								<div class="scroller" style="height: calc(100vh - 290px)">
									{{-- @include('clinica.atendimentos.list') --}}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="complete" class="card" data-url="{{ route('core.tickets.index', 'complete') }}">
				<div class="card-content">
					<div class="card-title">Concluídos</div>
					<div class="card-body">
						<div class="table grid bordered">
							<div class="grid-head">
								<div class="grid grid-row">
									<div class="grid-col left-align" data-order="asc" data-width="60fr">
										<span class="direction">Horário</span>
									</div>
									<div class="grid-col left-align" data-width="100fr">
										<span class="direction">Paciente</span>
									</div>
									<div class="grid-col left-align" data-width="100fr">
										<span class="direction">Médico</span>
									</div>
									<div class="grid-col left-align" data-width="60fr">
										<span class="direction">Tipo</span>
									</div>
									<div class="grid-col left-align" data-width="60fr">
										<span class="direction">Convênio</span>
									</div>
									<div class="grid-col left-align" data-width="60fr">
										<span class="direction">Situação</span>
									</div>
								</div>
							</div>
							<div class="grid grid-body">
								<div class="scroller" style="height: calc(100vh - 290px)">
									{{-- @include('clinica.atendimentos.list') --}}
								</div>
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
