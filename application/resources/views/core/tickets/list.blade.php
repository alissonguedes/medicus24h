@if ($paginate->total() > 0)

	@foreach ($paginate as $row)
		<div class="grid-row" data-href="{{ route('core.tickets.edit', $row->id) }}">
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
				<a data-tooltip="{{ $priority ?? 'Baixa' }}" @isset($color) style="color: {{ $color }} !important;" @endisset>
					<i class="@isset($priority) material-icons @else material-icons-outlined @endisset">flag</i>
				</a>
			</div>
			<div class="grid-col">
				<span>{{ $row->subject }}</span>
			</div>
			<div class="grid-col">{{ $row->department }}</div>
			<div class="grid-col">{{ $row->lastupdate }}</div>
			{{-- <div class="grid-col left-align">{{ $row->status === '0' ? 'Inativo' : 'Ativo' }} --}}
			{{-- <div class="grid-col center-align">
				@if (!$disabled)
					<button type="button" class="btn btn-small grey lighten-4 btn-floating float-none waves-effect" name="edit" value="{{ $row->id }}" data-url="{{ go('clinica.funcionarios.edit', $row->id) }}" data-target="modal_funcionario" data-trigger="modal" data-tooltip="Editar">
						<i class="material-icons-outlined grey-text">edit</i>
					</button>
				@endif
			</div> --}}
		</div>
	@endforeach
@else
	<div class="grid-row no-results">
		<div class="grid-col">
			Nenhum registro encontrado.
		</div>
	</div>

@endif
