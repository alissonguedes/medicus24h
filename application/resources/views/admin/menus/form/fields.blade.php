<!-- BEGIN Input[Nome] -->
<div class="row">
	<div class="col s12 mb-1">
		<div class="input-field">
			<label class="grey-text" for="modulo"> Nome do menu </label>
			<input type="text" name="titulo" id="titulo" value="{{ isset($row) ? $row->titulo : null }}" autofocus="autofocus">
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
