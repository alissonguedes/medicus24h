<div id="table_controllers" class="table grid bordered">
	<div class="grid-head">
		<div class="grid grid-row">
			<div class="grid-col" data-disabled="true" data-width="20fr">
				<label class="grey-text text-darken-2 font-14 left">
					<input type="checkbox" name="check-all" id="check-all" class="filled-in">
					<span></span>
				</label>
			</div>
			<div class="grid-col" data-disabled="true" data-width="100fr">
				<span class="direction">Name</span>
			</div>
			<div class="grid-col" data-disabled="true" data-width="150fr">
				<span class="direction">Descrição</span>
			</div>
			<div class="grid-col" data-disabled="true" data-width="50fr">
				<span class="direction">Restrito</span>
			</div>
			<div class="grid-col" data-disabled="true" data-width="50fr">
				<span class="direction">Status</span>
			</div>
			<div class="grid-col center-align" data-disabled="true" data-width="50fr">
				<span>Ação</span>
			</div>
		</div>
	</div>
	<div class="grid grid-body">
		<div class="scroller" style="height: calc(100vh - 290px)" data-propagation="true">
			@include('admin.controllers.list')
		</div>
	</div>
</div>
