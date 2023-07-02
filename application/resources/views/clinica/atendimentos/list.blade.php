@php
	use App\Models\PermissaoModel;
@endphp

@if ($paginate->total() > 0)

	@php
		$permissao = new PermissaoModel();
		$permissao = true;
		$disabled = !$permissao ? true : false;
	@endphp

	@foreach ($paginate as $ind => $row)
		<div class="grid-row {{ $row->status === '0' ? 'blocked' : null }}" data-trigger="sidenav" id="{{ $row->id }}" data-url="{{ go('clinica.atendimentos.detalhes', $row->id) }}" data-target="atendimento" data-disabled="true">
			<div class="grid-col left-align"> {{ date('H:i', strtotime($row->hora_agendada)) }} </div>
			<div class="grid-col left-align"> {{ $row->paciente }} </div>
			<div class="grid-col left-align"> {{ $row->medico }} </div>
			<div class="grid-col left-align"> {{ $row->tipo_atendimento }} </div>
			<div class="grid-col left-align"> {{ $row->convenio ?? 'Particular' }} </div>
			<div class="grid-col left-align"> {{ $row->status ?? 'Particular' }} </div>
		</div>
	@endforeach
@else
	<div class="grid-row no-results">
		<div class="grid-col">
			Nenhum registro encontrado.
		</div>
	</div>

@endif
