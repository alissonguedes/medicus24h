{{-- {? $records = [] ?}

@php
	use App\Models\PermissaoModel;
@endphp

@if ($paginate->total() > 0)

	@php
		$permissao = new PermissaoModel();
		$permissao = $permissao->getPermissao('clinica.especialidades.edit');
		$disabled = !$permissao ? true : false;
	@endphp

	@foreach ($paginate as $ind => $row)
		<tr class="{{ $row->status === '0' ? 'blocked' : null }}" style="position: relative;" id="{{ $row->id }}" data-url="{{ go('clinica.especialidades.edit', $row->id) }}" data-trigger="modal" data-target="modal_especialidade" data-disabled="false">
			<td width="1%" data-disabled="true">
				<label>
					<input type="checkbox" name="id[]" class="filled-in" value="{{ $row->id }}" data-status="{{ $row->status }}">
					<span></span>
				</label>
			</td>
			<td width="25%">
				{{ $row->especialidade }}
			</td>
			<td width="15%">
				<p @if ($row->descricao) data-tooltip="{{ $row->descricao }}" @endif>
					{{ $row->descricao }}
				</p>
			</td>
			<td class="center-align" width="15%">
				{{ $row->data_cadastro }}
			</td>
			<td class="center-align">
				{{ $row->data_atualizacao ?? '-' }}
			</td>
			<td data-disabled="true" width="18%" class="center-align border-rl">
				@if (!$disabled)
					<button type="button" class="btn-small grey lighten-4 btn-floating float-none waves-effect" name="edit" value="{{ $row->id }}" data-link="{{ go('clinica.especialidades.edit', $row->id) }}" data-target="modal_especialidade" data-tooltip="Editar">
						<i class="material-icons-outlined grey-text">edit</i>
					</button>
				@endif
				@if (!$disabled)
					{? $status = ($row->status === '0' ? '1' : '0'); ?}
					<button type="button" class="btn-small ml-3 mr-3 teal lighten-3 btn-edit btn-floating waves-effect" name="status" value="{{ $status }}" data-link="{{ go('clinica.especialidades.patch', 'status', $row->id) }}" data-tooltip="{{ $status === '0' ? 'Bloquear' : 'Desbloquear' }}" data-method="patch">
						<i class="material-icons white-text">{{ $row->status === '1' ? 'lock' : 'lock_open' }}</i>
					</button>
				@endif
				@if (!$disabled)
					<button type="button" class="btn-small red lighten-3 btn-floating excluir waves-effect" value="{{ $row->id }}" data-link="{{ go('clinica.especialidades.delete', $row->id) }}" data-tooltip="Excluir" data-method="delete">
						<i class="material-icons-outlined white-text">delete</i>
					</button>
				@endif
			</td>
		</tr>
	@endforeach

	<div id="pagination">

		<ul>

			<li>
				<button class="btn btn-flat btn-floating waves-effect" data-tooltip="Anterior" data-href="{{ !$paginate->onFirstPage() ? $paginate->previousPageUrl() : '#' }}" {{ $paginate->onFirstPage() ? 'disabled' : null }}>
					<i class="material-icons">keyboard_arrow_left</i>
				</button>
			</li>

			<li>
				<button class="btn btn-flat btn-floating waves-effect" data-tooltip="Próxima" data-href="{{ $paginate->currentPage() < $paginate->lastPage() ? $paginate->nextPageUrl() : '#' }}" {{ $paginate->currentPage() === $paginate->lastPage() ? 'disabled' : null }}>
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

@else

	<tr data-disabled="true">
		<td colspan="6">
			Nenhum registro encontrado.
		</td>
	</tr>

	<div id="pagination"></div>

	<div id="info"></div>

@endif --}}

@php
	use App\Models\PermissaoModel;
@endphp

@if ($paginate->total() > 0)

	@php
		$permissao = new PermissaoModel();
		$permissao = true;
		// $permissao = $permissao->getPermissao('clinica.medicos.edit');
		$disabled = !$permissao ? true : false;
	@endphp

	@foreach ($paginate as $ind => $row)
		<div class="grid-row {{ $row->status === '0' ? 'blocked' : null }}" id="{{ $row->id }}" data-url="{{ go('clinica.especialidades.edit', $row->id) }}" data-trigger="modal" data-target="modal_especialidade" data-disabled="true">
			<div class="grid-col">
				<label>
					<input type="checkbox" name="id[]" class="filled-in" value="{{ $row->id }}" data-status="{{ $row->status }}">
					<span></span>
				</label>
			</div>
			<div class="grid-col left-align"> {{ $row->especialidade }} </div>
			<div class="grid-col left-align"> {{ $row->descricao }} </div>
			<div class="grid-col left-align"> {{ $row->status === '0' ? 'Inativo' : 'Ativo' }} </div>
			<div class="grid-col center-align">
				<button type="button" class="btn-small grey lighten-4 btn-floating float-none waves-effect" name="edit" value="{{ $row->id }}" data-url="{{ go('clinica.especialidades.edit', $row->id) }}" data-trigger="modal" data-target="modal_especialidade" data-tooltip="Editar">
					<i class="material-icons-outlined grey-text">edit</i>
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
