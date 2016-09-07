$(document).ready(function() {

    $('.book-now').on('click', function () {
      window.location = "/booking-form";
    });

    $('.search-hotellist').on('click', function () {
        var rooms = $('#select-rooms').val();
        var start_date = $('#start_date').val();
        var end_date = $('#end_date').val();
        var min_price = $('#min_range').text().replace('$', '');
        var max_price = $('#max_range').text().replace('$', '');
        var date_start = start_date == '' ? moment().format("DD-MM-YYYY") : moment(start_date).format("DD-MM-YYYY")
        var date_end = end_date == '' ? moment().add('days', 3).format("DD-MM-YYYY") : moment(end_date).format("DD-MM-YYYY");
        if (rooms != null) {
            url = "/hotellist";
            data = {rooms: rooms, start_date: date_start, end_date: date_end, min_price: min_price, max_price: max_price};
        } else {
            url = "/hotellist";
            data = {}
        }
        $.ajax({
            url: url,
            data: data,
            method: 'GET',
            success: function(result){
            }
        })
    });
    $('#hotelgrid_view').hide()
    $('#listview').on('click', function () {
        $('#hotelgrid_view').hide()
        $('#gridview').closest('div').removeClass('active-result-view');
        $('#hotellist_view').show()
        $('#listview').closest('div').addClass('active-result-view');
        $('.fa.fa-bars').addClass('active');
        $('.fa.fa-th').removeClass('active');
    });
    $('#gridview').on('click', function () {
        $('#hotellist_view').hide()
        $('#listview').closest('div').removeClass('active-result-view');
        $('#hotelgrid_view').show()
        $('#gridview').closest('div').addClass('active-result-view');
        $('.fa.fa-bars').removeClass('active');
        $('.fa.fa-th').addClass('active');
    });

    function collision($div1, $div2) {
        var x1 = $div1.offset().left;
        var w1 = 40;
        var r1 = x1 + w1;
        var x2 = $div2.offset().left;
        var w2 = 40;
        var r2 = x2 + w2;
        if (r1 < x2 || x1 > r2) return false;
        return true;
    }

// slider call
    $('#slider').slider({
        range: true,
        min: 0,
        max: 1500,
        values: [ 0, 1500 ],
        slide: function(event, ui) {
            $('.ui-slider-handle:eq(0) .price-range-min').html('$' + ui.values[ 0 ]);
            $('.ui-slider-handle:eq(1) .price-range-max').html('$' + ui.values[ 1 ]);
            $('.price-range-both').html('<i>$' + ui.values[ 0 ] + ' - </i>$' + ui.values[ 1 ] );
            if ( ui.values[0] == ui.values[1] ) {
                $('.price-range-both i').css('display', 'none');
            } else {
                $('.price-range-both i').css('display', 'inline');
            }
            if (collision($('.price-range-min'), $('.price-range-max')) == true) {
                $('.price-range-min, .price-range-max').css('opacity', '0');
                $('.price-range-both').css('display', 'block');
            } else {
                $('.price-range-min, .price-range-max').css('opacity', '1');
                $('.price-range-both').css('display', 'none');
            }
        }
    });

    $('.ui-slider-range').append('<span class="price-range-both value"><i>$' + $('#slider').slider('values', 0 ) + ' - </i>' + $('#slider').slider('values', 1 ) + '</span>');
    $('.ui-slider-handle:eq(0)').append('<span class="price-range-min value">$' + $('#slider').slider('values', 0 ) + '</span>');
    $('.ui-slider-handle:eq(1)').append('<span class="price-range-max value">$' + $('#slider').slider('values', 1 ) + '</span>');
    $( "#min-range" ).text( "$" + $( "#slider" ).slider( "values", 0 ));
    $( "#max-range" ).text( "$" + $( "#slider" ).slider( "values", 1 ));
});
