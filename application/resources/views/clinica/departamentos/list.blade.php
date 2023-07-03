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
		<div class="grid-row {{ $row->status === '0' ? 'blocked' : null }}" style="position: relative;" id="{{ $row->id }}" data-url="{{ go('clinica.departamentos.edit', $row->id) }}" data-trigger="modal" data-target="modal_departamento" data-disabled="true">
			<div class="grid-col">
				<label>
					<input type="checkbox" name="id[]" class="filled-in" value="{{ $row->id }}" data-status="{{ $row->status }}">
					<span></span>
				</label>
			</div>
			<div class="grid-col left-align"> {{ $row->titulo }} </div>
			<div class="grid-col left-align"> {{ $row->descricao }} </div>
			<div class="grid-col left-align"> {{ $row->status }} </div>
			<div class="grid-col center-align">
				<button type="button" class="btn-small grey lighten-4 btn-floating float-none waves-effect" name="edit" value="{{ $row->id }}" data-url="{{ go('clinica.departamentos.edit', $row->id) }}" data-trigger="modal" data-target="modal_departamento" data-tooltip="Editar">
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
