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

    $("#phone_no").mask("9999999999",{placeholder:" "});
    $("#mobile_no").mask("9999999999",{placeholder:" "});

    //Email validation
    jQuery.validator.addMethod('custom_email', (function(value, element) {
        return /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value);
    }), 'Invalid email');

    //Zipcode validation
    jQuery.validator.addMethod("zipcode", function(value, element) {
        return this.optional(element) || /^\d{5}(?:-\d{4})?$/.test(value);
    }, "Please provide a valid zipcode.");

    $('.booking_form').validate({
        rules: {
            first_name: {
                required: true
            },
            last_name: {
                required: true
            },
            'email': {
                required: true,
                custom_email: true
            },
            'confirm_email': {
                required: true,
                custom_email: true,
                equalTo: '[name="email"]'
            },
            phone_no: {
                required: true,
                minlength: 10,
                maxlength: 10
            },
            mobile_no: {
                required: true,
                minlength: 10,
                maxlength: 10
            },
            zip: {
                zipcode: true
            },
            card_number: {
                required: true,
                number: true
            },
            cvc: {
                required: true,
                number: true
            },
            payment_type: {
                required: true
            },
            YEAR: {
                required: true
            },
            MONTH: {
                required: true
            }
        },
        messages: {
            'first_name':'Please enter your first name.',
            'last_name':'Please enter your last name.',
            'email': {
                custom_email: 'Please enter a valid email.'
            },
            'confirm_email': 'Does not match with email address.',
            'phone_no': 'Enter your a valid phone number.',
            'mobile_no': "Enter your a valid mobile number.",
            'zip': {
                zipcode: 'Please enter a valid zipcode.'
            },
            'payment_type': 'Please select payment type.',
            'card_number': 'Please enter a valid card number.',
            'cvc': 'Please enter a valid cvc.',
            'YEAR': 'Please select year.',
            'MONTH': 'Please select month.'
        },
        errorPlacement: function(error, element) {
            error.insertAfter($(element).closest('.form-group'));
        },
        highlight: function(element) {
            return $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
        },
        unhighlight: function(element) {
            return $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
        },
        errorElement: 'span',
        errorClass: 'help-block'
    });

    $('#btn-request-booking').on('click',function(){
        var id = $(this).val().split('-');
        var start_date = $('#start_date').val();
        var end_date = $('#end_date').val();
        if (start_date != '' && end_date != '') {
            window.location = 'http://bookings.oceano-rentals.com/Booking/RateDetails/'+id[1]+'?arrive='+ start_date +'&depart='+ end_date+'&adults=1';
        }
    });

});

