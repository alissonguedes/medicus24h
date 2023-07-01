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

	$('.dd').nestable();

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


	// $('[data-target="modal_controller"]').bind('click', function() {

	// 	var url = $(this).data('href');
	// 	var id = typeof $(this).data('id') !== 'undefined' ? $(this).data('id') : null;
	// 	var target = $('#' + $(this).data('target'));
	// 	var data = {
	// 		'datatype': 'html',
	// 		'data': {
	// 			'id': id,
	// 			'modulo': $('input[name="id"]').val()
	// 		}
	// 	};

	// 	var modal = target.modal({
	// 		onOpenStart: () => {

	// 			var load = `<div class="preloader-wrapper small active" style="margin-right: 20px;">
	// 						<div class="spinner-layer spinner-green-only">
	// 							<div class="circle-clipper left">
	// 								<div class="circle"></div>
	// 							</div>
	// 							<div class="gap-patch">
	// 								<div class="circle"></div>
	// 							</div>
	// 							<div class="circle-clipper right">
	// 								<div class="circle"></div>
	// 							</div>
	// 						</div>
	// 					</div>
	// 					Carregando o formulário. Por favor, aguarde!`;

	// 			var texto = $('<div>', {
	// 				'style': 'display: flex; align-items: center; place-content: center; position: absolute; top: 50%; left: 0; bottom: 50%; right: 0; margin-top: -25px; margin-bottom: -25px; text-align: center;'
	// 			});

	// 			// $modal.find('.modal-content').html($(texto).html(load));
	// 			target.find('form').html($(texto).html(load));

	// 			Http.get(url, data, (response) => {

	// 				form = $(response).find('form').html();

	// 				target.find('form').html(form);

	// 				Materialize.tooltip();
	// 				Materialize.tabs();
	// 				Materialize.select();
	// 				Materialize.modal(target.find('.modal'));
	// 				Scroller.constructor(target);
	// 				Mask.init();

	// 				edit_controller();

	// 			});

	// 		},

	// 		onCloseStart: () => {

	// 			// var url = BASE_URL + 'controllers';
	// 			// var id_modulo = target.find('form').find('input[name="modulo"]').val();

	// 			// var data = {
	// 			// 	datatype: 'html',
	// 			// 	'data': {
	// 			// 		modulo: id_modulo
	// 			// 	}
	// 			// }

	// 			// Http.get(url, data, (response) => {

	// 			// 	$('#table_controllers').find('.grid-body').html(response);

	// 			// 	load_scripts();

	// 			// });


	// 			// target.find('.modal-content').remove();

	// 		}

	// 	});

	// 	var instance = M.Modal.getInstance(modal);
	// 	instance.open();

	// });

}
