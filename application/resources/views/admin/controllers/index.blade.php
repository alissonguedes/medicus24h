@extends('_layouts.admin.index')

@section('title', 'Módulos')

@section('search-label', 'Pesquisar Módulos')
@section('data-search', 'modulos')
@section('json-datatable', 'true')

@section('btn-add-title', 'Adicionar Módulo')
@section('btn-add-icon', 'person_add_alt')
@section('btn-add-route', go('admin.modulos.add'))

@section('container')

	<div class="row">
		<div class="col s12">
			<div class="card">
				<div class="card-content">
					<div class="card-body">
						@include('admin.controllers.table')
					</div>
				</div>
			</div>
		</div>
	</div>

@endsection
