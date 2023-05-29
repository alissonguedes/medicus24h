$('[name="nome"],[name="file"]').bind('keyup', function (e) {

	var text = $(this).val();
	var value = toCamelCase(text).split(/\s/).join('');
	var controller = text.length > 0 ? value + 'Controller.php' : text;

	$('.controller_name').text(controller).val(value);

});
