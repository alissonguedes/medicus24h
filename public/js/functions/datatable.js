'use strict';


var Datatable = {

	table: null,
	url: null,
	datatable: null,
	selecteds: [],
	order: 1,
	direction: 'asc',
	query: null,

	constructor: (element) => {

		var table = element ? element : $('.table.grid');

		// redefinindo parâmetros
		Datatable.query = null;
		Datatable.url = null;
		Datatable.datatable = null;
		Datatable.selecteds = [];
		Datatable.order = 1;
		Datatable.direction = 'asc';

		// Datatable.table = element ? element : $('table.dataTable');
		// Datatable.url = Datatable.table.data('url') ? Datatable.table.data('url') : window.location.href;

		table.each(function() {

			Datatable.table = $(this);

			if (!Datatable.table || (typeof Datatable.table.data('ajax') !== 'undefined' && !Datatable.table.data('ajax'))) {
				return false;
			}

			Datatable.url = Datatable.table.data('url') ? Datatable.table.data('url') : window.location.href;

			Datatable.create();
			Datatable.request();
			Datatable.checkbox(Datatable.table);
			Datatable.delete();

		});

	},

	reload: (url) => {
		// if (Datatable.table.length) {
		Datatable.ajax({
			url: url
		});
		// } else {
		// 	Datatable.datatable.draw();
		// }
	},

	request: () => {

		var columns = [];

		Datatable.table
			.find('.grid-head')
			.find('.grid-row')
			.find('.grid-col')
			.each(function(e, i) {

				var column = $(this);
				var isDisabled = $(this).data('disabled') == '' || $(this).data('disabled') === true;

				if (!isDisabled) {

					$(this)
						.parents('.table.grid')
						.find('.grid-body')
						.find('.grid-row')
						.each(function() {

							$(this).find('.grid-col').each(function() {

								if ($(this).index() === column.index()) {

									$(this).on('click', function(e) {

										e.preventDefault();

										var parent = $(this).parents('.grid-row');
										var is_modal = typeof parent.data('trigger') !== 'undefined' && parent.data('trigger') === 'modal' ? parent.data('trigger') : false;

										if (is_modal) {
											var mod = '#' + $(this).parent().data('target');
											var url = parent.data('url') || parent.data('href') || Datatable.url;
											var m = Materialize.modal(mod, url);
											var m = M.Modal.getInstance(m);
											m.open();
										}
										if (parent.hasClass('sidenav-trigger')) {

											alert('teste')

										} else if (parent.data('href')) {

											Http.get($(this).parent('.grid-row').data('href'));

										}

									});

								}
							});

						});

				} else {

					$(this)
						.parents('.table.grid')
						.find('.grid-body')
						.find('.grid-row')
						.each(function() {
							$(this).find('.grid-col').each(function() {
								if ($(this).index() === column.index()) {
									$(this).attr('data-disabled', true);
								}
							});
						});

				}

				columns.push(i);

			});

		var w = [];

		for (var i = 0; i < columns.length; i++) {

			var c = $(columns[i]).data('width');

			if (c) {
				w.push(c);
			}

		}


		if (w.length > 0) {

			var $width = !Datatable.table
				.find('.grid-body')
				.find('.grid-row')
				.hasClass('no-results') ? w.join(' ') : '100%';

			Datatable.table
				.find('.grid-head')
				.find('.grid-row')
				.attr('style', 'grid-template-columns: ' + w.join(' ') + ' !important');

			Datatable.table
				.find('.grid-body')
				.find('.grid-row')
				.attr('style', 'grid-template-columns: ' + $width + ' !important');

		}

	},

	checkbox: (table) => {

		table.find('.grid-head').find(':input:checkbox').on('change', function() {

			if ($(this).prop('checked')) {
				$(this).parents('.table.grid').find('.grid-body').find(':checkbox:not(:disabled)').prop('checked', true).change();
			} else {
				$(this).parents('.table.grid').find('.grid-body').find(':checkbox:not(:disabled)').prop('checked', false).change();
			}

		});

		table.find(':input:checkbox').on('change', function() {

			var checked;
			var checkeds = $(this).parents('.table.grid').find('.grid-body').find(':checkbox:checked:not(:disabled)').length;
			var count_checkboxes = $(this).parents('.table.grid').find('.grid-body').find(':checkbox:not(:disabled)').length;
			var indeterminateCheckbox = document.getElementById($(this).parents('.table.grid').find('.grid-head').find(':input:checkbox').attr('id'));

			if ($(this).is(':checked')) {

				if ($(this).val() != 'on') {
					Datatable.selecteds.push($(this).val());
				}

				$(this).parents('.grid-row').addClass('selected');

			} else {

				$(this).parents('.grid-row').removeClass('selected');

				for (var i = 0; i < Datatable.selecteds.length; i++) {
					if (Datatable.selecteds[i] === $(this).val())
						Datatable.selecteds.splice(i, 1);
				}

			}

			if (checkeds > 0) {

				checked = true;

				if (checkeds === count_checkboxes) {
					indeterminateCheckbox.indeterminate = false;
				} else {
					if (checkeds < count_checkboxes) {
						if (typeof indeterminateCheckbox !== 'undefined' && indeterminateCheckbox !== null) {
							indeterminateCheckbox.indeterminate = true;
						}
					}
				}

			} else {
				indeterminateCheckbox.indeterminate = false;
				checked = false;
			}

			$(this).parents('.table.grid').find('.grid-head').find(':checkbox#check-all').prop('checked', checked);

			if (checked) {
				$('#dropdown-actions').find('#btn-delete')
					.attr('disabled', false)
					.parent('li')
					.removeClass('disabled');
			} else {
				$('#dropdown-actions').find('#btn-delete')
					.attr('disabled', true)
					.parent('li')
					.addClass('disabled');
			}

			if (indeterminateCheckbox.indeterminate) {
				$(indeterminateCheckbox).addClass('indeterminate');
			} else {
				$(indeterminateCheckbox).removeClass('indeterminate');
			}

		});

	},

	ajax: (data) => {

		var LOCATION = data ? data.url : (Datatable.url != null ? Datatable.url : window.location.href);

		var data = !data ? {
			'order': Datatable.order,
			'direction': Datatable.direction,
			'search': Datatable.query,
			'selecteds': Datatable.selecteds
		} : data;

		Http.get(LOCATION, {
			datatype: 'html',
			data
		}, (response) => {

			if (data.url)
				Datatable.table = $('.table.grid[data-url="' + data.url + '"]');

			// $('.grid-body').find('.scroller').html(response);
			if (Datatable.table.find('.scroller').length)
				Datatable.table.find('.scroller').html(response);
			else
				Datatable.table.find('.grid-body').html(response);

			if (Datatable.selecteds.length) {
				for (var i in Datatable.selecteds) {
					$('.grid-body').find(':checkbox[value="' + Datatable.selecteds[i] + '"]').attr('checked', true)
						.parents('.grid-row').addClass('selected');
					// console.log(i, Datatable.selecteds[i]);
				}
			}

			// Datatable.table = $(response).find('.')

			Datatable.request();
			Datatable.checkbox(Datatable.table);

			Mask.init();
			Request.constructor();
			// Materialize.constructor();
			// Scroller.constructor();
			progress('out');

			Materialize.btn_modal(!$('[data-disabled="true"]'));
			Materialize.sidenav();

		});

	},

	create: () => {

		// -----------------------------------------------
		Datatable.table.each(function() {

			$(this).find('.grid-head').find('.grid-col').each(function() {

				var isDisabled = $(this).data('disabled') == '' || $(this).data('disabled') === true;
				var isOrderable = (typeof $(this).data('orderable') !== 'undefined' && $(this).data('orderable') != '' && $(this).data('orderable') === true) || typeof $(this).data('orderable') === 'undefined';

				// console.log(isOrderable);

				if (!isDisabled && isOrderable) {

					var direction = `<div class="sort"></div>`;

					$(this).append(direction);

				}


			}).on('click', function(e) {

				var isDisabled = $(this).data('disabled') == '' || $(this).data('disabled') === true;
				var isOrderable = (typeof $(this).data('orderable') !== 'undefined' && $(this).data('orderable') != '' && $(this).data('orderable') === true) || typeof $(this).data('orderable') === 'undefined';

				// console.log(isOrderable, $(this).data('orderable'));

				if (isDisabled || !isOrderable) {
					return;
				}

				progress('in', 'bar');

				Datatable.url = typeof $(this).parents('.table.grid').data('url') !== 'undefined' ? $(this).parents('.table.grid').data('url') : window.location.href;
				Datatable.order = $(this).index();
				Datatable.direction = $(this).data('order');

				$(this).parent().find('[data-order]').each(function() {
					if (Datatable.order != $(this).index())
						$(this).removeAttr('data-order');
				});

				if ($(this).attr('data-order') == 'asc') {
					Datatable.direction = 'desc';
				} else if (!$(this).attr('data-order') || $(this).data('order') == 'desc') {
					Datatable.direction = 'asc';
				}

				$(this).attr('data-order', Datatable.direction);

				Datatable.ajax();

			});

		});

		// -----------------------------------------------

		// if (typeof Datatable.table.data('ajax') !== 'undefined' && !Datatable.table.data('ajax')) {
		// 	return false;
		// }

		// Datatable.datatable = Datatable.table.DataTable({
		// 	retrieve: true,
		// 	serverSide: true,
		// 	processing: true,
		// 	scrollCollapse: true,
		// 	displayLength: 50,
		// 	ajax: {
		// 		type: 'get',
		// 		dataType: 'html',
		// 		url: Datatable.url,
		// 		beforeSend: () => {
		// 			progress('in', 'bar');
		// 		},
		// 		success: (response) => {

		// 			var parser = new DOMParser();
		// 			var content = parser.parseFromString(response, 'text/html');
		// 			var tr;

		// 			Datatable.table.find('tbody').html(response).find('#pagination, #info').remove();

		// 			Datatable.table.find('tr').each(function() {

		// 				tr = $(this);

		// 				var modal = tr.data('target');
		// 				var is_modal = /^modal_[a-z]+/i.test(modal);
		// 				var disabled = false;

		// 				// Aqui, verifico se a coluna clicada é desabilitada
		// 				$(this).find('td').on('click', function() {
		// 					if ($(this).data('disabled')) {
		// 						disabled = true;
		// 					} else {
		// 						disabled = false;
		// 					}
		// 				});

		// 				// Aqui, modifico a forma como cursor é apresentado,
		// 				// de acordo com a propriedade "disabled"
		// 				if ($(this).data('disabled')) {
		// 					$(this).addClass('disabled').find('td').css({
		// 						'cursor': 'text !important'
		// 					});
		// 				}

		// 				// Aqui, verifico se o evento modal deve ser acionado,
		// 				// ao clicar na linha da tabela
		// 				$(this).on('click', function() {
		// 					if (!disabled && tr.data('target') && is_modal) {
		// 						var mod = '#' + $(this).data('target');
		// 						var url = Datatable.url;
		// 						var m = Materialize.modal(mod, url);
		// 						var m = M.Modal.getInstance(m);
		// 						m.open();
		// 					}
		// 				});

		// 				if (!tr.data('target') && !is_modal) {
		// 					if (!$(this).data('disabled') && !disabled) {
		// 						// Adiciona eventos de click a botões de ação
		// 						Request.constructor($(this));
		// 					}
		// 				}

		// 				// if (!disabled && tr.data('trigger') == 'sidenav') {
		// 				// 	Buttons.sidenav(tr);
		// 				// }

		// 				// Ativa o botão de edição na modal.
		// 				Materialize.btn_modal($(this).find('[data-trigger="modal"]'));

		// 			}).find('td').each(function(e) {

		// 				var disabled = false;

		// 				$(this).bind('click', function(e) {

		// 					if (!$(this).data('disabled')) {

		// 						e.preventDefault();
		// 						Request.createElement($(this).parent('tr'));

		// 						var id = $(this).parent('tr').attr('id');

		// 						if ($(this).parent('tr').hasClass('form-sidenav-trigger') && $('.form-sidenav').length) {

		// 							var data = {
		// 								'url': BASE_URL + 'agendamentos/id/' + id,
		// 								'modal': 'agendamento',
		// 								// 'data': {
		// 								// 	'data': date,
		// 								// 	'hora': hour
		// 								// }
		// 							}

		// 							formSidenav(data);

		// 						} else {

		// 						}

		// 					} else {
		// 						disabled = true;
		// 					}

		// 				});

		// 				if ($(this).parent('tr').data('trigger') != 'modal') {

		// 					if (!$(this).data('disabled')) {

		// 						var params = {
		// 							url: $(this).parent('tr').data('url'),
		// 							target: $(this).parent('tr').data('target'),
		// 						}

		// 						Buttons.sidenav($(this), params);

		// 					} else {

		// 						var btn = $(this).find('[data-trigger="sidenav"]');
		// 						var params = {
		// 							url: btn.data('url'),
		// 							target: btn.data('target'),
		// 						}

		// 						Buttons.sidenav(btn, params);
		// 					}
		// 				}

		// 			});

		// 			var pagination = $(content).find('#pagination').html();
		// 			var info = $(content).find('#info').html();

		// 			Datatable.table.parents('.dataTables_wrapper').find('.dataTables_info').html(info);
		// 			Datatable.table.parents('.dataTables_wrapper').find('.dataTables_paginate').html(pagination).each(function() {
		// 				Request.constructor($(this));
		// 			});

		// 			Datatable.table.parents('.dataTables_wrapper').find('.dataTables_processing').hide();
		// 			progress('out');

		// 		},

		// 		error: (error) => {
		// 			var parser = new DOMParser();
		// 			var response = parser.parseFromString(error.responseText, 'text/html');
		// 			alert('Abra o console do navegador para analisar os erros.', 'Existem erros!!!', 'error');
		// 			console.log(response);
		// 			progress('out');
		// 		}

		// 	},
		// 	// sPaginationType: 'materialize',
		// 	oLanguage: {
		// 		sEmptyTable: 'Nenhum dado encontrado.',
		// 		sInfo: '_START_ - _END_ / _TOTAL_',
		// 		sInfoEmpty: 'Nenhum dado encontrado.',
		// 		sInfoFiltered: '_COUNT_ registro(s) encontrado(s).',
		// 		sInfoPostFix: null,
		// 		sInfoThousands: '.',
		// 		sLengthMenu: '_MENU_',
		// 		sLoadingRecords: 'Carregando...',
		// 		sProcessing: '<div class="progress"></div class="indeterminate"></div></div>',
		// 		sZeroRecords: '',
		// 		sSearch: Datatable.table.data('label') || '',
		// 		sSearchPlaceholder: Datatable.table.data('placeholder') || '',
		// 		oPaginate: {
		// 			sNext: 'Próximo',
		// 			sPrevious: 'Anterior',
		// 			sFirst: 'Primeiro',
		// 			sLast: 'Último',
		// 		},
		// 		order: [Datatable.order, Datatable.direction],
		// 		columnDefs: [{

		// 		}]
		// 	}
		// });

		Datatable.search();

	},

	draw: (value) => {

		if ($('table.dataTable').length) {

			Datatable.datatable.search(value).draw();

		} else {

			Datatable.table.each(function() {

				var url = Datatable.url;

				Datatable.query = value ? value : null;
				Datatable.ajax();

			});

			progress('out');

		}

	},

	search: (input) => {

		var search = input ? $(input) : $('body').find('.dataTable_search');

		if (search) {

			search.bind('keyup paste', delay(function() {
				Datatable.draw(this.value);
			}, 200));

			if (search.val()) {
				Datatable.draw(search.value);
			}

		}

	},

	delete: (input) => {

		$('#dropdown-actions').find('#btn-delete').bind('click', function() {

			var btn = $(this);
			var selecteds = Datatable.selecteds;

			if (selecteds.length > 0) {

				Http.post(window.location.href, {
					data: {
						id: selecteds
					},
					method: 'delete'
				}, (response) => {

					var indeterminateCheckbox = document.getElementById(Datatable.table.find('.grid-head').find(':input:checkbox').attr('id'));
					$(indeterminateCheckbox).removeClass('indeterminate');
					Datatable.draw();
					message(response.message);

				});

			}

		});

	}

}
