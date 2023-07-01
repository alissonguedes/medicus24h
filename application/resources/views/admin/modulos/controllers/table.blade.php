<div id="table_controllers" class="table grid bordered" data-url="{{ route('admin.modulos.controller.index', $modulo->id) }}">
	<div class="grid-head">
		<div class="grid grid-row">
			<div class="grid-col" data-disabled="true" data-width="20fr" data-orderable="false">
				<label class="grey-text text-darken-2 font-14 left">
					<input type="checkbox" name="check-all" id="check-all" class="filled-in">
					<span></span>
				</label>
			</div>
			<div class="grid-col" data-width="100fr" data-orderable="false">
				<span class="direction">Nome</span>
			</div>
			<div class="grid-col" data-width="50fr" data-orderable="false">
				<span class="direction">Controller</span>
			</div>
			<div class="grid-col" data-width="50fr" data-orderable="false">
				<span class="direction">Descrição</span>
			</div>
			<div class="grid-col" data-width="50fr" data-orderable="false">
				<span class="direction">Restrito</span>
			</div>
			<div class="grid-col" data-width="50fr" data-orderable="false">
				<span class="direction">Status</span>
			</div>
			<div class="grid-col center-align" data-disabled="true" data-width="50fr" data-orderable="false">
				<span>Ação</span>
			</div>
		</div>
	</div>
	<div class="grid grid-body">
		<div class="scroller" style="height: calc(100vh - 320px)" data-propagation="true">
			@include('admin.modulos.controllers.list')
		</div>
	</div>
</div>
