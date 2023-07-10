@if ($paginate->total() > 0)

	@foreach ($paginate as $row)
		<div class="grid-row" data-href="{{ route('core.tickets.edit', $row->number) }}">
			<div class="grid-col" data-disabled="true" data-width="20fr">
				<label>
					<input type="checkbox" name="id[]" class="filled-in" value="{{ $row->id }}" data-status="{{ $row->status }}">
					<span></span>
				</label>
			</div>
			<div class="grid-col" data-width="20fr">
				@if (isset($row->priority))
					@php
						$priority = $row->priority;
						$color = $row->priority_color;
					@endphp
				@endif
				<a data-tooltip="Prioridade {{ $priority ?? 'Baixa' }}" @isset($color) style="color: {{ $color }} !important;" @endisset>
					<i class="@isset($priority) material-icons @else material-icons-outlined @endisset" style="position: relative; top: 5px;">flag</i>
				</a>
			</div>
			<div class="grid-col" data-width="100fr">
				<span>{{ $row->subject }}</span>
			</div>
			<div class="grid-col" data-width="100fr">{{ $row->department }}</div>
			<div class="grid-col" data-width="100fr">{{ $row->lastupdate }}</div>
			<div class="grid-col" data-width="60fr">{{ $row->status }}</div>
		</div>
	@endforeach
@else
	<div class="grid-row no-results">
		<div class="grid-col">
			Nenhum registro encontrado.
		</div>
	</div>

@endif
