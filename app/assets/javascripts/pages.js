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
        itemSelector: '.property-img',
        percentPosition: true
    });

    $('.room-book-now').on('click',function(){
        var id = $(this).val();
        var start_date = $('#start_date').val();
        var end_date = $('#end_date').val();
        if (start_date != '' && end_date != '') {
            $('#datepicker-modal').modal('hide');
            window.location = '/booking-form?id='+ id+'&start_date='+ start_date +'&end_date='+ end_date;
        }else{
            $('#datepicker-modal').modal('show');
        }
    });

    $('.slider-book-now').on('click',function(){
        var id = $(this).val();
        var start_date = $('#start_date').val();
        var end_date = $('#end_date').val();
        if (start_date != '' && end_date != '') {
            $('#datepicker-modal').modal('hide');
            window.location = '/booking-form?id='+ id+'&start_date='+ start_date +'&end_date='+ end_date;
        }else{
            $('#datepicker-modal').modal('show');
        }
    });

});

