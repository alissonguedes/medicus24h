{? $records = [] ?}

@php
	use App\Models\PermissaoModel;
@endphp

@if ($paginate->total() > 0)


	@php
		$permissao = new PermissaoModel();
		$permissao = true;
		// $permissao = $permissao->getPermissao('clinica.funcionarios.edit');
		$disabled = !$permissao ? true : false;
	@endphp

	@foreach ($paginate as $ind => $row)
		<div class="grid-row" data-url="{{ go('clinica.funcionarios.edit', $row->id) }}" data-trigger="modal" data-target="modal_funcionario" data-disabled="true">
			<div class="grid-col">
				<label>
					<input type="checkbox" name="id[]" class="filled-in" value="{{ $row->id }}" data-status="{{ $row->status }}">
					<span></span>
				</label>
			</div>
			<div class="grid-col">
				<span>{{ $row->nome }}</span>
			</div>
			<div class="grid-col">{{ $row->funcao }}</div>
			<div class="grid-col">{{ $row->cpf }}</div>
			{{-- <div class="grid-col left-align">{{ $row->data_cadastro }}</div> --}}
			<div class="grid-col left-align">{{ $row->status === '0' ? 'Inativo' : 'Ativo' }}
			</div>
			<div class="grid-col center-align">
				@if (!$disabled)
					<button type="button" class="btn btn-small grey lighten-4 btn-floating float-none waves-effect" name="edit" value="{{ $row->id }}" data-url="{{ go('clinica.funcionarios.edit', $row->id) }}" data-target="modal_funcionario" data-trigger="modal" data-tooltip="Editar">
						<i class="material-icons-outlined grey-text">edit</i>
					</button>
				@endif
				{{-- @if (!$disabled)
					{? $status = ($row->status === '0' ? '1' : '0'); ?}
					<button type="button" class="btn-small ml-3 mr-3 teal lighten-3 btn-edit btn-floating waves-effect" name="status" value="{{ $status }}" data-url="{{ go('clinica.funcionarios.patch', 'status', $row->id) }}" data-tooltip="{{ $status === '0' ? 'Bloquear' : 'Desbloquear' }}" data-method="patch">
						<i class="material-icons white-text">{{ $row->status === '1' ? 'lock' : 'lock_open' }}</i>
					</button>
				@endif
				@if (!$disabled)
					<button type="button" class="btn-small red lighten-3 btn-floating excluir waves-effect" value="{{ $row->id }}" data-url="{{ go('clinica.funcionarios.delete', $row->id) }}" data-tooltip="Excluir" data-method="delete">
						<i class="material-icons-outlined white-text">delete</i>
					</button>
				@endif --}}
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
