/**
 * Função para criar cookies no site
 */
function setCookie(name, value, duration) {

	var d = new Date();
	d.setTime(d.getTime() + ((duration || 1) * 24 * 60 * 60 * 1000));
	var expires = "expires=" + d.toUTCString();
	var cookie = name + '=' + escape(value) + ((expires) ? '; duration=' + d.toUTCString() + ';path=/' : '');

	document.cookie = cookie;

}

/**
 * Função para verificar o cookie
 */
function getCookie(name) {

	var cookies = document.cookie;
	var prefix = name + '=';
	var begin = cookies.indexOf('; ' + prefix);

	if (begin == -1) {

		begin = cookies.indexOf(prefix);

		if (begin != 0) {
			return null;
		}

	} else {
		begin += 2;
	}

	var end = cookies.indexOf(';', begin);

	if (end == -1) {
		end = cookies.length;
	}

	return unescape(cookies.substring(begin + prefix.length, end));

}

/**
 * Função para verificar se existe um cookie
 */
function hasCookie(name) {
	return getCookie(name) && getCookie(name) != '' && typeof getCookie(name) !== 'undefined' && getCookie(name) !== 'undefined';
}

/**
 * Função para deletar um cookie
 */
function deleteCookie(name) {

	setCookie(name);
	document.cookie = name + '=' + '; expires=Thu, 01-Jan-69 00:00:00 GMT';

}
