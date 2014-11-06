//Banner 
$(document).ready(function () {
 countHeight();
    // show saleProduct
    if ($(window).width() <= 767) {
        $('.boxSale h3').append('<span class="show-click"></span>');
        $('.show-click').click(function () {
            $('.#owl3').slideToggle();
        });
    }
    /******** #newestProdcut, #name, #price, #sale, #bestSeller Dropdowns ********/
    $('#newsProduct, #name, #price, #sale, #bestSeller').click(function () {
        $(this).find('> ul').slideDown('');
        $(this).bind('mouseleave', function () {
            $(this).find('> ul').slideUp('');
        });
    });
});
$(window).resize(function(){ 
	countHeight(); 
});
function countHeight(){
	var defaultHeight= $('header').height();
		if ($(window).width() >=767){
			$('.height').css("height" , defaultHeight);	
			}
	}
//Category	
$(document).ready(function () {
    jQuery("#menu-icon").on("click", function () {
        jQuery(".sf-menu-phone").slideToggle();
        jQuery(this).toggleClass("active");
    });

    jQuery('.sf-menu-phone').find('li.parent').append('<i class="icon-angle-down"></i>');
    jQuery('.sf-menu-phone li.parent i').on("click", function () {
        if (jQuery(this).hasClass('icon-angle-up')) {
            jQuery(this).removeClass('icon-angle-up').parent('li.parent').find('> ul').slideToggle();
        } else {
            jQuery(this).addClass('icon-angle-up').parent('li.parent').find('> ul').slideToggle();
        }
    });
    // scroll body to 0px on click
    jQuery('#back-top a').click(function () {
        jQuery('body,html').animate({
            scrollTop: 0
        }, 800);
        return false;
    });

	/******** Ajax Cart **********/
	$('#cart > .heading').on('click', function() {
		$('#cart .contentCart').slideToggle("10");		
		$('#cart').mouseleave(function() {
			$('#cart .contentCart').slideUp("10");
		});
		
	});

});

$(window).resize(function(){
			if($(window).width()>767){
				$('.nav-list').show()
			}
		});
