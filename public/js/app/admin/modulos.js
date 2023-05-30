function edit_controller() {

	$('[name="nome"],input.controller_name').bind('keyup', function(e) {

		var text = $(this).val();
		var value = toCamelCase(text).split(/\W/).join('');
		var controller = text.length > 0 ? value + 'Controller' : text;
		var filename = $('#filename').text()

		console.log(text, value, controller);

		$('.controller_name').text(controller + '.php').val(value);
		$('input[name="controller"]').val(controller);
		$('input[name="filename"]').val(filename.trim());

	});

}


$('[data-target="modal_controller"]').bind('click', function() {

	var url = $(this).data('href');
	var id = typeof $(this).data('id') !== 'undefined' ? $(this).data('id') : null;
	var target = $('#' + $(this).data('target'));
	var data = {
		'datatype': 'html',
		'data': {
			'id': id,
			'modulo': $('input[name="id"]').val()
		}
	};

	var modal = target.modal({
		onOpenStart: () => {

			var load = `<div class="preloader-wrapper small active" style="margin-right: 20px;">
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
						Carregando o formulário. Por favor, aguarde!`;

			var texto = $('<div>', {
				'style': 'display: flex; align-items: center; place-content: center; position: absolute; top: 50%; left: 0; bottom: 50%; right: 0; margin-top: -25px; margin-bottom: -25px; text-align: center;'
			});

			// $modal.find('.modal-content').html($(texto).html(load));
			target.find('form').html($(texto).html(load));


			Http.get(url, data, (response) => {

				form = $(response).find('form').html();

				target.find('form').html(form);

				Materialize.tooltip();
				Materialize.tabs();
				Materialize.select();
				Materialize.modal(target.find('.modal'));
				Scroller.constructor(target);
				Mask.init();

				edit_controller();

			});

		},

		onCloseStart: () => {

			var url = BASE_URL + 'controllers';
			var id_modulo = target.find('form').find('input[name="modulo"]').val();

			var data = {
				datatype: 'html',
				'data': {
					modulo: id_modulo
				}
			}

			Http.get(url, data, (response) => {

				$('#table_controllers').find('.grid-body').html(response);

				load_scripts();

			});


			target.find('.modal-content').remove();

		}

	});

	var instance = M.Modal.getInstance(modal);
	instance.open();

});
