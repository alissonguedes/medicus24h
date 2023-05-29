$('[data-trigger="right-sidebar"]').on('click', function() {

	var sidebar = $('#right-sidebar');
	var content = $('#right-sidebar-content');

	if (sidebar.hasClass('open')) return false;

	var s = sidebar.sidenav({

		edge: "right",

		onOpenStart: () => {

			$('#right-sidebar').addClass('open');

			var loading = `<div id="calendar_loading" style="display: flex; align-items: center;">
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
						</div>`;

			content.html(loading);

			$.ajax({
				'url': $(this).data('url'),
				success: (response) => {

					content.html($(response).html())

					var c = $(response).find('#calendario').attr('class');

					var calendarEl = document.getElementById(c);

					var calendar = new FullCalendar.Calendar(calendarEl, {
						headerToolbar: {
							left: 'prev',
							center: 'title',
							right: 'next',
						},
						initialView: 'dayGridMonth',
						handleWindowResize: true,
						height: '350px',
						contentHeight: '350px',
						dayMaxEvents: true,
						fixedWeekCount: false,
						selectable: true,
						selectAllow: true,
						selectMirror: true,
						timeZone: 'America/Sao_Paulo',
						locale: 'pt-br',
						// events: {
						// 	url: BASE_URL + 'agendamentos/eventos',
						// 	method: 'get',
						// 	extraParams: {
						// 		'ajax': true
						// 	},
						// },
						eventContent: (arg) => {
							return {
								html: arg.event.title
							}
						}
					});

					$(response).find('#calendario').find('#calendar_loading').remove();

					calendar.render();

				}

			});


		},

		onCloseStart: () => {

			sidebar.removeClass('open');

		},

		onOpenEnd: (e) => {

			Request.constructor();
			Materialize.constructor();
			Scroller.constructor();
			controleTime();
			Mask.init();

		}

	});

	var i = M.Sidenav.getInstance(s);

	i.open();

})
