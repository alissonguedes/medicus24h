@extends('clinica.layouts.index')

@section('title', 'Atendimentos')

@section('search-label', 'Pesquisar atendimento')
@section('data-search', 'atendimentos')
@section('json-datatable', 'true')

@section('btn-add')
	<a href="#" data-target="agendamento" data-link="{{ go('clinica.agendamentos.add') }}" class="form-sidenav-trigger btn btn-floating gradient-45deg-deep-orange-orange waves-effect waves-light z-depth-3" data-tooltip="Agendar" data-position="left">
		<i class="material-icons bolder">add</i>
	</a>
@endsection

@section('container')

	<div class="row">
		<div class="col s12">
			<div class="card">
				<div class="card-content">
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
									@include('clinica.atendimentos.list')
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
