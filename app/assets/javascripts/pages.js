$(document).ready(function() {

    if($('.hotel-details-panel').is(':has(.property_status)')){
        $("#btn-book-complete").attr("disabled", true);
    }else{
        $("#btn-book-complete").removeAttr("disabled");
    }

    $('#btn-book-complete').on('click' ,function(){
        $(".booking_form").valid();
    });

    $('.room-gallery').isotope({
        itemSelector: '.room-image',
        percentPosition: true
    });
});

