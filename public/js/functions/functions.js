'use strict';

moment.locale('pt_br', {
	months: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
	monthsShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
	monthsParseExact: true,
	weekdays: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
	weekdaysShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'],
	weekdaysMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'],
	weekdaysParseExact: true,
	longDateFormat: {
		LT: 'HH:mm',
		LTS: 'HH:mm:ss',
		L: 'DD/MM/YYYY',
		LL: 'D MMMM YYYY',
		LLL: 'D MMMM YYYY HH:mm',
		LLLL: 'dddd, D [de] MMMM [de] YYYY, HH:mm:ss',
	},
	calendar: {
		sameDay: '[Hoje, às] LT',
		nextDay: '[Amanhã, às] LT',
		nextWeek: 'dddd [às] LT',
		lastDay: '[Agora, às] LT',
		lastWeek: 'dddd [até] LT',
		sameElse: 'L'
	},
	relativeTime: {
		future: 'em %s',
		past: 'há %s',
		s: 'há alguns segundos',
		m: 'um minuto',
		mm: '%d minutos',
		h: 'uma hora',
		hh: '%d horas',
		d: 'um dia',
		dd: '%d dias',
		M: 'um mês',
		MM: '%d meses',
		y: 'um ano',
		yy: '%d anos'
	},
	dayOfMonthOrdinalParse: /\d{1,2}(er|e)/,
	ordinal: function(number) {
		return number + (number === 1 ? 'er' : 'e');
	},
	meridiemParse: /PD|MD/,
	isPM: function(input) {
		return input.charAt(0) === 'M';
	},
	meridiem: function(hours, minutes, isLower) {
		return hours < 12 ? 'PD' : 'MD';
	},
	week: {
		dow: 1, // Monday is the first day of the week.
		doy: 4 // Used to determine first week of the year.
	}
});

var QuillGetText = (e) => {
	var html = $(e).find('.ql-editor').html();
	var text = $(e).find('.ql-editor').text();
	var name = $(e).attr('id');
	$('input[name="' + name + '"]').val(text ? html : null);
	// $(e).find('.ql-editor').find('p:last-child').each(function() {
	// 	var p = $(this);
	// 	if (!p.text().trim()) p.remove();
	// });
}

var QuillEditor = (e) => {

	var e = e ? e : '.editor';

	$(e).each(function() {

		var editor = this;
		var placeholder = $(editor).data('placeholder') || null;

		var quill = new Quill(editor, {
			modules: {
				toolbar: [
					['bold', 'italic'],
					['underline', 'strike'],
					[{
						'header': 1
					}, {
						'header': 2
					}],
					[{
						'list': 'ordered'
					}, {
						'list': 'bullet'
					}],
					[{
						'script': 'sub'
					}, {
						'script': 'super'
					}],
					[{
						'indent': '-1'
					}, {
						'indent': '+1'
					}],
					[{
						'align': []
					}],
					['clean']
				]
			},
			placeholder: placeholder,
			theme: 'snow'
		});

		var input = $(editor).attr('id');

		$(editor).parent().append($('<input>', {
			'type': 'hidden',
			'name': input
		}))

		if ($(editor).find('.ql-editor').text())
			quill.root.innerHTML = quill.getText();

		$(this).on('keyup keypress keydown', function() {

			var is_blank = $(this).text().trim() == '';
			var p = $(this).find('.ql-editor').find('p');

			if (p.length == 1 && is_blank) {
				$(p).parent('.ql-editor').addClass('ql-blank');
				var css = `.ql-editor.ql-blank:before {content: attr(data-placeholder);}`;
				var styleTag = document.createElement('style');
				styleTag.innerHTML = css;
				document.head.insertAdjacentElement('beforeend', styleTag);
			}

		});

		$(this).on('keyup', delay(function() {
			QuillGetText(editor);

			var p = $(this).find('.ql-editor').find('p');
			var is_blank = $(this).text().trim() == '';

			if (p.length == 1 && is_blank) {
				$(p).parent('.ql-editor').addClass('ql-blank');
				var css = `.ql-editor.ql-blank:before {
								    content: attr(data-placeholder);
								}`;
				var styleTag = document.createElement('style');
				styleTag.innerHTML = css;
				document.head.insertAdjacentElement('beforeend', styleTag);
				console.log(css);
			}

			if ($(this).find('.ql-editor').hasClass('.ql-blank')) {
				console.log(quill.root);
			}

		}, 300));

		QuillGetText(editor);

	});

}

var Sidenav = (callback = {
	sidenav: null,
	openStart: null,
	openEnd: null,
	closeStart: null,
	closeEnd: null
}) => {

	// Detalhes de Atendimento
	var s = callback.sidenav || $('.sidenav:not(.sidenav-main)');

	$(".sidenav").each(function() {

		$(this).sidenav({

			edge: $(this).data('position') || 'left',
			onOpenStart: typeof callback.openStart === 'function' ? callback.openStart : null,
			onOpenEnd: typeof callback.openEnd === 'function' ? callback.openEnd : null,
			onCloseStart: typeof callback.closeStart === 'function' ? callback.closeStart : null,
			onCloseEnd: typeof callback.closeEnd === 'function' ? callback.closeEnd : null,

		});

	});

}

var Buttons = {

	all: () => {

		Buttons.sidenav();
		Buttons.Map();

	},

	Map: () => {


		$('[data-trigger="right-sidebar"]').on('click', function() {

			var sidebar = $('#' + $(this).data('trigger'));
			var target = $(this).data('target');
			var call_function = $(this).data('function');

			if (sidebar.hasClass('open')) return false;

			var s = sidebar.sidenav({

				edge: "right",

				onOpenStart: () => {

					sidebar.addClass('open');

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

					sidebar.find('#right-sidebar-content').html(loading);

					$.ajax({
						'url': $(this).data('url'),
						success: (response) => {

							sidebar.find('#right-sidebar-content').html($(response).html())

							// if (typeof call_function !== 'undefined') {
							// 	var func = call_function + `('${target}')`;
							// 	eval(func);
							// }

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

		});

	},

	sidenav: (button, params) => {

		var button = button || $('[data-trigger="sidenav"]');

		$(button).on('click', function() {

			if (!$(this).data('disabled')) {

				var url = typeof params !== 'undefined' && typeof params.url !== 'undefined' ? params.url : $(this).data('url');
				var div = typeof params !== 'undefined' && typeof params.target !== 'undefined' ? '#' + params.target : '#' + $(this).data('target');
				var target = typeof params !== 'undefined' && typeof params.target !== 'undefined' ? $('#' + params.target) : $('#' + $(this).data('target'))

				var p = {
					url: url,
					div: div,
					target: target
				}

				var url = p.url;
				var target = p.target;
				var div = p.div;

				var t = target.sidenav({

					edge: $(target).data('position') || 'right',

					onOpenStart: () => {

						target.empty().addClass('z-depth-4');;

						$.ajax({
							url: url,
							datatype: 'html',
							method: 'get',
							success: (response) => {

								target.html($(response).find(div).html());

								Request.constructor();
								Materialize.constructor();
								Scroller.constructor();
								controleTime();
								Mask.init();

							},
							error: (response) => {

								$(target).html(
									response
								);

							}
						});

					},

					onOpenEnd: () => {},

					onCloseStart: () => {
						if ($('[data-trigger="cronometro"]').length) {
							$('[data-trigger="cronometro"]').click();
						}
					},

					onCloseEnd: () => {
						target.removeClass('z-depth-4');
					}

				});

				var i = M.Sidenav.getInstance(t);
				i.open();


			}

		})

	}

}
