$(function(){var e=(new Pikaday({field:document.getElementById("start_date"),firstDay:1,minDate:moment().toDate(),format:"M/D/YYYY"}),new Pikaday({field:document.getElementById("end_date"),firstDay:1,minDate:moment().toDate(),format:"M/D/YYYY"}));$(".number-validate").keypress(function(e){var t;return t=void 0,t=e.which,46===t?!0:8===t?!0:9===t?!0:11===t?!0:t>=48&&57>=t?!0:!1}),$(".main-content").length>0&&$(".homepage").addClass("highlight-selected"),$(".pagination").length>0&&$(".reserve-highlight").addClass("highlight-selected"),$(".reserve-high").length>0&&$(".reserve-highlight").addClass("highlight-selected"),$(".resources-high").length>0&&$(".resources-highlight").addClass("highlight-selected"),$(".contact-high").length>0&&$(".contact-highlight").addClass("highlight-selected"),$(".about-high").length>0&&$(".about-highlight").addClass("highlight-selected"),$("#start_date").on("change",function(t){var h=t.currentTarget.value,a=moment(h,"M/D/YYYY"),i=a.add(2,"d");e.setMoment(moment(i,"M/D/YYYY"))})});