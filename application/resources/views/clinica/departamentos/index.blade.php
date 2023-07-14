@extends('clinica.layouts.index')

@section('title', 'Departamentos')

@section('search-label', 'Pesquisar departamento')
@section('data-search', 'departamentos')
@section('json-datatable', 'true')

@section('btn-add-title', 'Adicionar Departamento')
@section('btn-add-icon', 'add')
@section('btn-add-route', go('clinica.departamentos.add'))
@section('btn-add-data-trigger', 'modal')
@section('btn-add-data-target', 'modal_departamento')

@section('btn-delete-route', go('clinica.medicos.delete'))

@section('container')

	<div class="row">
		<div class="col s12">
			<div class="card">
				<div class="card-content">
					<div class="card-body">
						<div class="table grid bordered">
							<div class="grid-head">
								<div class="grid grid-row">
									<div class="grid-col" data-disabled="true" data-orderable="false" data-width="12fr">
										<label class="grey-text text-darken-2 font-14 left">
											<input type="checkbox" name="check-all" id="check-all" class="filled-in">
											<span></span>
										</label>
									</div>
									<div class="grid-col left-align" data-order="asc" data-width="100fr">
										<span class="direction">Departamento</span>
									</div>
									<div class="grid-col center-align" data-width="100fr">
										<span class="direction">Descrição</span>
									</div>
									<div class="grid-col center-align" data-width="50fr">
										<span class="direction">Status</span>
									</div>
									<div class="grid-col center-align" data-disabled="true" data-orderable="false" data-width="50fr">
										<span>Ação</span>
									</div>
								</div>
							</div>
							<div class="grid grid-body">
								<div class="scroller" style="height: calc(100vh - 290px)">
									@include('clinica.departamentos.list')
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	@include('clinica.departamentos.form')

@endsection
