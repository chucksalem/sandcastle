$(document).ready(function() {

    $('.search-btn').on('click', function () {
        var rooms = $('#select-drop').val();
        var guests = $('#guests').val();
        var start_date = $('#start_date').val();
        var end_date = $('#end_date').val();
        if (rooms != null) {
            window.location = "/accommodations?rooms="+rooms+"&start_date=" + start_date + "&end_date=" + end_date + "&guests=" + guests;
        } else {
            window.location = "/accommodations";
        }
    });
});