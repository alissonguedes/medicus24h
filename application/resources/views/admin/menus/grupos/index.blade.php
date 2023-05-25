@extends('clinica.layouts.index')

@section('title', 'Grupos de Menus')

@section('search-label', 'Pesquisar Menus')
@section('data-search', 'menus')
@section('json-datatable', 'true')

@section('btn-add-title','Adicionar Menu')
@section('btn-add-icon', 'person_add_alt')
@section('btn-add-route', go('admin.menus.add'))

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
								<div class="grid-col" data-order="asc" data-width="200fr">
									<span class="direction">Name</span>
								</div>
								<div class="grid-col" data-width="50fr">
									<span class="direction">Status</span>
								</div>
								<div class="grid-col center-align" data-disabled="true" data-orderable="false" data-width="20fr">
									<span>Ação</span>
								</div>
							</div>
						</div>
						<div class="grid grid-body">
							<div class="scroller" style="height: calc(100vh - 290px)">
								@include('admin.menus.grupos.list')
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

@endsection
