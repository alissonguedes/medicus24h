'use strict';

var object,
	fn;

function decimal(e) {

	var input = $(e);
	var exp = /^0\,[0-9]{2}$/;

	// var $val = typeof $(this).attr('data-value') !== 'undefined' && $(this).attr('data-value') != null ? $(this).attr('data-value') : '0,00';
	var $class = typeof $(this).attr('data-align') !== 'undefined' && $(this).attr('data-align') != '' ? $(this).attr('data-align') : 'right';

	input.on('keydown', function(e) {

			var v = Mask.exec(this, 'decimal');

			if ($(this).val() == '' || $(this).val() == '0,00' || $(this).val() == '0') {

				if (e.keyCode == 8) {
					$(this).val('0,00');
					e.preventDefault();
					return false;
				}

			}

			if ($(this).val().length <= 2) {
				$(this).val('0' + $(this).val());
			}

			if (Mask.masker.numeric(e.key)) {

				var valor = parseFloat($(this).val().replace(',', '.'));

				if (exp.test($(this).val())) {

					if (valor < 1) {
						$(this).val($(this).val().slice(-2));
					}

				}

			}

		}).on('keyup', function(e) {

			if ($(this).val() == '' || $(this).val() == '0,00' || $(this).val() == '0')
				if (e.keyCode == 8) {
					$(this).val('0,00');
					e.preventDefault();
					return false;
				}

		})
		.attr('placeholder', '0,00')
		.addClass($class + '-align')
		.focus(function() {
			if ($(this).val().length == 0 || $(this).val() == 0)
				$(this).val('0,00');
		}).on('blur', function() {
			if ($(this).val().length == 0 || $(this).val() == 0)
				$(this).val('0,00');
		});

}

var Mask = {

	maxlength: {
		cep: 9,
		cnpj: 18,
		cpf: 14,
		date: 10,
		email: null,
		time: 8,
		credit_card: 19,
		phone: 15,
		celular: 16
	},

	format: {
		cep: /(\d{5}\-(\d{3}))/,
		cnpj: /(\d{2})\.(\d{3})\.(\d{3})\/(\d{4})\-(\d{2})/,
		cpf: /(\d{3})\.(\d{3})\.(\d{3})\-(\d{2})/,
		date: /(([0-2][0-9])|([3][0-1]))\/(([0][0-9])|[1][0-2])\/(\d{4})/,
		email: /^$/,
		time: /(([0-1][0-9])|([2][0-3]))\:([0-5][0-9])(\:[0-5][0-9])?/,
		credit_card: /[(\d{4})(\s)]+/
	},

	input: null,

	exec: (input, mask) => {

		Mask.input = input;
		var m = Mask.masker[mask];

		if (typeof m === 'function') {
			setTimeout(function() {
				Mask.input.value = m(Mask.input.value);
			}, 1);
		} else {
			console.error('Function is not exists! ' + mask + ' não existe em Mask');
			return false;
		}

	},

	apply: (fn, args) => {

		if (typeof fn !== 'undefined' && typeof fn === 'function') {
			return fn(args);
		}

	},

	masker: {

		numeric: (v) => {
			return v.replace(/\D/g, '');
		},

		decimal: (v) => {

			var splitText = v.split('');
			var revertText = splitText.reverse();
			var v2 = revertText.join('');
			var v2 = v2.replace(/\D/g, '');

			if (v2.length <= 2) {
				v2 = v2.replace(/(\d)(\d)/, '$1$2,0');
			} else {
				v2 = v2.replace(/(\d{2})(\d)/, '$1,$2');
			}

			if (v2.length > 6) {

				for (var i = 0; i < v2.length; i++) {
					v2 = v2.replace(/(\d{3})(\d)/, '$1.$2');
				}

			}

			v2 = v2.split('');
			revertText = v2.reverse();
			v2 = revertText.join('');

			return v2;

		},

		string: (v) => {

			return v;

		},

		cpf: (v) => {

			v = v.replace(/\D/g, '');

			v = v.replace(/(\d{3})(\d)/, '$1.$2');
			v = v.replace(/(\d{3})(\d)/, '$1.$2');
			v = v.replace(/(\d{3})(\d{1,2})/, '$1-$2');

			return v;

		},

		cnpj: (v) => {

			v = v.replace(/\D/g, '');

			v = v.replace(/(\d{2})(\d)/, '$1.$2');
			v = v.replace(/(\d{3})(\d)/, '$1.$2');
			v = v.replace(/(\d{3})(\d)/, '$1/$2');
			v = v.replace(/(\d{4})(\d)/, '$1-$2');

			return v;

		},

		cpfcnpj: (v) => {

			if (v.length <= 14) {
				v = Mask.cpf(v);
			} else {
				v = Mask.cnpj(v);
			}

			return v;

		},

		date: (v) => {

			v = v.replace(/\D/g, '');

			v = v.replace(/(\d{2})(\d)/, '$1/$2');
			v = v.replace(/(\d{2})(\d)/, '$1/$2');
			v = v.replace(/(\d{4})(\d)/, '$1/$2');

			return v;

		},

		time: (v) => {

			v = v.replace(/\D/g, '');

			v = v.replace(/(\d{2})(\d)/, '$1:$2');
			v = v.replace(/(\d{2})(\d)/, '$1:$2');

			return v;

		},

		phone: (v) => {

			v = v.replace(/\D/g, '');

			v = v.replace(/(\d{2})(\d)/, '($1) $2');

			if (v.length < 14) {
				v = v.replace(/(\d{4})(\d)/, '$1.$2');
			} else {
				v = v.replace(/(\d{5})(\d)/, '$1.$2');
				v = v.replace(/(\d{1})(\d{2})/, '$1 $2');
			}

			return v;

		},

		celular: (v) => {

			v = v.replace(/\D/g, '');

			v = v.replace(/(\d{2})(\d)/, '($1) $2');
			v = v.replace(/(\d{3})(\d)/, '$1 $2');
			v = v.replace(/(\d{3})(\d)/, '$1 $2');

			return v;

		},

		cep: (v) => {

			v = v.replace(/\D/g, '');

			v = v.replace(/(\d{5})(\d)/, '$1-$2');

			return v;

		},

		email: (v) => {

			return v;

		},

		credit_card: (v, len) => {

			var len = len || 4;
			v = v.replace(/\D/g, '');

			for (var i = 1; i <= 4; i++) {
				v = v.replace(/(\d{4})(\d)/, '$1 $2');
			}

			return v;

		}

	},

	init: () => {

		$('[data-mask]').each(function(e) {

			var mask = $(this).data('mask');
			var maxlength = $(this).attr('maxlength') || Mask.maxlength[mask];
			var placeholder = $(this).attr('placeholder') || null;

			if (maxlength)
				$(this).attr('maxlength', maxlength);

			if (placeholder) {
				$(this).attr('placeholder', placeholder)
					.parent('.input-field')
					.find('label')
					.addClass('active');
			}

			Mask.exec(this, mask, maxlength);

			if ($(this).attr('type') == 'hidden') {

				var text = $(this).val();

				$(this).parent().append($('<label/>', {
					for: mask,
					text: text || 'Não informado',
				}).css({
					'color': text ? 'inherit' : null
				}))

			} else {

				var $on_event = $(this).data('onevent') || 'keyup keypress keydown';

				if (mask == 'decimal') {
					Mask.apply(decimal, this);
				} else {
					$(this).bind($on_event, function(e) {
						Mask.exec(this, mask);
					});
				}

				$(this).bind('keypress keyup keydown', function(e) {

					$(this).parent('.input-field').removeClass('error').find('.error').remove();

					var format = Mask.format[mask];

					if (format && !format.test($(this).val())) {
						$(this).parent('.input-field').addClass('error').append($('<div>', {
							'class': 'error',
							'html': 'Formato inválido.',
						}));
					}

					if (!$(this).val())
						$(this).parent('.input-field').removeClass('error').find('.error').remove();

				});

			}

		});

	}

}
