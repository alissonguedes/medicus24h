{? $records = [] ?}

@if ($paginate->total() > 0)

	@foreach ($paginate as $row)
		<div class="grid-row" data-url="{{ route('clinica.exames.edit', $row->id) }}" data-trigger="modal" data-target="modal_exame" data-disabled="true">
			<div class="grid-col">
				<label>
					<input type="checkbox" name="id[]" class="filled-in" value="{{ $row->id }}" data-status="{{ $row->status }}">
					<span></span>
				</label>
			</div>
			<div class="grid-col">
				<span>{{ $row->titulo }}</span>
			</div>
			<div class="grid-col left-align">{{ $row->categoria }}</div>
			<div class="grid-col left-align">{{ number_format($row->valor, 2, ',', '.') }}</div>
			<div class="grid-col left-align">{{ $row->status }}</div>
			<div class="grid-col center-align">
				<button data-url="{{ route('clinica.exames.edit', $row->id) }}" data-trigger="modal" data-target="modal_exame" class="btn btn-small btn-edit btn-floating waves-effect blue-text transparent">
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
