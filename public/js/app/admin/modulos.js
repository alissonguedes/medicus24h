$('input.controller_name').bind('keyup', function(e) {

	var text = $(this).val();
	var value = toCamelCase(text).split(/\W/).join('');
	var controller = text.length > 0 ? value + 'Controller' : text;
	var filename = $('#filename').text()

	$('.controller_name').text(controller + '.php').val(value);
	$('input[name="controller"]').val(controller);
	$('input[name="filename"]').val(filename.trim());

});
