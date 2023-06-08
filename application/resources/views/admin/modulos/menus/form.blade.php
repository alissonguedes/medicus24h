<div id="modal_menu" class="modal modal-fixed-footer" data-dismissible="true">
	<form action="{{ go('admin.modulos.menus.post', isset($modulo) ? $modulo->id : null) }}" method="post" enctype="multipart/form-data" autocomplete="off" novalidade style="min-height: 400px;">
		<div class="modal-content">
			@include('admin.menus.form.fields')
		</div>
		<div class="modal-footer">
			<button type="reset" class="btn white black-text mr-3 waves-effect modal-close" data-tooltip="Adicionar Menu">
				<span>Cancelar</span>
			</button>
			<button class="btn green waves-effect" data-tooltip="Adicionar Menu">
				<span>Adicionar</span>
			</button>
		</div>
	</form>
</div>
