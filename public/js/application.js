$(document).ready(function() {

	$('#plus-photo').on('click', function(){
		$('.photo-upload-widget').append('<li><input type="file" name="filename"></li>');
	});
});
