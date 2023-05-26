<div class="col s6">

			<!-- BEGIN form -->
			<form novalidate action="{{ route('admin.modulos.post') }}" method="post" autocomplete="off">

				<div class="card">

					<div class="card-content no-padding">

						<div class="card-title pl-2 pt-2 pb-1">
							Informações do módulo
						</div>

						<div class="card-body fixed-height border-top scroller pt-3 pb-4" data-hide-x="true" style="height: 30vh;">

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
												<input type="text" name="path" id="path" value="{{ isset($row) ? $row->path : null }}">
												<label class="grey-text" for="path"> Diretório </label>
											</div>
										</div>
									</div>
									<!-- END Input[Login] -->

									<!-- BEGIN Input[Email] -->
									<div class="row">
										<div class="col s12 mb-1">
											<div class="input-field">
												<input type="text" name="namespace" value="{{ isset($row) ? $row->namespace : null }}" id="email">
												<label class="grey-text" for="namespace"> Namespace </label>
											</div>
										</div>
									</div>
									<!-- END Input[Email] -->

									<!-- BEGIN Input[Senha] -->
									<div class="row">
										<div class="col s12 mb-1">
											<div class="input-field">
												<label class="grey-text" for="restrict"> Restrito? </label>
												<input type="text" name="restrict" id="restrict" value="{{ isset($row) ? $row->restrict : null }}">
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
