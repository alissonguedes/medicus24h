{? $records = [] ?}

@if($paginate->total() > 0)

	@foreach($paginate as $row)

		<div class="grid-row" data-url="{{ go('clinica.categorias.exames.edit', $row->id) }}" data-trigger="modal" data-target="modal_tipo_exame" data-disabled="true">
			<div class="grid-col">
				<label>
					<input type="checkbox" name="id[]" class="filled-in" value="{{ $row->id }}" data-status="{{ $row->status }}">
					<span></span>
				</label>
			</div>
			<div class="grid-col">
				<span>{{ $row->titulo }}</span>
			</div>
			<div class="grid-col left-align">{{ $row->classificacao }}</div>
			<div class="grid-col left-align">{{ $row->status === '0' ? 'Inativo' : 'Ativo' }}</div>
			<div class="grid-col center-align">
				<button data-url="{{ go('clinica.categorias.exames.edit', $row->id) }}" data-trigger="modal" data-target="modal_tipo_exame" class="btn btn-small btn-edit btn-floating waves-effect blue-text transparent">
					<i class="material-symbols-outlined">edit</i>
				</button>
			</div>
		</div>

	@endforeach

@else

	<div id="pagination">

		<ul>

			<li>
				<button class="btn btn-flat btn-floating waves-effect" data-href="{{ !$paginate->onFirstPage() ? $paginate->previousPageUrl() : '#' }}" data-tooltip="Anterior" {{ $paginate->onFirstPage() ? 'disabled' : null }}>
					<i class="material-icons">keyboard_arrow_left</i>
				</button>
			</li>

			<li>
				<button class="btn btn-flat btn-floating waves-effect" data-href="{{ $paginate->currentPage() < $paginate->lastPage() ? $paginate->nextPageUrl() : '#' }}" data-tooltip="Próxima" {{ $paginate->currentPage() === $paginate->lastPage() ? 'disabled' : null }}>
					<i class="material-icons">keyboard_arrow_right</i>
				</button>
			</li>

		</ul>

	</div>

	<div id="info">
		<button data-href="#" class="btn btn-flat waves-effect">
			{{ $paginate->firstItem() }} - {{ $paginate->lastItem() }} de {{ $paginate->total() }}
		</button>
	</div>

	<div class="no-results white-text center-align">
		Nenhum registro encontrado.
	</div>

	<div id="pagination"></div>

	<div id="info"></div>

@endif
