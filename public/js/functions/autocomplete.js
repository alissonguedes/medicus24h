'use strict';

var forceFocusFn = function() {
	var searchInput = document.querySelector('.select2-container--open .select2-search__field');
	if (searchInput)
		searchInput.focus(); // focus
};

function autocomplete(element, params) {

	var element = typeof element !== 'undefined' ? $(element) : $('.autocomplete');

	$('body').find(element).each(function() {

		var search = {};
		var url = $(this).data('url');
		var min_results_search = $(this).data('min-results') ? $(this).data('min-results') : 10;

		if (params && typeof params === 'object') {
			for (var i in params) {
				search[i] = params[i];
			}
		}

		$(this).select2({
			minimumInputLength: 0,
			minimumResultsForSearch: min_results_search,
			dropdownAutoWidth: true,
			width: '100%',
			language: {
				inputTooShort: function() {
					return 'Você deve inserir 3 caracteres'
				},
				noResults: function() {
					return 'Nenhum resultado encontrado';
				},
				searching: function() {
					return 'Buscando...';
				},
				errorLoading: function() {
					return 'Houve um erro ao carregar os dados';
				}
			},
			ajax: {
				url: url,
				dataType: 'json',
				delay: 300,
				data: (data) => {

					search['query'] = data.term || null;
					search['page'] = data.page || 1;

					return search;
				},
				processResults: function(data) {

					return {
						results: data.items,
					}
				}
			}
		})

		if (params && typeof params === 'function') {
			params(params);
		}

	});

}

$(document).on('select2:open', () => {
	setTimeout(function() {
		forceFocusFn();
	}, 200)
});
