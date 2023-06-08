{? $records = [] ?}

@if ($controllers->total() > 0)

	@foreach ($controllers as $row)
		<div class="grid-row" data-trigger="modal" data-target="modal_controller" data-id="{{ $row->id }}" data-href="{{ route('admin.modulos.controller.edit', ['id_modulo' => $row->id_modulo, 'id_controller' => $row->id]) }}" data-disabled="true">
			<div class="grid-col">
				<label>
					<input type="checkbox" name="id[]" class="filled-in" value="{{ $row->id }}" data-status="{{ $row->status }}">
					<span></span>
				</label>
			</div>
			<div class="grid-col left-align">{{ $row->nome }}</div>
			<div class="grid-col left-align">{{ $row->controller }}</div>
			<div class="grid-col left-align">{{ $row->descricao }}</div>
			<div class="grid-col left-align">{{ $row->restrict }}</div>
			<div class="grid-col left-align">{{ $row->status }}</div>
			<div class="grid-col left-align">
				<button type="button" class="btn btn-small btn-edit btn-floating waves-effect blue-text transparent" data-trigger="modal" data-target="modal_controller" data-id="{{ $row->id }}" data-href="{{ route('admin.modulos.controller.edit', ['id_modulo' => $row->id_modulo, 'id_controller' => $row->id]) }}">
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
