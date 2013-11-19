/*Place all the behaviors and hooks related to the matching controller here.*/
// All this logic will automatically be available in application.js.
$(document).ready(function() {
	//$('.quantity').val('How many?')



	$('.add-to-cart-button').click(function () {
		var quantity_text_box = $(this).siblings('.quantity');
		var value = quantity_text_box.val();

		var value_int = parseInt(value);

		//var product_id = "pass this in with a button click"
		if (value_int > 0) {
			$.post('/store/add_cart', {
				quantity : value_int
				product_id : product_id
			});
		} else {
			alert(value_int + 'is not a number');
		}
	});
});

		//quantity_text_box.val(1);

		//alert('Oooo your kitties will be so happy! You ordered '+ value);
		

/*$('.add-to-cart-button').mouseover(function () {
	alert('Please buy me for your kitties!');
	}); */