<div id="modal_funcionario" class="modal modal-fixed-footer" data-dismissible="false">
	<form action="{{ go('clinica.funcionarios.post') }}" method="post" enctype="multipart/form-data" autocomplete="off" novalidade>

		@if (isset($row))
			<input type="hidden" name="_method" value="put">
			<input type="hidden" name="id" value="{{ $row->id }}">
		@endif

		<div class="modal-content scroller">

			<div class="row">
				<div class="col s12 mb-3">
					<h5>Cadastro do funcionário</h5>
				</div>
			</div>

			<div class="row">
				<div class="col s12">
					<div class="input-field">
						<label for="nome" class="{{ isset($row) && $row->nome ? 'active' : null }}">Funcionário</label>
						<input type="text" name="nome" id="nome" value="{{ $row->nome ?? null }}">
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col s12 m6 l6">
					<div class="input-field">
						<label for="cpf" class="{{ isset($row) && $row->cpf ? 'active' : null }}">CPF</label>
						<input type="tel" name="cpf" id="cpf" data-mask="cpf" value="{{ $row->cpf ?? null }}">
					</div>
				</div>
				<div class="col s12 m6 l6">
					<div class="input-field">
						<label for="rg" class="{{ isset($row) && $row->rg ? 'active' : null }}">RG</label>
						<input type="tel" name="rg" id="rg" value="{{ $row->rg ?? null }}">
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col s12">
					<div class="input-field">
						<label for="funcao" class="active">Função</label>
						<select name="funcao" id="funcao">
							<option value="" disabled selected>Informe a função</option>
							@if (isset($funcoes))
								@foreach ($funcoes as $funcao)
									<option value="{{ $funcao->id }}" {{ isset($row) && $funcao->id == $row->id_funcao ? 'selected=selected' : null }}>{{ $funcao->funcao }}</option>
								@endforeach
							@endif
						</select>
					</div>
				</div>
			</div>

			<div id="dados_medicos" class="row" @if (!isset($row) || (isset($row) && $row->id_funcao !== 2)) style="display: none;" @endif>

				<div class="col s12 m6">
					<div class="input-field">
						<label for="crm" class="{{ isset($row) && $row->crm ? 'active' : null }}">CRM</label>
						<input type="text" name="crm" id="crm" value="{{ $row->crm ?? null }}" @if (!isset($row) || (isset($row) && $row->id_funcao !== 2)) disabled="disabled" @endif>
					</div>
				</div>

				<div class="col s12 m6">
					<div class="input-field">
						<label for="especialidade" class="active">Especialidade</label>
						<select name="especialidade" class="autocomplete" id="especialidade" data-url="{{ go('clinica.especialidades.autocomplete') }}" data-placeholder="Informe a especialidade..." @if (!isset($row) || (isset($row) && $row->id_funcao !== 2)) disabled="disabled" @endif>
							<option value="" disabled>Informe a especialidade</option>
							@if (isset($row) && isset($especialidades))
								@foreach ($especialidades as $especialidade)
									<option value="{{ $especialidade->id }}" {{ isset($row) && $especialidade->id == $row->especialidade ? 'selected=selected' : null }}>{{ $especialidade->especialidade }}</option>
								@endforeach
							@endif
							{{-- @if (isset($row) && isset($row->especialidade))
								<option value="{{ $row->id_especialidade }}" selected>{{ $row->especialidade }}</option>
							@endif --}}
						</select>
					</div>
				</div>

			</div>

			<div class="row">
				<div class="col s12">
					<div class="input-field">
						<label for="clinica" class="active">Clínica</label>
						<select name="clinica" class="autocomplete" id="clinica" data-url="{{ go('clinica.funcionario.autocomplete_clinica') }}" data-placeholder="Informe a clínica...">
						{{-- <select name="clinica" class="autocomplete" id="clinica" data-url="{{ go('clinica.clinicas.autocomplete') }}" data-placeholder="Informe a clínica..."> --}}
							<option value="" disabled selected>Informe a clínica</option>
							@if (isset($row) && isset($clinicas))
								@foreach ($clinicas as $clinica)
									<option value="{{ $clinica->id }}" {{ isset($row) && $clinica->id == $row->id_clinica ? 'selected=selected' : null }}>{{ $clinica->titulo }}</option>
								@endforeach
							@endif
						</select>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col s12">
					<div class="input-field">
						<label for="departamento" class="active">Departamento</label>
						<select name="departamento" class="autocomplete" id="departamento" data-url="{{ go('clinica.departamentos.autocomplete') }}" data-placeholder="Informe o departamento..." @empty($row) disabled="disabled" @endempty>
							<option value="" disabled selected>Informe o departamento</option>
							@if (isset($departamentos))
								@foreach ($departamentos as $departamento)
									<option value="{{ $departamento->id }}" {{ isset($row) && $departamento->id == $row->id_departamento ? 'selected=selected' : null }}>{{ $departamento->titulo }}</option>
								@endforeach
							@endif
						</select>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col s12 m4 l4">
					<label for="status" class="active blue-text text-accent-1">Funcionário ativo</label>
					<div class="switch mt-3" id="status">
						<label>
							Não
							<input type="checkbox" name="status" id="status" value="1" {{ !isset($row) || ($row && $row->status == '1') ? 'checked=checked' : null }}>
							<span class="lever"></span>
							Sim
						</label>
					</div>
				</div>
			</div>
		</div>

		<div class="modal-footer">
			<button type="reset" class="btn modal-close white waves-effect mr-2" data-tooltip="Voltar">
				<i class="material-icons-outlined black-text">arrow_back</i>
			</button>
			<button type="submit" class="btn green waves-effect" data-tooltip="Salvar">
				<i class="material-icons-outlined">save</i>
			</button>
		</div>

	</form>

</div>
