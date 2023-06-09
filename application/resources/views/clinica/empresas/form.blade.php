@extends('clinica.body')

@section('prev-url', route('clinica.clinicas.index'))

@section('title', 'Clínicas')

@section('main')

	<div class="container pt-1">
		<div class="row">
			<div class="col s12">
				<form action="{{ go('clinica.clinicas.post') }}" method="post" enctype="multipart/form-data" autocomplete="random-string" novalidate>

					@if ($row)
						<input type="hidden" name="id" value="{{ $row->id }}">
						<input type="hidden" name="_method" value="put">
					@endif

					<div class="card">
						<div class="card-content no-padding">

							<div class="card-title pl-2 pt-2">
								Adicionar clínica
							</div>

							<div id="tabs">
								<ul class="tabs">
									<li class="tab col m3"><a href="#dados_fiscais">Dados Fiscais</a></li>
									<li class="tab col m3"><a href="#departamentos">Departamentos</a></li>
									<li class="tab col m2"><a href="#informacoes_endereco">Endereço</a></li>
									<li class="tab col m2"><a href="#informacoes_contato">Contato</a></li>
									<li class="tab col m2"><a href="#outras_informacoes">Outros</a></li>
								</ul>
							</div>

							<div class="card-body fixed-height border-top scroller" data-hide-x="true">

								<div class="row">

									<div class="col s12 m10 l10 offset-m2 offset-l1">

										<!-- BEGIN #dados_fiscais -->
										<div id="dados_fiscais">
											<div class="row">
												<div class="col s12 mt-3 mb-3">
													<h6>Dados Fiscais</h6>
												</div>
											</div>
											<div class="row">
												<div class="col s12 m2">
													<div class="foto circle flex flex-column flex-center mt-5">
														<div class="preview z-depth-4">
															<img src="{{ asset($row->logomarca ?? 'img/avatar/capa.jpg') }}" alt="" style="{{ isset($row) && empty($row->logomarca) ? 'opacity: 0.1; filter: grayscale(1);' : null }}">
														</div>
														<div class="change-photo btn btn-floating z-depth-3 waves-effect blue lighten-1" data-tooltip="Alterar imagem">
															<label for="logomarca" class="material-icons white-text cursor-pointer" style="line-height: inherit;">photo_camera</label>
															<input type="file" name="logomarca" id="logomarca" style="position: absolute; left: 0; top: 0; bottom: 0; opacity: 0; z-index: -1; cursor: pointer;">
														</div>
													</div>
												</div>
												<div class="col s12 m10 l10">
													<div class="row">
														<div class="col s12 m6">
															<div class="input-field">
																<label for="razao_social">Razão Social</label>
																<input type="text" name="razao_social" id="razao_social" value="{{ $row->razao_social ?? null }}" autocapitalize="true">
															</div>
														</div>
														<div class="col s12 m6">
															<div class="input-field">
																{{-- <label for="nome_fantasia">Nome Fantasia</label>
															<input type="text" name="nome_fantasia" id="nome_fantasia" value="{{ $row->nome_fantasia ?? null }}" autocapitalize="true"> --}}
																<label for="titulo">Descrição</label>
																<input type="text" name="titulo" id="titulo" value="{{ $row->titulo ?? null }}" autocapitalize="true">
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col s12 m4">
															<div class="input-field">
																<label for="cnpj">CNPJ</label>
																<input type="tel" name="cnpj" id="cnpj" data-mask="cnpj" value="{{ $row->cnpj ?? null }}">
															</div>
														</div>
														<div class="col s12 m4">
															<div class="input-field">
																<label for="inscricao_estadual">Inscrição Estadual</label>
																<input type="tel" name="inscricao_estadual" id="inscricao_estadual" value="{{ $row->inscricao_estadual ?? null }}">
															</div>
														</div>
														<div class="col s12 m4">
															<div class="input-field">
																<label for="inscricao_municipal">Inscrição Municipal</label>
																<input type="tel" name="inscricao_municipal" id="inscricao_municipal" value="{{ $row->inscricao_municipal ?? null }}">
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- END #dados_fiscais -->

										<!-- BEGIN #departamentos -->
										<div id="departamentos">
											<div class="row">
												<div class="col s12 mt-3 mb-3">
													<h6>Atribuir Departamentos</h6>
												</div>
											</div>
											<div class="row">
												<div class="col s12 m12 l12">
													<div class="input-field">
														<table class="table dataTable" data-ajax="false">
															<thead>
																<tr>
																	<th>
																		<label>
																			<input type="checkbox" name="check-all" id="check-all" class="filled-in">
																			<span></span>
																		</label>
																	</th>
																	<th>Departamento</th>
																	<th>Descrição</th>
																</tr>
															</thead>
															<tbody>
																{{-- @if (isset($row)) --}}
																@php
																	$departamento_model = new App\Models\DepartamentoModel();
																@endphp
																{{-- @endif --}}

																@foreach ($departamentos as $departamento)
																	{{-- @if (isset($row)) --}}
																	@php
																		$depto = isset($row) ? $departamento_model->getDepartamentoEmpresa($row->id, $departamento->id) : null;
																		$checked = isset($depto) && $departamento->id === $depto->id ? 'checked=checked' : null;
																	@endphp
																	<tr>
																		<td>
																			<label>
																				<input type="checkbox" name="departamento[]" class="filled-in" value="{{ $departamento->id }}" data-status="{{ $departamento->status }}" {{ $checked ?? null }}>
																				<span></span>
																			</label>
																		</td>
																		<td>{{ $departamento->titulo }}</td>
																		<td>{{ $departamento->descricao }}</td>
																	</tr>
																	{{-- @endif --}}
																@endforeach

															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<!-- END #departamentos -->


										<!-- BEGIN #informacoes_endereco -->
										<div id="informacoes_endereco">
											<div class="row">
												<div class="col s12 mt-3 mb-3">
													<h6>Endereço</h6>
												</div>
											</div>
											<div class="row">
												<div class="col s12 m3 l3">
													<div class="input-field">
														<label for="cep">CEP</label>
														<input type="tel" name="cep" id="cep" data-mask="cep" value="{{ $row->cep ?? null }}">
													</div>
												</div>
												<div class="col s18 m6 l6">
													<div class="input-field">
														<label for="logradouro">Logradouro</label>
														<input type="text" name="logradouro" id="logradouro" value="{{ $row->logradouro ?? null }}">
													</div>
												</div>
												<div class="col s4 m3 l3">
													<div class="input-field">
														<label for="numero">Número</label>
														<input type="tel" name="numero" id="numero" value="{{ $row->numero ?? null }}">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col s12 m6 l6">
													<div class="input-field">
														<label for="complemento">Complemento</label>
														<input type="text" name="complemento" id="complemento" value="{{ $row->complemento ?? null }}">
													</div>
												</div>
												<div class="col s12 m6 l6">
													<div class="input-field">
														<label for="bairro">Bairro</label>
														<input type="text" name="bairro" id="bairro" value="{{ $row->bairro ?? null }}">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col s12 m5 l5">
													<div class="input-field">
														<label for="cidade">Cidade</label>
														<input type="text" name="cidade" id="cidade" value="{{ $row->cidade ?? null }}">
													</div>
												</div>
												<div class="col s12 m3 l3">
													<div class="input-field">
														<label for="uf">UF</label>
														<input type="text" name="uf" id="uf" value="{{ $row->uf ?? null }}">
													</div>
												</div>
												<div class="col s12 m4 l4">
													<div class="input-field">
														<label for="pais">País</label>
														<input type="text" name="pais" id="pais" value="{{ $row->pais ?? null }}">
													</div>
												</div>
											</div>
										</div>
										<!-- END #informacoes_endereco -->

										<!-- BEGIN #informacoes_contato -->
										<div id="informacoes_contato">
											<div class="row">
												<div class="col s12 mt-3 mb-3">
													<h6>Informações de contato</h6>
												</div>
											</div>
											<div class="row">
												<div class="col s12 m6 l4">
													<div class="input-field">
														<label for="email">E-mail</label>
														<input type="email" name="email" id="email" value="{{ $row->email ?? null }}">
													</div>
												</div>
												<div class="col s12 m3 l4">
													<div class="input-field">
														<label for="telefone">Telefone</label>
														<input type="tel" name="telefone" id="telefone" value="{{ $row->telefone ?? null }}" data-mask="phone">
													</div>
												</div>
												<div class="col s12 m3 l4">
													<div class="input-field">
														<label for="celular">Celular</label>
														<input type="tel" name="celular" id="celular" value="{{ $row->celular ?? null }}" data-mask="celular">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col s12 mt-2 mb-3">
													<h6>Redes Sociais</h6>
												</div>
											</div>
											<div class="row">
												<div class="col s12 m3 l4">
													<div class="input-field">
														<label for="instagram">Instagram</label>
														<input type="tel" name="instagram" id="instagram" value="{{ $row->instagram ?? null }}">
													</div>
												</div>
												<div class="col s12 m3 l4">
													<div class="input-field">
														<label for="facebook">Facebook</label>
														<input type="tel" name="facebook" id="facebook" value="{{ $row->facebook ?? null }}">
													</div>
												</div>
												<div class="col s12 m3 l4">
													<div class="input-field">
														<label for="youtube">YouTube</label>
														<input type="tel" name="youtube" id="youtube" value="{{ $row->youtube ?? null }}">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col s12">
													<div class="input-field">
														<label for="gmaps">Mapa</label>
														<input type="tel" name="gmaps" id="gmaps" value="{{ $row->gmaps ?? null }}">
													</div>
												</div>
											</div>
										</div>
										<!-- END #informacoes_contato -->

										<!-- BEGIN #outras_informacoes -->
										<div id="outras_informacoes">
											<div class="row">
												<div class="col s12 mt-3 mb-3">
													<h6>Outras informações</h6>
												</div>
											</div>
											<div class="row">
												<div class="col s12 m2 l12 mb-4">
													<div class="input-field">
														<label class="active">Imagem de apresentação</label>
													</div>
													<div class="foto capa flex flex-column flex-center mt-5">
														<div class="preview z-depth-4">
															<img src="{{ asset($row->imagem ?? 'img/avatar/capa.jpg') }}" alt="" style="{{ isset($row) && empty($row->imagem) ? 'opacity: 0.1;filter: grayscale(1);' : null }}">
														</div>
														<div class="change-photo btn btn-large btn-floating z-depth-3 waves-effect blue lighten-1" data-tooltip="Alterar imagem">
															<label for="imagem" class="material-icons white-text cursor-pointer" style="line-height: inherit;">photo_camera</label>
															<input type="file" name="imagem" id="imagem" style="position: absolute; left: 0; top: 0; bottom: 0; opacity: 0; z-index: -1; cursor: pointer">
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col s12 m4 l4">
													<label for="status" class="active blue-text text-accent-1">Clinica ativa</label>
													<div class="switch mt-3" id="status">
														<label>
															Off
															<input type="checkbox" name="status" id="status" value="1" {{ !$row || ($row && ($row->status == '1' || $row->status == 'Ativo')) ? 'checked=checked' : null }}>
															<span class="lever"></span>
															On
														</label>
													</div>
												</div>
											</div>
											<!-- END #outras_informacoes -->
										</div>

									</div>

								</div>

							</div>

						</div>

						<div class="card-action right-align">

							<button type="reset" class="btn white black-text waves-effect mr-2" data-tooltip="Voltar" data-href="{{ go('clinica.clinicas.index') }}">
								<i class="material-icons-outlined">arrow_back</i>
							</button>

							<button type="submit" class="btn green waves-effect" data-tooltip="Salvar">
								<i class="material-icons-outlined">save</i>
							</button>

						</div>

					</div>

				</form>
			</div>
		</div>
	</div>

@endsection
