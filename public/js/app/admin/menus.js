var chk = [];

$('ul#menu-items').find('li').find(':checkbox').bind('change', function() {

	if ($(this).prop('checked') === true) {
		$('#add-menu').attr('disabled', false);
		chk.push($(this).val());
	} else {
		$('#add-menu').attr('disabled', true);
		removeIndex(chk, $(this).val());
	}

});

$('.remove-menu').bind('click', function() {

	var id = $(this).parents('li').data('id');

	alert(id);

})

$('#add-menu').bind('click', function() {

	var url = $(this).data('url');
	var tipo = $(this).val();

	Http.get(url, {
		datatype: 'html',
		data: {
			id: chk,
			tipo: tipo
		}
	}, (response) => {

		var h = '';
		var ol = $(response).find('.dd-list');

		ol.find('li.dd-item').each(function(index, e) {

			console.log(index, e);

			var id = $(this).data('id');
			var li = $('#estrutura-menu').find('.dd-list').find('li[data-id="' + id + '"]');

			if (li.length == 0)
				$('#estrutura-menu').find('.dd>.dd-list').append(e);

		});

		$('.dd').nestable('serialize');

	});


});

function e(e) {
	var t = e.length ? e : $(e.target),
		a = $('input[name="estrutura"]');

	window.JSON ? a.val(window.JSON.stringify(t.nestable("serialize"))) : a.val("JSON browser support required for this demo.")
}

$('.dd').on('change', e);
