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
	@endforeach
@else
	<div class="grid-row no-results">
		<div class="grid-col">
			Nenhum registro encontrado.
		</div>
	</div>
@endif
