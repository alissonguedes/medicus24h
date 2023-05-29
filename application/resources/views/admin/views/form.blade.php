@extends('_layouts.admin.forms')

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
		@if (isset($row))
			<li>
				{{-- <button type="button" class="btn grey lighten-3 z-depth-1 waves-effect waves-light" data-href="{{ go('admin.modulos.estrutura', $row->id) }}">Redefinir senha</button> --}}
				<form @if (isset($row)) action="{{ go('admin.modulos.estrutura', $row->id) }}" @endif>
					<button type="submit" {{ $disabled ?? null }} class="btn grey lighten-3 z-depth-1 waves-effect waves-light">Gerar Estrutura</button>
					<input type="hidden" name="path" value="{{ $row->path }}">
					<input type="hidden" name="modulo" value="{{ $row->modulo }}">
					<input type="hidden" name="namespace" value="{{ $row->namespace }}">
				</form>
			</li>
		@endif
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

							<div class="card-body fixed-height border-top scroller pt-3 pb-4" data-hide-x="true" style="height: calc(100vh - 31z0px);">

								<div class="row">

									<div class="col s12 m10 l10 offset-m2 offset-l1">

										<!-- BEGIN Input[Nome] -->
										<div class="row">
											<div class="col s12 mb-1">
												<div class="input-field">
													<input type="text" name="modulo" id="modulo" value="{{ isset($row) ? $row->modulo : null }}" autofocus="autofocus">
													<label class="grey-text" for="modulo"> Nome do módulo </label>
												</div>
											</div>
										</div>
										<!-- END Input[Nome] -->

										<!-- BEGIN Input[Login] -->
										<div class="row">
											<div class="col s12 mb-1">
												<div class="input-field">
													<label class="grey-text" for="namespace"> Namespace </label>
													<span class="prefix label">App\Http\Controllers\</span>
													<input type="text" name="namespace" id="namespace" value="{{ isset($row) ? str_replace('App\Http\Controllers\\', '', $row->namespace) : null }}" placeholder="Namespace">
												</div>
											</div>
										</div>
										<!-- END Input[Login] -->

										<!-- BEGIN Input[Email] -->
										<div class="row">
											<div class="col s12 mb-1">
												<div class="input-field">
													<label class="grey-text active" for="path"> Path </label>
													<span class="prefix grey lighten-2 label">/</span>
													<input type="text" name="path" value="{{ isset($row) ? limpa_string($row->path) : null }}" id="email" style="margin-top: 10px; padding-left: 10px;" placeholder="Path">
												</div>
											</div>
										</div>
										<!-- END Input[Email] -->

										<!-- BEGIN Input[Senha] -->
										<div class="row">
											<div class="col s12 mb-1">
												<div class="input-field">
													<label class="grey-text" for="restrict"> Restrito? </label>
													<select name="restrict">
														<option value="" disabled="disabled" {{ !isset($row) ? 'selected="selected"' : null }}> Selecione um tipo </option>
														<option value="yes" {{ isset($row) && $row->restrict == 'yes' ? 'selected="selected"' : null }} data-icon=""> Sim </option>
														<option value="no" {{ isset($row) && $row->restrict == 'no' ? 'selected="selected"' : null }} data-icon=""> Não </option>
													</select>
												</div>
											</div>
										</div>
										<!-- END Input[Senha] -->

										<!-- BEGIN Input[Status] -->
										<div class="row">
											<div class="col s12 mb-1">
												<label class="left" style="cursor: pointer; display: flex; align-items: center;">
													<input type="checkbox" name="status" value="0" {{ isset($row) && $row->status === '0' ? 'checked="checked"' : null }}>
													<i class="material-icons" style="width: auto !important;">lock</i>
													<span style="font-size: 1rem; margin-left: 20px; color: #000">Bloquear módulo</span>
												</label>
											</div>
										</div>
										<!-- END Input[Status] -->

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
