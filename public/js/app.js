'use strict';

window.onload = () => {

	window.addEventListener('popstate', function() {

		Http.get(window.location.href);

	}, true);

	constructor();
	load_scripts();
	progress('out');

}

var constructor = () => {

	Request.constructor();
	Menu.constructor();
	Form.constructor();
	Materialize.constructor();
	Scroller.constructor();
	Datatable.constructor();
	Mask.init();

	login();

	Scroller.toTop();

	Materialize.filters();

	QuillEditor();

	Sidenav();
	Buttons.sidenav();
	// Buttons.Map();

	var o = 0;
	var height = 0;

	// console.log($('.scrollspy').scrollSpy());
	$('.collapsible').collapsible();

	$('[data-trigger="toggle"]').bind('click', function() {

		// var li = $(this).parents('li');
		// var target = $(this).data('trigger');

		// height = li.height();

		// if (!$(this).parents('li').find('.' + target).hasClass('open')) {
		// 	li.parent().find('.open').removeClass('open');
		// 	$(this).addClass('opened')
		// 		.parents('.card-content').addClass('open')
		// 		.find('.' + target).addClass('open');
		// } else {
		// 	$(this).removeClass('opened')
		// 		.parents('.card-content').removeClass('open')
		// 		.find('.' + target).removeClass('open');
		// }

		// li.find('.' + target).toggleClass('open');

		// var li = $(this).parents('li');
		// height = li.height();

		// li.parent().find('.open').removeClass('open');

		// var target = $(this).data('target') || 'toggle';
		// var top = li.find('.' + target + '.open');

		// li.find('.' + target).addClass('open');

		// $(this).toggleClass('opened');

		// o = height - top.offset().top;

		// Scroller.toTop(o);

	});

	// Outros
	// var b = $(".slide-out-right-sidenav-chat").sidenav({
	// 	edge: "right",
	// 	onOpenStart: () => {
	// 		Scroller.constructor(b);
	// 	}
	// });

	// Abre a janela de termos de privacidade e cookies
	// confirm('Aceita os termos de privacidade', '#privacidade')
	var modal = $('#privacidade');
	var m = modal.modal({
		dismissible: false,
		onOpenEnd: () => {

			var button = modal.find('.modal-footer').find('button');

			button.bind('click', function() {

				var id = $(this).attr('id');

				if (id === 'accepted') {
					setCookie('privacidade', 'accepted');
				} else if (id === 'rejected') {
					deleteCookie('privacidade');
				}

				m.modal('close');

			});

		}
	});

	var priv = hasCookie('privacidade') && getCookie('privacidade') === 'accepted';

	if (!priv)
		m.modal('open');

}
