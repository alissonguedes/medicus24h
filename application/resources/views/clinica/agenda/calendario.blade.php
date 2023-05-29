<div id="agenda_medica" data-position="right" style="padding: 25px;">

	<div class="animated slow fadeIn scroller" style="height: calc(100vh - 30px);" data-hide-x="true">

		<div class="row">

			<div class="col s12">

				<div class="card">
					<div class="card-content">
						<div class="input-field">
							<label for="filtro-medico">Médico</label>
							<input type="text" name="filtro_medico">
						</div>
					</div>
				</div>

			</div>

		</div>

		<div class="row">

			<div class="col s12">

				<div class="card">

					<div class="card-content">

						<div id="calendario" class="calendario">

							<div style="display: flex; align-items: center;">
								<div class="preloader-wrapper small active" style="margin-right: 20px;">
									<div class="spinner-layer spinner-green-only">
										<div class="circle-clipper left">
											<div class="circle"></div>
										</div>
										<div class="gap-patch">
											<div class="circle"></div>
										</div>
										<div class="circle-clipper right">
											<div class="circle"></div>
										</div>
									</div>
								</div>
								<p class="calendar-loading">
									Carregando o calendário...
								</p>

							</div>

						</div>

					</div>

				</div>

			</div>

		</div>

	</div>

</div>

<!-- END RIGHT SIDEBAR NAV -->


<style>
	thead .fc-scroller {
		overflow-y: hidden !important;
	}
</style>
