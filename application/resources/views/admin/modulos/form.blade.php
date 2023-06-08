@extends('_layouts.admin.forms')

@section('prev-url', go('admin.modulos.index'))

@if (!isset($modulo))
	{? $disabled = 'disabled="disabled"'; ?}
@endif

@section('topbar-options')
	<ul class="flex flex-auto flex-start flex-center">
		<li>
			<form @if (isset($modulo)) action="{{ go('admin.modulos.{id}.redefinir', $modulo->id) }}" @endif>
				<button type="submit" {{ $disabled ?? null }} class="btn grey lighten-3 z-depth-1 waves-effect waves-light">Redefinir senha</button>
			</form>
		</li>
		@if (isset($modulo))
			<li>
				{{-- <button type="button" class="btn grey lighten-3 z-depth-1 waves-effect waves-light" data-href="{{ go('admin.modulos.estrutura', $modulo->id) }}">Redefinir senha</button> --}}
				<form @if (isset($modulo)) action="{{ go('admin.modulos.estrutura', $modulo->id) }}" @endif>
					<button type="submit" {{ $disabled ?? null }} class="btn grey lighten-3 z-depth-1 waves-effect waves-light">Gerar Estrutura</button>
					<input type="hidden" name="id" value="{{ $modulo->id }}">
					<input type="hidden" name="path" value="{{ $modulo->path }}">
					<input type="hidden" name="modulo" value="{{ $modulo->modulo }}">
					<input type="hidden" name="namespace" value="{{ $modulo->namespace }}">
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

	{? $disabled = isset($modulo) && $modulo->editavel === '0' ? 'disabled="disabled"' : false; ?}

	@if ($disabled)
		{? $input_label_hidden = $modulo -> label; ?}
		{? $editavel = $modulo->editavel; ?}
	@else
		{? $editavel = 1; ?}
	@endif

@endif

@section('title', (isset($modulo) ? 'Editar' : 'Novo') . ' módulo')

@section('buttons')
	@if (isset($modulo))
		<button class="btn btn-large excluir waves-effect" value="{{ isset($modulo) ? $modulo->id : null }}" data-tooltip="Excluir" data-link="{{ route('admin.modulos.delete') }}" style="border: none">
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

							@if (isset($modulo))
								<div id="tabs">
									<ul class="tabs">
										<li class="tab col"><a href="#modulo">Módulo</a></li>
										<li class="tab col"><a href="#controllers">Controllers</a></li>
										<li class="tab col"><a href="#views">Views</a></li>
										<li class="tab col"><a href="#menus">Menus</a></li>
										<li class="tab col"><a href="#rotas">Rotas</a></li>
									</ul>
								</div>
							@endif

							<div class="card-body fixed-height border-top scroller pt-3 pb-4" data-hide-x="true" style="height: calc(100vh - 31z0px);">

								<div class="row">

									<div class="col s12 m10 l10 offset-m2 offset-l1">

										<div id="modulo">

											<div class="row">
												<div class="col s12 mb-3">
													<h6>Módulo</h6>
												</div>
											</div>

											<!-- BEGIN Input[Nome] -->
											<div class="row">
												<div class="col s12 mb-1">
													<div class="input-field">
														<input type="text" name="modulo" id="modulo" value="{{ isset($modulo) ? $modulo->modulo : null }}" autofocus="autofocus">
														<label class="grey-text" for="modulo"> Nome do módulo </label>
													</div>
												</div>
											</div>
											<!-- END Input[Nome] -->

											<!-- BEGIN Input[Login] -->
											<div class="row">
												<div class="col s12 mb-1">
													<div class="input-field">
														<label class="grey-text active" for="namespace"> Namespace </label>
														<div class="input-group">
															<span class="input-group-item first">App\Http\Controllers\</span>
															<input type="text" name="namespace" id="namespace" value="{{ isset($modulo) ? str_replace('App\Http\Controllers\\', '', $modulo->namespace) : null }}" placeholder="Namespace">
														</div>
													</div>
												</div>
											</div>
											<!-- END Input[Login] -->

											<!-- BEGIN Input[Email] -->
											<div class="row">
												<div class="col s12 mb-1">
													<div class="input-field">
														<label class="grey-text active" for="path"> Path </label>
														<div class="input-group">
															<span class="input-group-item first">/</span>
															<input type="text" name="path" value="{{ isset($modulo) ? limpa_string($modulo->path) : null }}" id="email" style="margin-top: 10px; padding-left: 10px;" placeholder="Path">
														</div>
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
															<option value="" disabled="disabled" {{ !isset($modulo) ? 'selected="selected"' : null }}> Selecione um tipo </option>
															<option value="yes" {{ isset($modulo) && $modulo->restrict == 'yes' ? 'selected="selected"' : null }} data-icon=""> Sim </option>
															<option value="no" {{ isset($modulo) && $modulo->restrict == 'no' ? 'selected="selected"' : null }} data-icon=""> Não </option>
														</select>
													</div>
												</div>
											</div>
											<!-- END Input[Senha] -->

											<!-- BEGIN Input[Status] -->
											<div class="row">
												<div class="col s12 mb-1">
													<label class="left" style="cursor: pointer; display: flex; align-items: center;">
														<input type="checkbox" name="status" value="0" {{ isset($modulo) && $modulo->status === '0' ? 'checked="checked"' : null }}>
														<i class="material-icons" style="width: auto !important;">lock</i>
														<span style="font-size: 1rem; margin-left: 20px; color: #000">Bloquear módulo</span>
													</label>
												</div>
											</div>
											<!-- END Input[Status] -->

										</div>

										@isset($modulo)
											<!-- BEGIN Controllers -->
											<div id="controllers">

												<div class="row">
													<div class="col s12 mb-3">
														<h6>Controllers</h6>
													</div>
												</div>

												<div class="row">
													<div class="col s12 mb-1">

														<button type="button" class="btn green waves-effect" data-trigger="modal" data-target="modal_controller" data-href="{{ route('admin.modulos.controller.add', $modulo->id) }}" data-disabled="false">
															Novo Controller
														</button>

													</div>
												</div>

												<div class="row">
													<div class="col s12">
														@include('admin.modulos.controllers.table')
													</div>
												</div>

											</div>
											<!-- END Controllers -->

											<!-- BEGIN Views -->
											<div id="views">

												<div class="row">
													<div class="col s12 mt-3 mb-3">
														<h6>Views</h6>
													</div>
												</div>

											</div>
											<!-- END Views -->

											<!-- BEGIN Menus -->
											<div id="menus">

												<div class="row">
													<div class="col s12 mt-3 mb-3">
														<h6>Menus</h6>
													</div>
												</div>

											</div>
											<!-- END Menus -->

											<!-- BEGIN Rotas -->
											<div id="rotas">

												<div class="row">
													<div class="col s12 mt-3 mb-3">
														<h6>Rotas</h6>
													</div>
												</div>

											</div>
											<!-- END Rotas -->
										@endisset

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

								@isset($modulo)
									<input type="hidden" name="id" value="{{ isset($modulo) ? $modulo->id : null }}">
									<input type="hidden" name="_method" value="{{ isset($modulo) ? 'put' : 'post' }}">
								@endisset

								{{ $input_label_hidden }}

							</div>

						</div>

					</div>

				</form>
				<!-- END form -->

			</div>

			@include('admin.modulos.controllers.form')

		</div>

	</div>

@endsection
