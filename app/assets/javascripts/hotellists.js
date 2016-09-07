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

});
