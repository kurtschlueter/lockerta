var autoComplete = function() {

  // console.log('entered doc ready')
  $(".school_search").keyup(function(){
    // console.log('entered keyup')

    var input = $(".school_search").val()
    $(".schools_table").empty()

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
  });
};