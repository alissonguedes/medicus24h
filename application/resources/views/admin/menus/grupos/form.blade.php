@extends('clinica.layouts.forms')

@section('prev-url', go('admin.menus'))

@if (!isset($row))
	{? $disabled = 'disabled="disabled"'; ?}
@endif

@section('topbar-options')
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

@section('title', (isset($row) ? 'Editar' : 'Novo') . ' menu')

@section('buttons')
	@if (isset($row))
		<button class="btn btn-large excluir waves-effect" value="{{ isset($row) ? $row->id : null }}" data-tooltip="Excluir" data-link="{{ route('admin.menus.delete') }}" style="border: none">
			<i class="material-icons">delete_forever</i>
		</button>
	@endif
@endsection

@section('main')

	<!-- BEGIN form -->
	<form novalidate action="{{ route('admin.menus.post') }}" method="post" autocomplete="off">

		<div class="container">

			<div class="row">

				<div class="col s12 pt-1">

					<div class="card">

						<div class="card-content no-padding">

							<div class="card-title pl-2 pr-2 pt-1">
								{{-- Nome do menu --}}

								<!-- BEGIN Input[Nome] -->
								<div class="row">
									<div class="col s12">
										<div class="input-field">
											<label class="grey-text" for="titulo"> Nome do menu </label>
											<input type="text" name="titulo" id="titulo" value="{{ isset($row) ? $row->titulo : null }}" autofocus="autofocus">
										</div>
									</div>
								</div>
								<!-- END Input[Nome] -->

							</div>

							@if (isset($row))

								<div id="tabs">
									<ul class="tabs">
										<li class="tab col"><a href="#estrutura">Estrutura</a></li>
										<li class="tab col"><a href="#modulo">Módulos</a></li>
										<li class="tab col"><a href="#menus">Permissões</a></li>
									</ul>
								</div>

								<div class="card-body fixed-height border-top pl-3 pr-3" style="position: relative; overflow: hidden; height: calc(100vh - 320px);">

									<!-- BEGIN Estrutura -->
									<div id="estrutura">

										<div class="row">

											<div class="col s4" style="">

												<div class="card-title pt-2 no-margin" style="border-right: 1px solid var(--grey-lighten-2);">
													<h6>Adicionar itens ao menu</h6>
												</div>

												<div class="scroller" data-hide-x="true" style="height: calc(100vh - 360px); border-right: 1px solid var(--grey-lighten-2);">

													<div class="row">

														<div class="col s11">

															<ul class="collapsible z-depth-0">

																<li class="active">

																	<div class="collapsible-header">
																		Páginas
																	</div>

																	<div class="collapsible-body padding-3">

																		<ul id="menu-items" class="mb-6">
																			@if (isset($modulos))
																				@php
																					$controller = new App\Models\ControllerModel();
																				@endphp
																				@foreach ($modulos as $m)
																					<li class="">
																						<label for="" class="bolder">{{ $m->modulo }}</label>
																						<ul>
																							@php
																								$id_modulo = $m->id;
																								$controllers = $controller->getControllers(null, $id_modulo);
																							@endphp
																							@if (isset($controllers))
																								@foreach ($controllers as $c)
																									<li>
																										<label>
																											<input type="checkbox" name="" class="filled-in menu-item" value="{{ $c->id }}">
																											<span>{{ $c->nome }}</span>
																										</label>
																									</li>
																								@endforeach
																							@endif
																						</ul>
																					</li>
																				@endforeach
																			@endif
																		</ul>

																		<div class="row">
																			<div class="col s12">
																				<button type="button" name="add-menu" id="add-menu" value="controller" class="btn right btn-small blue mt-3 waves-effect" disabled="disabled" data-url="{{ route('admin.menus.itens.add') }}">
																					<i class="material-symbols-outlined margin right">
																						keyboard_double_arrow_right
																					</i>
																					<span>Adicionar</span>
																				</button>
																			</div>
																		</div>

																	</div>

																</li>
																<li>
																	<div class="collapsible-header">
																		Posts
																	</div>
																	<div class="collapsible-body">
																		body
																	</div>
																</li>
																<li>
																	<div class="collapsible-header">
																		Link Personalizado </div>
																	<div class="collapsible-body">
																		body
																	</div>
																</li>
																<li>
																	<div class="collapsible-header">
																		Categorias </div>
																	<div class="collapsible-body">
																		body
																	</div>
																</li>
															</ul>
														</div>
													</div>

												</div>

											</div>

											<div class="col s8">

												<div class="card-title pt-2 no-margin">
													<h6>Estrutura do Menu</h6>
												</div>

												<div class="scroller pb-2" data-hide-x="true" style="height: calc(100vh - 360px); border-right: 1px solid var(--grey-lighten-2);">

													@php
														$menuModel = new App\Models\MenuModel();
														$menus = $menuModel->getMenusItens($row->id);
													@endphp

													<div id="estrutura-menu">
														@php echo Nestable($menus); @endphp
													</div>
													<input type="hidden" name="estrutura">

												</div>

												{{-- <!-- BEGIN Input[Nome] -->
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
															@foreach ($modulos as $m)
																<option value="{{ $m->id }}" {{ isset($row) && $row->id_modulo == $m->id ? 'selected="selected"' : null }} data-icon=""> {{ $m->modulo }} </option>
															@endforeach
														</select>
													</div>
												</div>
											</div>
											<!-- END Input[Login] --> --}}

											</div>

										</div>

									</div>
									<!-- END Estrutura -->

									<!-- BEGIN Modulo -->
									<div id="modulo">

										{{-- <!-- BEGIN Input[Login] -->
									<div class="row">
										<div class="col s12 mb-1">
											<div class="input-field">
												<label class="grey-text" for="modulo"> Módulos </label>
												<select name="modulo" multiple="multiple">
													<option value="" disabled="disabled" {{ !isset($row) ? 'selected="selected"' : null }}> Vincular módulos </option>
													@foreach ($modulos as $m)
														<option value="{{ $m->id }}" {{ isset($row) && $row->id_modulo == $m->id ? 'selected="selected"' : null }} data-icon=""> {{ $m->modulo }} </option>
													@endforeach
												</select>
											</div>
										</div>
									</div>
									<!-- END Input[Login] -->

									<!-- BEGIN Input[Status] -->
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
									<!-- END Modulo -->

								</div>

							@endif

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

			</div>

		</div>

	</form>
	<!-- END form -->

@endsection
