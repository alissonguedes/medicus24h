@extends('core.body')

@section('main')
	<div class="container animated fadeInRight fast" data-animation="fadeOutLeft">

		<div class="row">

			<div class="col s8 offset-s2">

				@if (!isset($row->id))

					<form action="{{ route('core.tickets.post') }}" method="post">

						<div class="card">

							<div class="card-content" style="overflow: hidden; min-height: 300px;">

								<div class="row">
									<div class="col s12 mb-2">
										<h4>Novo Ticket</h4>
									</div>
								</div>

								<div class="" style="min-height: calc(100vh - 400px);">

									<div class="row">
										<div class="col s12">
											<div class="input-field">
												<label for="department">Departamento</label>
												<select name="department" class="autocomplete" id="department" data-url="{{ go('clinica.tickets.departments.autocomplete') }}" data-placeholder="Informe o departamento...">
													@if (isset($row) && $row->dept_id && $row->name)
														<option value="{{ $row->dept_id }}" selected>{{ $row->name }}</option>
													@endif
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col s12">
											<div class="input-field">
												<label for="department">Tópico da solicitação</label>
												<select name="topic" id="topic">
													@if (isset($topics))
														@foreach ($topics as $topic)
															<option value="{{ $topic->topic_id }}">{{ $topic->topic }}</option>
															{{-- @if (isset($row) && $row->dept_id && $row->name)
																	<option value="{{ $row->dept_id }}" selected>{{ $row->name }}</option>
																@endif --}}
														@endforeach
													@endif
												</select>
											</div>
										</div>
									</div>

								</div>

							</div>

							<div class="card-action right-align">

								<button type="reset" class="btn white black-text waves-effect mr-2" data-href="{{ route('core.tickets.index') }}">
									<i class="material-icons-outlined left">arrow_back</i>
									Cancelar
								</button>

								<button type="submit" class="btn green waves-effect">
									Avançar
									<i class="material-icons-outlined right">save</i>
								</button>

							</div>

						</div>

					</form>
				@else
					<form action="{{ route('core.tickets.create', $row->id) }}" method="post">

						<div class="card">

							<div class="card-content" style="overflow: hidden; min-height: 300px;">

								<div class="row">
									<div class="col s12 mb-2">
										<h4>Novo Ticket - <span>{{ $row->number }}</span></h4>
									</div>
								</div>

								<div class="" style="min-height: calc(100vh - 400px);">

									<div class="row">
										<div class="col s12">
											<p>Departamento: {{ $row->department }}</p>
										</div>
									</div>

									<div class="row">
										<div class="col s12">
											<div class="input-field">
												<label for="subject">Título do ticket</label>
												<input type="text" name="subject" id="subject" data-placeholder="Informe o título">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col s12">
											<div class="input-field">
												<label for="body" style="position: relative; top: -5px;">Descrição detalhada</label>
												<div name="body" id="body" class="editor"></div>
											</div>
										</div>
									</div>

								</div>

								<input type="hidden" name="department" value="{{ $row->dept_id }}">
								<input type="hidden" name="id" value="{{ $row->id }}">
								<input type="hidden" name="number" value="{{ $row->number }}">
								<input type="hidden" name="created" value="{{ date('Y-m-d H:i:s', strtotime(str_replace('/', '-', $row->created))) }}">
								<input type="hidden" name="user" value="{{ session()->get('userdata')[session()->get('app_session')]['id'] }}">

							</div>

							<div class="card-action right-align">

								<button type="reset" class="btn white black-text waves-effect mr-2" data-href="{{ route('core.tickets.add') }}">
									<i class="material-icons-outlined left">arrow_back</i>
									Cancelar
								</button>

								<button type="submit" class="btn green waves-effect">
									Avançar
									<i class="material-icons-outlined right">save</i>
								</button>

							</div>

						</div>

					</form>

				@endif

			</div>
		</div>
	</div>
@endsection
