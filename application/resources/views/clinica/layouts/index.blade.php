@extends('clinica.body')

@section('back-button', '')

@section('main')

	<div class="topbar flex flex-center">
		<div class="topbar-fixed topbar-color flex flex-auto z-depth-1">
			<div class="flex flex-auto flex-center">
				<div class="flex flex-auto flex-start flex-center">
					<button class="dropdown-trigger btn white black-text z-depth-2 border-round mr-2" data-target="dropdown-actions">
						<i class="material-icons checkbox">check_box</i>
						<i class="material-icons">keyboard_arrow_down</i>
					</button>
					<ul id="dropdown-actions" class="dropdown-content">
						<li>
							<button type="button" data-link=" #go('clinica.medicos.delete', $row->id) " data-method="get">
								<i class="material-icons">file_download</i>PDF
							</button>
						</li>
						<li>
							<button type="button" data-link=" #go('clinica.medicos.delete', $row->id) " data-method="get">
								<i class="material-icons">file_download</i>XLS
							</button>
						</li>
						@section('btn-delete')
						<li class="divider" tabindex="-1"></li>
						<li class="disabled red-text">
							<button type="button" disabled="disabled" id="btn-delete" data-url="@yield('btn-delete-route')" data-method="delete">
								<i class="material-icons">delete</i>Excluir
							</button>
						</li>
						@show
					</ul>

				@section('search-label', 'Pesquisar...')

				@section('search')
					<div class="input-field search bordered border-round z-depth-1">
						<label for="">@yield('search-label')</label>
						<input type="search" id="search-on-page" data-search="@yield('data-search')" data-json-datatable="@yield('json-datatable', 'false')">
					</div>
				@show

				@section('filters')
					<button id="total-results" class="btn btn-flat waves-effect left-align dropdown-trigger pl-2 pr-2 grey-text text-darken-2" data-target="dropdown-registros">
						<span style="display: inline-block; height: 28px; overflow: hidden;">@yield('total-results')</span>
						<i class="material-icons arrow-down">keyboard_arrow_down</i>
					</button>
				@show

			</div>

			<div class="action-buttons">
				<button class="btn btn-floating blue lighten-1 list gradient-45deg-indigo-light-blue waves-effect waves-light hide" id="change-mode" disabled="disabled">
					<i class="material-icons">list</i>
				</button>
				@section('btn-add')
					<button class="btn btn-floating gradient-45deg-deep-orange-orange waves-effect waves-light z-depth-3" data-tooltip="@yield('btn-add-title')" data-position="left" data-href="@yield('btn-add-route')" @hasSection('btn-add-data-trigger')
						data-trigger="@yield('btn-add-data-trigger')"
						@endif
						@hasSection('btn-add-data-trigger')
							@hasSection('btn-add-data-target')
								data-target="@yield('btn-add-data-target')"
							@endif
						@endif>
						<i class="material-icons">@yield('btn-add-icon')</i>
					</button>
				@show
			</div>
		</div>
	</div>
</div>

<style>
	.alert {
		margin-top: 5px;
		padding: 15px;
		border-radius: 5px;
		text-align: center;
	}

	.alert.success {
		color: var(--green-darken-2);
		background-color: var(--green-lighten-1);
		border: 1px solid var(--green-lighten-3);
	}
</style>

<div class="container pt-1 pb-3 scroller" style="height: calc(100vh - 130px); width: 100%;">

	@if (session('message'))
		<div class="row">
			<div class="col s12">
				<div class="alert {{ session('status') ?? 'success' }}">
					{{ session('message') }}
				</div>
			</div>
		</div>
	@endif

	<div id="results">
		@yield('container')
	</div>

</div>

@yield('left-sidebar')
@yield('right-sidebar')

@endsection
