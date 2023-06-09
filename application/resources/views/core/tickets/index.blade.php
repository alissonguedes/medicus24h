@extends('core.body')

@section('main')
	<div class="container no-padding">

		<div class="row animated delay-5 fadeInRight slow" data-animation="fadeOutLeft">
			<div class="col s12">
				<h3 class="mt-0">Meus Tickets</h3>
			</div>
		</div>

		<div class="row animated delay-10 fadeInRight slow" data-animation="fadeOutLeft">
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

		<div class="row animated delay-15 fadeInRight slow" data-animation="fadeOutLeft">
			<div class="col s12">

				<div class="card" data-target="card-content">
					<div class="card-content">
						<div class="card-body">
							<div id="open" data-url="{{ route('core.tickets.status', 'open') }}" data-target="grid-body" class="table grid bordered">
								<div class="grid-head">
									<div class="grid grid-row">
										<div class="grid-col center-align" data-order="asc" data-width="20fr" data-orderable="false" data-disabled="true">
											<span class="direction">#</span>
										</div>
										<div class="grid-col center-align" data-width="20fr" data-orderable="false">
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
								<div class="grid grid-body"></div>
							</div>
							<div id="in-progress" data-url="{{ route('core.tickets.status', 'in-progress') }}" data-target="grid-body" class="table grid bordered">
								<div class="grid-head">
									<div class="grid grid-row">
										<div class="grid-col center-align" data-order="asc" data-width="20fr" data-orderable="false" data-disabled="true">
											<span class="direction">#</span>
										</div>
										<div class="grid-col center-align" data-width="20fr" data-orderable="false">
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
								<div class="grid grid-body"></div>
							</div>
							<div id="awaiting-client-response" data-url="{{ route('core.tickets.status', 'awaiting-client-response') }}" data-target="grid-body" class="table grid bordered">
								<div class="grid-head">
									<div class="grid grid-row">
										<div class="grid-col center-align" data-order="asc" data-width="20fr" data-orderable="false" data-disabled="true">
											<span class="direction">#</span>
										</div>
										<div class="grid-col center-align" data-width="20fr" data-orderable="false">
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
								<div class="grid grid-body"></div>
							</div>
							<div id="closed" data-url="{{ route('core.tickets.status', 'closed') }}" data-target="grid-body" class="table grid bordered">
								<div class="grid-head">
									<div class="grid grid-row">
										<div class="grid-col center-align" data-order="asc" data-width="20fr" data-orderable="false" data-disabled="true">
											<span class="direction">#</span>
										</div>
										<div class="grid-col center-align" data-width="20fr" data-orderable="false">
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
								<div class="grid grid-body"></div>
							</div>
						</div>
					</div>
				</div>
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
