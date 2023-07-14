@if ($paginate->total() > 0)

	@foreach ($paginate as $row)
		<div class="grid-row" data-href="{{ route('core.tickets.edit', $row->number) }}" data-disabled="true">
			<div class="grid-col" data-disabled="true">
				<label>
					<input type="checkbox" name="id[]" class="filled-in" value="{{ $row->id }}" data-status="{{ $row->status }}">
					<span></span>
				</label>
			</div>
			<div class="grid-col">
				@if (isset($row->priority))
					@php
						$priority = $row->priority;
						$color = $row->priority_color;
					@endphp
				@endif
				<a data-tooltip="Prioridade {{ $priority ?? 'Baixa' }}">
					<i class="material-symbols-outlined" style="">flag</i>
				</a>
			</div>
			<div class="grid-col">
				<span>{{ $row->subject }}</span>
			</div>
			<div class="grid-col">{{ $row->department }}</div>
			<div class="grid-col">{{ $row->lastupdate }}</div>
			<div class="grid-col">{{ $row->status }}</div>
		</div>
	@endforeach
@else
	<div class="grid-row no-results">
		<div class="grid-col">
			Nenhum registro encontrado.
		</div>
	</div>

@endif
