{? $records = [] ?}

@if ($menus->total() > 0)

	@foreach ($menus as $row)
		<div class="grid-row" data-trigger="modal" data-target="modal_menu" data-id="{{ $row->id }}" data-href="{{ route('admin.modulos.menus.edit', ['id_modulo' => $modulo->id, 'id_menu' => $row->id]) }}" data-disabled="true">
			<div class="grid-col">
				<label>
					<input type="checkbox" name="id[]" class="filled-in" value="{{ $row->id }}" data-status="{{ $row->status }}">
					<span></span>
				</label>
			</div>
			<div class="grid-col">
				<span>{{ $row->titulo }}</span>
			</div>
			<div class="grid-col left-align">{{ $row->status }}</div>
			<div class="grid-col center-align">
				<button data-href="{{ go('admin.menus.edit', $row->id) }}" class="btn btn-small btn-edit btn-floating waves-effect blue-text transparent">
					<i class="material-symbols-outlined">edit</i>
				</button>
			</div>
		</div>
	@endforeach
@else
	<div class="grid-row no-results">
		<div class="grid-col">
			Nenhum registro encontrado.
		</div>
	</div>

@endif
