{? $records = [] ?}

@if ($paginate->total() > 0)

	@foreach ($paginate as $row)
		<div class="grid-row" data-trigger="modal" data-target="modal_controller" data-href="{{ route('admin.modulos.{id}.add.controller', $row->id) }}" data-disabled="true">
			<div class="grid-col">
				<label>
					<input type="checkbox" name="id[]" class="filled-in" value="{{ $row->id }}" data-status="{{ $row->status }}">
					<span></span>
				</label>
			</div>
			<div class="grid-col left-align">{{ $row->controller }}</div>
			<div class="grid-col left-align">{{ $row->descricao }}</div>
			<div class="grid-col left-align">{{ $row->restrict }}</div>
			<div class="grid-col left-align">{{ $row->status }}</div>
			<div class="grid-col left-align">
				<button data-href="{{ go('admin.modulos.edit', $row->id) }}" class="btn btn-small btn-edit btn-floating waves-effect blue-text transparent">
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
