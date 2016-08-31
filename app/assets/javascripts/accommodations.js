$(document).ready(function() {

    $('.search-btn').on('click', function () {
        var rooms = $('#select-drop').val();
        var guests = $('#guests').val();
        var start_date = $('#start_date').val();
        var end_date = $('#end_date').val();
        var date_start = start_date == '' ? moment().format("DD-MM-YYYY") : moment(start_date).format("DD-MM-YYYY")
        var date_end = end_date == '' ? moment().add('days', 3).format("DD-MM-YYYY") : moment(end_date).format("DD-MM-YYYY");
        if (rooms != null) {
            window.location = "/hotellist?rooms="+rooms+"&start_date=" + date_start + "&end_date=" + date_end + "&guests=" + guests;
        } else {
            window.location = "/hotellist";
        }
    });

});