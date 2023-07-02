{? $records = [] ?}

@if ($paginate->total() > 0)

	@foreach ($paginate as $row)
		<div class="grid-row" data-href="{{ route('clinica.usuarios.edit', $row->id) }}" data-disabled="true">
			<div class="grid-col">
				<label>
					<input type="checkbox" name="id[]" class="filled-in" value="{{ $row->id }}" data-status="{{ $row->status }}">
					<span></span>
				</label>
			</div>
			<div class="grid-col">
				<span>{{ $row->nome }}</span>
			</div>
			<div class="grid-col left-align">{{ $row->grupo }}</div>
			<div class="grid-col left-align">{{ $row->email }}</div>
			<div class="grid-col left-align">{{ $row->ultimo_login }}</div>
			<div class="grid-col left-align">{{ $row->status === '0' ? 'Inativo' : 'Ativo' }}</div>
			<div class="grid-col center-align">
				<button data-href="{{ route('clinica.usuarios.edit', $row->id) }}" class="btn btn-small btn-edit btn-floating waves-effect blue-text transparent">
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
