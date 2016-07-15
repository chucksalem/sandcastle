$(document).ready(function(){

    $('.search-btn').on('click', function(){
        var code = $('#select-drop').val();
        var guests = $('#guests').val();
        var start_date = $('#start_date').val();
        var end_date = $('#end_date').val();

        if(code != null) {
            window.location = "/accommodations/" + code + "?start_date=" + start_date + "&end_date=" + end_date + "&guests=" + guests;
        }else{
            window.location = "/accommodations";
        }
    });

    var documentWidth = $(window).width();
    if(documentWidth < 680){
        $('.slider5').bxSlider({
            slideWidth: 600,
            minSlides: 1,
            maxSlides: 1
        });
    }else{
        $('.slider5').bxSlider({
            minSlides: 1,
            maxSlides: 1,
            controls: true,
            pager: false,
            nextText: '<img src="assets/right-arrow.png" height="12" width="24"/>',
            prevText: '<img src="assets/left_blue_arrow.png" height="12" width="24"/>'
            //mode: 'fade'
        });
    }

    $('.testimonial-slider').bxSlider({
        slideWidth: 1100,
        minSlides: 1,
        maxSlides: 1,
        slideMargin: 0,
        controls: true,
        pager: false,
        nextText: '<img src="assets/forword-icon.png" height="21" width="40"/>',
        prevText: '<img src="assets/backword-icon.png" height="21" width="40"/>'
    });

    $('.featured-attraction-slider').bxSlider({
        slideWidth: 1100,
        minSlides: 3,
        maxSlides: 3,
        slideMargin: 0,
        controls: true,
        pager: false,
        nextText: '<img src="assets/right-arrow.png" height="12" width="24"/>',
        prevText: '<img src="assets/Left-arrow.png" height="12" width="24"/>'
    });
    $('.navbar-inverse').css('margin-top','21px');
    $('.navbar-toggle').on("click",function () {
        if($(this).hasClass("collapsed")){
            $('.site-header .hero.no-bg').hide();
        }else{
            $('.site-header .hero.no-bg').show();
        }
    });

});

