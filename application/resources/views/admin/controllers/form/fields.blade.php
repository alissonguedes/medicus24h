<!-- BEGIN Input[Nome] -->
<div class="row">
	<div class="col s12 mb-1">
		<div class="input-field">
			<label class="grey-text" for="nome"> Nome do Controller </label>
			<input type="text" name="nome" id="nome" value="{{ isset($controller) ? $controller->nome : null }}">
		</div>
	</div>
</div>
<!-- END Input[Nome] -->

<!-- BEGIN Input[Login] -->
<div class="row">
	<div class="col s12 mb-1">
		<div class="input-field">
			<label class="grey-text active" for="filename"> Arquivo Original </label>
			<div class="input-group">
				<span class="input-group-item first">{{ $row->namespace }}</span>
				<input type="text" name="file" class="controller_name" value="{{ isset($controller) ? limpa_string($controller->modulo, null, false) : null }}" placeholder="">
				<span class="input-group-item last">Controller.php</span>
				<input type="hidden" name="controller" class="" value="{{ isset($controller) ? $controller->namespace : null }}">
				<input type="hidden" name="filename" value="{{ isset($controller) ? limpa_string($controller->modulo, null, false) : null }}">
			</div>
		</div>
		<small class="left-align">
			<small class="left" style="padding: 3px 0 3px; margin-right: 5px;">Arquivo:</small>
			<small class="badge grey lighten-2 left black-text border-radius" style="padding: 3px; border-radius: 3px;">
				{{ isset($row) ? $row->namespace : null }}<span class="controller_name">{{ isset($controller) ? limpa_string($controller->modulo, null, false) . 'Controller.php' : null }}</span>
			</small>
		</small>
	</div>
</div>
<!-- END Input[Login] -->

<!-- BEGIN Input[Email] -->
<div class="row">
	<div class="col s12 mb-1">
		<div class="input-field">
			<label class="grey-text" for="path"> Módulo </label>
			<input type="text" name="modulo" value="{{ isset($controller) ? $controller->modulo : null }}" id="modulo">
		</div>
	</div>
</div>
<!-- END Input[Email] -->

<!-- BEGIN Input[Email] -->
<div class="row">
	<div class="col s12 mb-1">
		<div class="input-field">
			<label class="grey-text" for="path"> Usar Como </label>
			<input type="text" name="use_as" value="{{ isset($controller) ? limpa_string($controller->use_as) : null }}" id="use_as">
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
				<option value="inherit" {{ !isset($controller) || (isset($controller) && $controller->restrict == 'inherit') ? 'selected="selected"' : null }} data-icon=""> Herdado </option>
				<option value="yes" {{ isset($controller) && $controller->restrict == 'yes' ? 'selected="selected"' : null }} data-icon=""> Sim </option>
				<option value="no" {{ isset($controller) && $controller->restrict == 'no' ? 'selected="selected"' : null }} data-icon=""> Não </option>
			</select>
		</div>
	</div>
</div>
<!-- END Input[Senha] -->

<!-- BEGIN Input[Status] -->
<div class="row">
	<div class="col s12 mb-1">
		<label class="left" style="cursor: pointer; display: flex; align-items: center;">
			<input type="checkbox" name="status" value="0" {{ isset($controller) && $controller->status === '0' ? 'checked="checked"' : null }}>
			<i class="material-icons" style="width: auto !important;">lock</i>
			<span style="font-size: 1rem; margin-left: 20px; color: #000">Bloquear Controller</span>
		</label>
	</div>
</div>
<!-- END Input[Status] -->
