<div id="modal_exame" class="modal modal-fixed-footer" data-dismissible="false">
	<form action="{{ go('clinica.exames.post') }}" method="post" enctype="multipart/form-data" autocomplete="off" novalidade>

		@if(isset($row))
			<input type="hidden" name="_method" value="put">
			<input type="hidden" name="id" value="{{ $row->id }}">
		@endif

		<div class="modal-content scroller">

			<div class="row">
				<div class="col s12 mb-3">
					<h5>Cadastro do Exame</h5>
				</div>
			</div>

			<div class="row">

				<div class="col s12 m6 l6">
					<div class="input-field">
						<label for="titulo" class="{{ isset($row) && $row->titulo ? 'active' : null }}">Nome do exame</label>
						<input type="text" name="titulo" id="titulo" value="{{ $row->titulo ?? null }}">
					</div>
				</div>

				<div class="col s12 m6 l6">
					<div class="input-field">
						<label for="valor" class="{{ isset($row) && $row->valor ? 'active' : 'active' }}">Valor</label>
						<input type="tel" name="valor" id="valor" data-mask="decimal" data-onevent="keydown" data-align="right" maxlength="16" value="{{ isset($row) ? number_format($row->valor, 2, ',', '.') : '0,00' }}">
					</div>
				</div>

			</div>

			<div class="row">
				<div class="col s12">
					<div class="input-field">
						<label for="descricao" class="{{ isset($row) && $row->descricao ? 'active' : null }}">Descrição</label>
						<textarea name="descricao" id="descricao" class="materialize-textarea">{{ $row->descricao ?? null }}</textarea>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col s12">
					<div class="input-field">
						<label for="categoria" class="active">Tipo de exame</label>
						<select name="categoria" id="categoria">
							<option value="1" selected>Informe o tipo de exame</option>
							@if(isset($categorias))
								@foreach($funcoes as $categoria)
									<option value="{{ $categoria->id }}" {{ isset($row) && $categoria->id==$row->id_categoria ? 'selected=selected' : null }}>{{ $categoria->descricao }}</option>
								@endforeach
							@endif
						</select>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col s12 m4 l4">
					<label for="status" class="active blue-text text-accent-1">Exame ativo</label>
					<div class="switch mt-3" id="status">
						<label>
							Não
							<input type="checkbox" name="status" id="status" value="1" {{ !isset($row) || ($row && $row->status == '1') ? 'checked=checked' : null }}>
							<span class="lever"></span>
							Sim
						</label>
					</div>
				</div>
			</div>

		</div>

		<div class="modal-footer">
			<button type="reset" class="btn modal-close white waves-effect mr-2" data-tooltip="Voltar">
				<i class="material-icons-outlined black-text">arrow_back</i>
			</button>
			<button type="submit" class="btn green waves-effect" data-tooltip="Salvar">
				<i class="material-icons-outlined">save</i>
			</button>
		</div>

	</form>

</div>
