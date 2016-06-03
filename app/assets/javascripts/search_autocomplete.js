var autoComplete = function() {
var delay_in_ms = 500;


  var delay = (function(){
    var timer = 0;
    return function(callback, ms){
      clearTimeout (timer);
      timer = setTimeout(callback, ms);
    };
  })();

$(document).delegate( ".school_search", "keyup", function(e) {
    // console.log('entered keyup')
    e.preventDefault();

// OK I know this isn't dry but I have to move on for now. If the keyup is a backspace, then I want the delay to be zero. If it is anything else, then It should wait 500 ms.

    var key_hit = e.keyCode;
    if (key_hit == 8) {

      delay(function(){
        var input = $(".school_search").val()
        $(".schools_table").empty()

        //If input is empty, hide table.
        if (input == "") {
            $('.schools_table').addClass('hidden')
        } else {
            $('.schools_table').removeClass('hidden')
        }
        $.ajax({
          url: "/schools/search", // Route to the Script Controller method
          type: "GET",
          dataType: "json",
          data: { input: input },
          success: function(data) {
            for (i = 0; i < data.data.length; i++) {
              $(".schools_table").append("<tr class='danger'><td>"+ data.data[i].name+"</td></tr>");
            }
          }
        });
      }, 0);
    } else {

      delay(function(){
        var input = $(".school_search").val()
        $(".schools_table").empty()

        //If input is empty, hide table.
        if (input == "") {
            $('.schools_table').addClass('hidden')
        } else {
            $('.schools_table').removeClass('hidden')
        }
        $.ajax({
          url: "/schools/search", // Route to the Script Controller method
          type: "GET",
          dataType: "json",
          data: { input: input },
          success: function(data) {
            for (i = 0; i < data.data.length; i++) {
              $(".schools_table").append("<tr class='danger'><td>"+ data.data[i].name+"</td></tr>");
            }
          }
        });
      }, 500);
    }
  });
};