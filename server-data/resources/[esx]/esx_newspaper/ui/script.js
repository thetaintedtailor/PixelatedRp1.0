$(function(){
	window.onload = function(e){
		window.addEventListener('message', function(event){

			var item = event.data;
			if (item !== undefined && item.type === "logo") {

				if (item.display === true) {
					$('#logo').delay(0).fadeIn( 0 );
					$('#logo').css("display", "block");
				} else if (item.display === false) {
					$('#logo').fadeOut( 0 );
				}
			}
		});
	};
});