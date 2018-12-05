'use strict';
function notificationAlert(theme, message) {
	var title;
	if (!message) {
		message = 'Ningun mensaje para mostrar...';
	}
	if (!theme) {
		theme = 'success';
	}
	if (!title) {
		title = "Noticia:"
	}
	window.createNotification({
		closeOnClick: true,
		displayCloseButton: true,
		positionClass: 'nfc-bottom-right',
		showDuration: 5000,
		theme: theme
	})({
		title: title,
		message: message
	});
}
