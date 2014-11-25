$(document).ready(function () {
    $(window).scroll(function () { if ($(this).scrollTop() != 0) { $('#top').fadeIn(); } else { $('#top').fadeOut(); } }); $('#top').click(function () { $('body,html').animate({ scrollTop: 0 }, 800); });

    $(window).scroll(function () {
        if ($(window).scrollTop() > 168) {
            $('.nav').css('position', 'fixed');
            $('.nav').css('top', '0');
            if ($(window).width() > 980) {
                $('.nav').css('background', '#fff');
                $('.nav').css('padding-bottom', '0');
            } else {
                $('.nav').css('background', '#000');
                $('.nav').css('padding-bottom', '0');

            }

        }
        else {
            $('.nav').css('position', 'relative');
            if ($(window).width() > 980) {
                $('.nav').css('background', 'none');
                $('.nav').css('padding-bottom', '30px');
            } else {
                $('.nav').css('background', '#000');
                $('.nav').css('padding-bottom', '0');
            }

        }
    });

    $(window).resize(function () {

        if ($(window).scrollTop() > 168) {
            if ($(window).width() > 980) {
                $('.nav').css('background', '#fff');
                $('.nav').css('padding-bottom', '0');
            } else { $('.nav').css('background', '#000'); $('.nav').css('padding-bottom', '0'); $('.nav-list').css('display', 'none') }

        }
        else {
            $('.nav').css('position', 'relative');
            if ($(window).width() > 980) {
                $('.nav').css('background', 'none');
                $('.nav').css('padding-bottom', '30px');
            } else { $('.nav').css('background', '#000'); $('.nav').css('padding-bottom', '0'); $('.nav-list').css('display', 'none') }

        }
    });
});

$(document).ready(function () {
    var owl = $("#owl1");
    owl.owlCarousel({
        items: 4, //10 items above 1000px browser width
        itemsDesktop: [995, 4], //5 items between 1000px and 901px
        itemsDesktopSmall: [767, 3], // betweem 900px and 601px
        itemsTablet: [700, 2], //2 items between 600 and 0
        itemsMobile: [479, 1], // itemsMobile disabled - inherit from itemsTablet option
        navigation: true,
    });

    var owl = $("#owl2");
    owl.owlCarousel({
        items: 4, //10 items above 1000px browser width
        itemsDesktop: [995, 4], //5 items between 1000px and 901px
        itemsDesktopSmall: [767, 3], // betweem 900px and 601px
        itemsTablet: [700, 2], //2 items between 600 and 0
        itemsMobile: [479, 1], // itemsMobile disabled - inherit from itemsTablet option
        navigation: true,
    });

    var owl = $("#owl3");
    owl.owlCarousel({
        items: 4, //10 items above 1000px browser width
        itemsDesktop: [995, 4], //5 items between 1000px and 901px
        itemsDesktopSmall: [767, 3], // betweem 900px and 601px
        itemsTablet: [700, 2], //2 items between 600 and 0
        itemsMobile: [479, 1], // itemsMobile disabled - inherit from itemsTablet option
        navigation: true,
    });
});

$(document).ready(function () {
    $('#lightGallery, #video-gallery').lightGallery();

    $('.img_detail a').click(function () {
        $('#lightGallery li:first').click();
    })

    $('#lightGallery li').hover(function () {
        var src = $(this).attr('data-src');
        $('.img_detail a img').attr('src', src);
    })
})