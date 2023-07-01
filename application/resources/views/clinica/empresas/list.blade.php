{? $records = [] ?}

@php
	use App\Models\PermissaoModel;
@endphp

@if ($paginate->total() > 0)

	@php
		$permissao = new PermissaoModel();
		$permissao = $permissao->getPermissao('clinica.clinicas.edit');
		$disabled = !$permissao ? true : false;
	@endphp

	@foreach ($paginate as $ind => $row)
		<div class="grid-row" data-href="{{ route('clinica.clinicas.edit', $row->id) }}" data-disabled="true">
			<div class="grid-col">
				<label>
					<input type="checkbox" name="id[]" class="filled-in" value="{{ $row->id }}" data-status="{{ $row->status }}">
					<span></span>
				</label>
			</div>
			<div class="grid-col left-align"> {{ $row->razao_social }} </div>
			<div class="grid-col left-align"> {{ $row->cnpj }} </div>
			<div class="grid-col left-align"> {{ $row->cidade }} </div>
			<div class="grid-col left-align"> {{ $row->uf }} </div>
			<div class="grid-col left-align"> {{ $row->status === '0' ? 'Inativo' : 'Ativo' }} </div>
			<div class="grid-col center-align">
				<button data-href="{{ route('clinica.clinicas.edit', $row->id) }}" class="btn btn-small btn-edit btn-floating waves-effect blue-text transparent">
					<i class="material-symbols-outlined">edit</i>
				</button>
			</div>
		</div>

		{{-- <tr class="{{ $row->status === '0' ? 'blocked' : null }}" style="position: relative;" id="{{ $row->id }}" data-disabled="false" data-href="{{ go('clinica.clinicas.edit', $row->id) }}">
			<td width="1%" data-disabled="true">
				<label>
					<input type="checkbox" name="id[]" class="filled-in" value="{{ $row->id }}" data-status="{{ $row->status }}">
					<span></span>
				</label>
			</td>
			<td>
				{{ $row->razao_social }}
			</td>
			<td>
				{{ $row->titulo }}
			</td>
			<td>
				{{ $row->cnpj }}
			</td>
			<td class="center-align">
				{{ $row->cidade }}
			</td>
			<td class="center-align">
				{{ $row->uf }}
			</td>
			<td class="center-align">
				{{ $row->data_cadastro }}
			</td>
			<td>
				{{ $row->status === '0' ? 'Inativo' : 'Ativo' }}
			</td>
			<td data-disabled="true" width="18%" class="center-align border-rl">
				@if (!$disabled)
					<button type="button" class="btn-small grey lighten-4 btn-floating float-none waves-effect" name="edit" value="{{ $row->id }}" data-href="{{ go('clinica.clinicas.edit', $row->id) }}" data-tooltip="Editar">
						<i class="material-icons-outlined grey-text">edit</i>
					</button>
				@endif
				@if (!$disabled)
					{? $status = ($row->status === '0' ? '1' : '0'); ?}
					<button type="button" class="btn-small ml-3 mr-3 teal lighten-3 btn-edit btn-floating waves-effect" name="status" value="{{ $status }}" data-url="{{ go('clinica.clinicas.patch', 'status', $row->id) }}" data-tooltip="{{ $status === '0' ? 'Bloquear' : 'Desbloquear' }}" data-method="patch">
						<i class="material-icons white-text">{{ $row->status === '1' ? 'lock' : 'lock_open' }}</i>
					</button>
				@endif
				@if (!$disabled)
					<button type="button" class="btn-small red lighten-3 btn-floating excluir waves-effect" value="{{ $row->id }}" data-url="{{ go('clinica.clinicas.delete', $row->id) }}" data-tooltip="Excluir" data-method="delete">
						<i class="material-icons-outlined white-text">delete</i>
					</button>
				@endif
			</td>
		</tr> --}}
	@endforeach
@else
	<div class="grid-row no-results">
		<div class="grid-col">
			Nenhum registro encontrado.
		</div>
	</div>
@endif
