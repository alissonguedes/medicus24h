@extends('clinica.layouts.index')

@section('title', 'Funcionários')

@section('search-label', 'Pesquisar funcionários')
@section('data-search', 'funcionarios')
@section('json-datatable', 'true')

@section('btn-add-title', 'Adicionar Funcionário')
@section('btn-add-icon', 'person_add_alt')
@section('btn-add-route', go('clinica.funcionarios.add'))
@section('btn-add-data-trigger', 'modal')
@section('btn-add-data-target', 'modal_funcionario')

{{-- @section('btn-delete', false) --}}
{{-- @section('btn-delete-route', go('clinica.funcionarios.delete')) --}}

@section('container')

	<div class="row">
		<div class="col s12">
			<div class="card">
				<div class="card-content">
					<div class="card-body">
						<div class="table grid bordered">
							<div class="grid-head">
								<div class="grid grid-row">
									<div class="grid-col" data-disabled="true" data-orderable="false" data-width="10fr">
										<label class="grey-text text-darken-2 font-14 left">
											<input type="checkbox" name="check-all" id="check-all" class="filled-in">
											<span></span>
										</label>
									</div>
									<div class="grid-col" data-order="asc" data-width="50fr">
										<span class="direction">Funcionário</span>
									</div>
									<div class="grid-col" data-width="50fr">
										<span class="direction">Função</span>
									</div>
									<div class="grid-col" data-width="50fr">
										<span class="direction">CRM</span>
									</div>
									{{-- <div class="grid-col" data-width="50fr">
										<span class="direction">Data de cadastro</span>
									</div> --}}
									<div class="grid-col center-align" data-width="50fr">
										<span class="direction">status</span>
									</div>
									<div class="grid-col center-align" data-disabled="true" data-orderable="false" data-width="50fr">
										<span class="direction">Ações</span>
									</div>
								</div>
							</div>
							<div class="grid grid-body">
								<div class="scroller" style="height: calc(100vh - 290px)">
									@include('clinica.funcionarios.list')
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	@include('clinica.funcionarios.form')

@endsection
