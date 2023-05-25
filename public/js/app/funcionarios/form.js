// function formFuncionarios() {

autocomplete($('#clinica'), () => {

	$('#clinica').on('change', function() {

		var clinica = $(this).val();

		$('#departamento').val('').attr('disabled', false);

		autocomplete($('#departamento'), {
			'clinica': clinica
		});

	});

});

autocomplete($('#departamento'), {
	'clinica': null
});

// }


$('select[name="funcao"]').on('change', function() {

	if ($(this).val() == 2) {
		$('#dados_medicos').show().find('[disabled]').attr('disabled', false);
	} else {
		$('#dados_medicos').hide().find('input,select').val('').trigger('change');
		$('#dados_medicos').hide().find('input,select').attr('disabled', true);
	}

})
