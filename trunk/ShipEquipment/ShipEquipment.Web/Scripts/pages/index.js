
$(window).load(function () {
    $(".iosSlider").iosSlider({
        desktopClickDrag: true,
        snapToChildren: true,
        infiniteSlider: true,
        snapSlideCenter: true,
        navSlideSelector: '.sliderContainer .slideSelectors .item',
        navPrevSelector: ".slideSelectors .prev",
        navNextSelector: ".slideSelectors .next",
        onSlideComplete: slideComplete,
        onSliderLoaded: slideLoad,
        onSlideChange: slideChange,
        autoSlide: true,
        scrollbar: true,
        scrollbarMargin: "0",
        scrollbarBorderRadius: "0",
        keyboardControls: true,
        autoSlideTimer: 4000,
        autoSlideTransTimer: 500
    });
    $(window).resize(function () {
        setHeightBanner();
    });
});

function slideChange(args) {
    $(".sliderContainer .slideSelectors .item").removeClass("selected");
    $(".sliderContainer .slideSelectors .item:eq(" + (args.currentSlideNumber - 1) + ")").addClass("selected");
}
function slideComplete(args) {

    if (!args.slideChanged) return false;

}

function slideLoad(args) {
    setHeightBanner();
    $(".sliderContainer .slideSelectors .item").first().addClass("selected");
    $(args.sliderObject).find('.text1, .text2').attr('style', '');
    slideChange(args);
}
function setHeightBanner() {

    var item = $(".iosSlider .slider .item img").size();
    switch (item) {
        case 0:
            $(".fluidHeight").css("display", "block");
            break;
        case 1:
            $(".slideSelectors").css("display", "none");
            break;
        default:
            var setHeight = $(".slider .item img").height();
            $(".fluidHeight").css("height", setHeight + "px");
            break;
    }

}


$(document).ready(function () {
    $('#horizontalTab1').easyResponsiveTabs({
        type: 'default', //Types: default, vertical, accordion
        width: 'auto', //auto or any width like 600px
        fit: true,   // 100% fit in a container
        closed: 'accordion', // Start closed if in accordion view
        activate: function (event) { // Callback function if tab is switched
            var $tab = $(this);
            var $info = $('#tabInfo');
            var $name = $('span', $info);
            $name.text($tab.text());
            $info.show();
        }
    });

});

$(document).ready(function () {
    $(function () { $(window).scroll(function () { if ($(this).scrollTop() != 0) { $('#top').fadeIn(); } else { $('#top').fadeOut(); } }); $('#top').click(function () { $('body,html').animate({ scrollTop: 0 }, 800); }); });
});

$(document).ready(function () {
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
    var owl = $("#owl");
    owl.owlCarousel({
        items: 4, //10 items above 1000px browser width
        itemsDesktop: [995, 4], //5 items between 1000px and 901px
        itemsDesktopSmall: [767, 3], // betweem 900px and 601px
        itemsTablet: [700, 2], //2 items between 600 and 0
        itemsMobile: [479, 1], // itemsMobile disabled - inherit from itemsTablet option
        navigation: true,
    });
});