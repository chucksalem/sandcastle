$(document).ready(function() {

    $('.search-btn').on('click', function () {
        var rooms = $('#select-drop').val();
        var guests = $('#guests').val();
        var start_date = $('#start_date').val();
        var end_date = $('#end_date').val();
        var date_start = moment(start_date).format("DD-MM-YYYY");
        var date_end = moment(end_date).format("DD-MM-YYYY");
        if (rooms != null) {
            window.location = "/accommodations?rooms="+rooms+"&start_date=" + date_start + "&end_date=" + date_end + "&guests=" + guests;
        } else {
            window.location = "/accommodations";
        }
    });

});