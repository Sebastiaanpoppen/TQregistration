$(document).ready(function() {
    // NEW BOOKING

    $('#new-booking').click(addBooking);
    $('#abort-booking-creation').click(function(){
      $('.page-wrapper').fadeOut('slow');
      $('.new-booking').fadeOut('slow');
    });
    $('#create-new-booking').click(checkValues);

    $('.date-picker').each(function () {
        var $datepicker = $(this),
            cur_date = ($datepicker.data('date') ? moment($datepicker.data('date'), "YYYY/MM/dd") : moment());

        function updateDisplay(cur_date) {
            $('#dateinput').val(cur_date);

            $datepicker.find('.date-container > .date > .text').text(cur_date.format('Do'));
            $datepicker.find('.date-container > .month > .text').text(cur_date.format('MMMM'));
            $datepicker.find('.date-container > .year > .text').text(cur_date.format('YYYY'));
            $datepicker.data('date', cur_date.format('YYYY/MM/DD'));
        }

        updateDisplay(moment());

        $datepicker.on('click', '[data-toggle="datepicker"]', function(event) {
            event.preventDefault();

            var cur_date = moment($(this).closest('.date-picker').data('date'), "YYYY/MM/DD"),
                type = ($(this).data('type') ? $(this).data('type') : "date"),
                method = ($(this).data('method') ? $(this).data('method') : "add"),
                amt = ($(this).data('amt') ? $(this).data('amt') : 1);

            if (method == "add") {
                var duration = moment.duration(1,type);
                cur_date = cur_date.add(duration);
            }else if (method == "subtract") {
                cur_date = cur_date.subtract(1,type);
            }

            updateDisplay(cur_date);
        });

    });

});

// ADD SONG

function addBooking(){
  event.preventDefault();
  $('.page-wrapper').fadeIn('slow');
  $('.new-booking').fadeIn('slow');
}
function checkValues(){
    event.preventDefault();
    first_name = $('#first_name').val();
    last_name = $('#last_name').val();

   if((first_name!=="") && (last_name!=="")){
     $('#create-new-song').attr('disabled', 'disabled');
     $('#new-booking-form').submit();
   }else{
     $('#first_name').css({"border-color": "red", "box-shadow": "1px 1px 2px red"});
     $('#last_name').css({"border-color": "red", "box-shadow": "1px 1px 2px red"});
   }
}
