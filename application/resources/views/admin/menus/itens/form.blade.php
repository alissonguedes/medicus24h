@extends('clinica.layouts.forms')

@section('prev-url', go('admin.modulos.index'))

@if (!isset($row))
	{? $disabled = 'disabled="disabled"'; ?}
@endif

@section('topbar-options')
	<ul class="flex flex-auto flex-start flex-center">
		<li>
			<form @if (isset($row)) action="{{ go('admin.modulos.{id}.redefinir', $row->id) }}" @endif>
				<button type="submit" {{ $disabled ?? null }} class="btn grey lighten-3 z-depth-1 waves-effect waves-light">Redefinir senha</button>
			</form>
		</li>
	</ul>
@endsection

@php
	$disabled = null;
	$editavel = null;
	$input_label_hidden = null;
@endphp

@if (session()->get('userdata')[session()->get('app_session')]['id_grupo'] > 1)

	{? $disabled = isset($row) && $row->editavel === '0' ? 'disabled="disabled"' : false; ?}

	@if ($disabled)
		{? $input_label_hidden = $row -> label; ?}
		{? $editavel = $row->editavel; ?}
	@else
		{? $editavel = 1; ?}
	@endif

@endif

@section('title', (isset($row) ? 'Editar' : 'Novo') . ' módulo')

@section('buttons')
	@if (isset($row))
		<button class="btn btn-large excluir waves-effect" value="{{ isset($row) ? $row->id : null }}" data-tooltip="Excluir" data-link="{{ route('admin.modulos.delete') }}" style="border: none">
			<i class="material-icons">delete_forever</i>
		</button>
	@endif
@endsection

@section('container')

	<div class="container">

		<div class="row">

			<div class="col s12">

				<!-- BEGIN form -->
				<form novalidate action="{{ route('admin.modulos.post') }}" method="post" autocomplete="off">

					<div class="card">

						<div class="card-content no-padding">

							<div class="card-title pl-2 pt-2 pb-1">
								Informações do módulo
							</div>

							<div class="card-body fixed-height border-top scroller pt-3 pb-4" data-hide-x="true" style="height: calc(100vh - 310px);">

								<div class="row">

									<div class="col s12 m10 l10 offset-m2 offset-l1">

										@include('admin.menus.form.fields')

									</div>

								</div>

							</div>

							<div class="card-action right-align">

								<button type="reset" class="btn white black-text waves-effect mr-2" data-tooltip="Voltar" data-href="{{ go('admin.modulos.index') }}">
									<i class="material-icons-outlined">arrow_back</i>
								</button>

								<button type="submit" class="btn green waves-effect" data-tooltip="Salvar">
									<i class="material-icons-outlined">save</i>
								</button>

								<input type="hidden" name="id" value="{{ isset($row) ? $row->id : null }}">
								<input type="hidden" name="_method" value="{{ isset($row) ? 'put' : 'post' }}">

								{{ $input_label_hidden }}

							</div>

						</div>

					</div>

				</form>
				<!-- END form -->

			</div>

			{{-- @include('admin.modulos.form-usergroup') --}}

		</div>

	</div>

@endsection
