<div id="modal_controller" class="modal modal-fixed-footer" data-dismissible="true">
	<form action="{{ go('admin.modulos.controller.post', isset($modulo) ? $modulo->id : null) }}" method="post" enctype="multipart/form-data" autocomplete="off" novalidade style="min-height: 400px;">
		<div class="modal-content">
			@include('admin.controllers.form.fields')
		</div>
		<div class="modal-footer">
			<button type="reset" class="btn white black-text mr-3 waves-effect modal-close" data-tooltip="Adicionar Controller">
				<span>Cancelar</span>
			</button>
			<button class="btn green waves-effect" data-tooltip="Adicionar Controller">
				<span>Adicionar</span>
			</button>
		</div>
	</form>
</div>
