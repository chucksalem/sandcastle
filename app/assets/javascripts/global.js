$(function(){

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


    $('.facilities-testimonial-slider').bxSlider({
        slideWidth: 1100,
        minSlides: 1,
        maxSlides: 1,
        slideMargin: 0,
        controls: true,
        pager: false,
        nextText: '<img src="assets/facility-testimonial-right-icon.png" height="21" width="40"/>',
        prevText: '<img src="assets/facility-testimonial-left-icon.png" height="21" width="40"/>'
    });

    $('.slider5').bxSlider({
        minSlides: 1,
        maxSlides: 1,
        controls: true,
        pager: false,
        nextText: '<img src="assets/right-arrow.png" height="12" width="24"/>',
        prevText: '<img src="assets/left_blue_arrow.png" height="12" width="24"/>'
        //mode: 'fade'
    });

  var startPicker = new Pikaday({
      field: document.getElementById('start_date'),
      firstDay: 1,
      minDate: moment().toDate(),
      format: 'M/D/YYYY'
  });

  var endPicker = new Pikaday({
      field: document.getElementById('end_date'),
      firstDay: 1,
      minDate: moment().toDate(),
      format: 'M/D/YYYY'
  });

    $('.number-validate').keypress(function(event) {
        var ew;
        ew = void 0;
        ew = event.which;
        if (46 === ew) {
            return true;
        }
        if (8 === ew) {
            return true;
        }
        if (9 === ew) {
            return true;
        }
        if (11 === ew) {
            return true;
        }
        if (48 <= ew && ew <= 57) {
            return true;
        } else {
            return false;
        }
    });
    if ($('.main-content').length > 0)
        $('.homepage').addClass('highlight-selected');
    if ($('.pagination').length > 0)
        $('.reserve-highlight').addClass('highlight-selected');
    if ($('.reserve-high').length > 0)
        $('.reserve-highlight').addClass('highlight-selected');
    if ($('.resources-high').length > 0)
        $('.resources-highlight').addClass('highlight-selected');
    if ($('.contact-high').length > 0)
        $('.contact-highlight').addClass('highlight-selected');
    if ($('.about-high').length > 0)
        $('.about-highlight').addClass('highlight-selected');
  // Update the second date field based on the first field's selected date
  $('#start_date').on("change", function(e) {
    var dateString = e.currentTarget.value;
    var startDate = moment(dateString, 'M/D/YYYY');
    // adds one day to selected start date
    var nextDate = startDate.add(2, 'd');
    // update the second field
    endPicker.setMoment(moment(nextDate, 'M/D/YYYY'));
  });

    $('.contact-form').validate({ // initialize the plugin
        ignore: " ",
        rules:
        {
            firstname: {
                required: true
            },
            lastname: {
                required: true
            },
            emailId: {
                required: true
            }
        }
    });

    $('.about-us-contact-form').validate({ // initialize the plugin
        ignore: " ",
        rules:
        {
            firstname: {
                required: true
            },
            lastname: {
                required: true
            },
            emailId: {
                required: true
            }
        }
    });

    $('.faq-review-feedback').validate({ // initialize the plugin
        ignore: " ",
        rules:
        {
            name: {
                required: true
            },
            phonenumber: {
                required: true
            },
            emailId: {
                required: true
            }
        }
    });
    
    if($('.site-header').hasClass('contact-us-main')){
        $('.site-header').addClass('height-0');
    }
    var nonMobileMaxSlides = 4;
    if(checkMobileDevice()){
        nonMobileMaxSlides = 1;
    }
    $('.hotel-list-slider-main').bxSlider({
        slideWidth: 237.5,
        minSlides   : 1,
        maxSlides: nonMobileMaxSlides,
        controls: true,
        pager: false,
        nextText: '<img src="../assets/other_room_right_arrow.png" height="35" width="20"/>',
        prevText: '<img src="../assets/other_room_left_arrow.png" height="35" width="20"/>'
    });
    var tooltip = function(sliderObj, ui){
        val1            = '<div id="min_range" class="common-font-12">$'+ sliderObj.slider("values", 0) +'</div>';
        val2            = '<div id="max_range" class="common-font-12">$'+ sliderObj.slider("values", 1) +'</div>';
        sliderObj.children('.ui-slider-handle').first().html(val1);
        sliderObj.children('.ui-slider-handle').last().html(val2);
    };

    $( "#slider-range" ).slider({
        range: true,
        min: 1,
        max: 1500,
        values: [ 1, 1500 ],
        slide: function( e, ui ) {
            tooltip($(this),ui);
            // $( "#min-range" ).text( "$" + ui.values[ 0 ]);
            // $( "#max-range" ).text( "$" + ui.values[ 1 ] );
        },
        create:function(e,ui){
            tooltip($(this),ui);
        }
    });

    // $( "#slider-range" ).slider({
    //     range: true,
    //     min: 1,
    //     max: 1500,
    //     values: [ 1, 1500 ],
    //     slide: function( event, ui ) {
    //         // $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
    //         var offset1 = $(this).children('.ui-slider-handle').first().offset();
    //         var offset2 = $(this).children('.ui-slider-handle').last().offset();
    //         $(".tooltip1").css('top',offset1.top).css('left',offset1.left).show();
    //         $(".tooltip2").css('top',offset2.top).css('left',offset2.left).show();
    //         $( "#min-range" ).text( "$" + ui.values[ 0 ]);
    //         $( "#max-range" ).text( "$" + ui.values[ 1 ] );
    //         $('.tooltip1').text( "$" + ui.values[ 0 ]);
    //         $('.tooltip2').text( "$" + ui.values[ 1 ] );
    //     },
    //     stop:function(event,ui){
    //         $(".tooltip").hide();
    //     }
    // });
    // $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
    //     " - $" + $( "#slider-range" ).slider( "values", 1 ) );
    $( "#min-range" ).text( "$" + $( "#slider-range" ).slider( "values", 0 ));
    $( "#max-range" ).text( "$" + $( "#slider-range" ).slider( "values", 1 ) );
    $('.featured-attraction-slider').bxSlider({
        // slideWidth: 1100,
        minSlides: 3,
        maxSlides: 3,
        slideMargin: 0,
        controls: true,
        pager: false,
        nextText: '<img src="assets/right-arrow.png" height="12" width="24"/>',
        prevText: '<img src="assets/Left-arrow.png" height="12" width="24"/>'
    });
});

function isCharacter(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if((charCode == 9) || (charCode == 37) || (charCode == 38) || (charCode == 39) || (charCode == 40) || (charCode == 8) || (charCode == 127) || (charCode == 20) || (charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)) {
        return true;
    }else{
        return false;
    }
}

$('.email').on('keyup', function (){
    var checkEmail = checkValidEmail();
    if(checkEmail){
        $('.invalid-email').css('display','none');
        $('.btn--brown').removeAttr('disabled');
    }else{
        $('.invalid-email').css('display','block');
        $('.btn--brown').attr('disabled',true);
    }
});

function checkValidEmail(){
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    var email = $('.email').val();
    if(!regex.test(email) && (email != '')) {
        return false;
    } else {
        return true;
    }
}

function checkMobileDevice() {
    var isMobile = false; //initiate as false
// device detection
    if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent)

        || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0, 4))) {
        isMobile = true;
    }
    return isMobile;
}