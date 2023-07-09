@extends('core.body')

@section('main')
	<div class="container">
		<div class="row">
			<div class="col s8 offset-s2">
				<form action="#">

					<div class="card">

						<div class="card-content">

							<div class="row">
								<div class="col s12 mb-2">
									<h4>Novo Ticket</h4>
								</div>
							</div>

							<div id="change_department">
								<div class="row">
									<div class="col s12">
										<div class="input-field">
											<label for="departamento">Informe o departamento</label>
											<input type="text">
										</div>
									</div>
								</div>
							</div>

						</div>

						<div class="card-action right-align">
							teste
						</div>

					</div>

				</form>
			</div>
		</div>
	</div>
@endsection
