'use strict';

var link = [
	'a',
	'[href]',
	'[data-href]',
	'.link'
];

var Request = {

	constructor: (element) => {

		var element = typeof element !== 'undefined' ? $(element).find(link.toString()) : $('body').find(link.toString());

		Request.createElement(element);

	},

	isDisabled: (el) => {

		var isDisabled = typeof $(el).data('disabled') !== 'undefined' && ($(el).data('disabled') == true || $(el).data('disabled') != '' || $(el).data('trigger') == 'modal');

		return isDisabled;

	},

	enableOnClick: (el) => {

		el.attr('disabled', false);

	},

	createElement: (element, params = {
		href: null,
		target: null,
		disabled: null
	}) => {

		// var links = link.toString(); // typeof el !== 'undefined' ? el : this.link.toString();
		// var element = typeof element !== 'undefined' ? $(element) : $(element).find(links);

		// console.log(element);
		// element.each(function() {

		// 	if ($(this).hasClass('modal-trigger')) return false;

		element.on('click', function(e) {

			if ($(this).data('trigger') || $(this).data('target')) return false;

			var isEnabled = Request.isDisabled($(this));

			if (!isEnabled) {

				e.preventDefault();

				var href = $(this).data('href') || $(this).attr('href');
				var target = $(this).attr('target') || false;

				if (Request.isLink(href) && !target) {
					Http.get(href);
				} else {
					if (target) {
						if (target == '_self')
							window.location.href = href;
						else if (target == '_top') {
							// retornar links para abrir em iframes
							return null;
						} else
							window.open(href, target);
					}
				}
				// self.enableOnClick($(this));

			}

		});

		// });

	},

	isLink: (href) => {

		if (typeof href === 'undefined' || href == '') return false;

		var url = typeof href.split(BASE_URL).splice(1) !== 'undefined' && href.split(BASE_URL).splice(1).length > 0 ? href.split(BASE_URL).splice(1) : href;
		var isAnchor = /^[jJ]ava[sS]cript(\:[a-z]+)?/i.test(url);
		var isLink = /^#([a-z0-9]+)?/i.test(url);

		return !isAnchor && !isLink;

	},

	refreshUrl: (url) => {

		if (BASE_URL + url !== window.location.href)
			window.history.pushState('', '', url);

	},

}
