<div id="modal_tipo_exame" class="modal modal-fixed-footer" data-dismissible="false">
	<form action="{{ go('clinica.categorias.exames.post') }}" method="post" enctype="multipart/form-data" autocomplete="off" novalidade>

		@if(isset($row))
			<input type="hidden" name="_method" value="put">
			<input type="hidden" name="id" value="{{ $row->id }}">
		@endif

		<div class="modal-content scroller">

			<div class="row">
				<div class="col s12 mb-3">
					<h5>Cadastro de Tipos de Exames</h5>
				</div>
			</div>

			<div class="row">
				<div class="col s12">
					<div class="input-field">
						<label for="titulo" class="{{ isset($row) && $row->titulo ? 'active' : null }}">Nome do exame</label>
						<input type="text" name="titulo" id="titulo" value="{{ $row->titulo ?? null }}">
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col s12 m6 l6">
					<div class="input-field">
						<label for="descricao" class="{{ isset($row) && $row->descricao ? 'active' : null }}">Descrição</label>
						<textarea name="descricao" id="descricao" class="materialize-textarea">{{ $row->descricao ?? null }}</textarea>
					</div>
				</div>
				<div class="col s12 m6 l6">
					<div class="input-field">
						<label for="classificacao" class="{{ isset($row) && $row->classificacao ? 'active' : 'active' }}">Classificação</label>
						<input type="text" name="classificacao" id="classificacao" value="{{ $row->classificacao ?? null }}">
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
