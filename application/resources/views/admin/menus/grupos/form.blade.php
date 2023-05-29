@extends('clinica.layouts.forms')

@section('prev-url', go('admin.menus'))

@if(!isset($row))
	{? $disabled = 'disabled="disabled"'; ?}
@endif

@section('topbar-options')
@endsection

@php
	$disabled = null;
	$editavel = null;
	$input_label_hidden = null;
@endphp

@if(session()->get('userdata')[session()->get('app_session')]['id_grupo'] > 1)

	{? $disabled = isset($row) && $row->editavel === '0' ? 'disabled="disabled"' : false; ?}

	@if($disabled)
		{? $input_label_hidden = $row -> label; ?}
		{? $editavel = $row->editavel; ?}
	@else
		{? $editavel = 1; ?}
	@endif

@endif

@section('title', (isset($row) ? 'Editar' : 'Novo') . ' menu')

@section('buttons')
@if(isset($row))
	<button class="btn btn-large excluir waves-effect" value="{{ isset($row) ? $row->id : null }}" data-tooltip="Excluir" data-link="{{ route('admin.menus.delete') }}" style="border: none">
		<i class="material-icons">delete_forever</i>
	</button>
@endif
@endsection

@section('container')

<div class="container">

	<div class="row">

		<div class="col s12">

			<!-- BEGIN form -->
			<form novalidate action="{{ route('admin.menus.post') }}" method="post" autocomplete="off">

				<div class="card">

					<div class="card-content no-padding">


						<div class="card-title pl-2 pt-2 pb-1">
							Informações do menu
						</div>

						<div class="card-body fixed-height border-top scroller pt-3 pb-4" data-hide-x="true" style="height: calc(100vh - 31z0px);">


							<div class="row">

								<div class="col s12 m10 l10 offset-m2 offset-l1">

									<div id="informacoes_menu">

										<div class="row">
											<div class="col s12 mt-3 mb-3">
												<h6>Dados do Menu</h6>
											</div>
										</div>

										<!-- BEGIN Input[Nome] -->
										<div class="row">
											<div class="col s12 mb-1">
												<div class="input-field">
													<label class="grey-text" for="titulo"> Nome do menu </label>
													<input type="text" name="titulo" id="titulo" value="{{ isset($row) ? $row->titulo : null }}" autofocus="autofocus">
												</div>
											</div>
										</div>
										<!-- END Input[Nome] -->

										<!-- BEGIN Input[Login] -->
										{{-- <div class="row">
											<div class="col s12 mb-1">
												<div class="input-field">
													<label class="grey-text" for="modulo"> Módulos </label>
													<select name="modulo" multiple="multiple">
														<option value="" disabled="disabled" {{ !isset($row) ? 'selected="selected"' : null }}> Vincular módulos </option>
														@foreach($modulos as $m)
															<option value="{{ $m->id }}" {{ isset($row) && $row->id_modulo == $m->id ? 'selected="selected"' : null }} data-icon=""> {{ $m->modulo }} </option>
														@endforeach
													</select>
												</div>
											</div>
										</div> --}}
										<!-- END Input[Login] -->

										{{-- <!-- BEGIN Input[Status] -->
										<div class="row">
											<div class="col s12 mb-1">
												<label class="left" style="cursor: pointer; display: flex; align-items: center;">
													<input type="checkbox" name="status" value="0" {{ isset($row) && $row->status === '0' ? 'checked="checked"' : null }}>
													<i class="material-icons" style="width: auto !important;">lock</i>
													<span style="font-size: 1rem; margin-left: 20px; color: #000">Bloquear menu</span>
												</label>
											</div>
										</div>
										<!-- END Input[Status] --> --}}

									</div>

									{{-- <div id="informacoes_menu_items">

										<div class="row">
											<div class="col s12 mt-3 mb-3">
												<h6>Estrutura do Menu</h6>
											</div>
										</div>

										<div class="row">
											<div class="col s4">

												<!-- BEGIN Input[Nome] -->
												<div class="row">
													<div class="col s12 mb-1">
														<div class="input-field">
															<label class="grey-text" for="titulo"> Nome do menu </label>
															<input type="text" name="titulo" id="titulo" value="{{ isset($row) ? $row->titulo : null }}" autofocus="autofocus">
														</div>
													</div>
												</div>
												<!-- END Input[Nome] -->

												<!-- BEGIN Input[Login] -->
												<div class="row">
													<div class="col s12 mb-1">
														<div class="input-field">
															<label class="grey-text" for="modulo"> Módulos </label>
															<select name="modulo" multiple="multiple">
																<option value="" disabled="disabled" {{ !isset($row) ? 'selected="selected"' : null }}> Vincular módulos </option>
																@foreach($modulos as $m)
																	<option value="{{ $m->id }}" {{ isset($row) && $row->id_modulo == $m->id ? 'selected="selected"' : null }} data-icon=""> {{ $m->modulo }} </option>
																@endforeach
															</select>
														</div>
													</div>
												</div>
												<!-- END Input[Login] -->

											</div>

										</div>

									</div> --}}

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
