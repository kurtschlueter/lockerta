// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/autocomplete
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .


//= require auto_test

$(function() {


  console.log('entered doc ready')
  $(".school_search").keyup(function(){
    console.log('entered keyup')


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

  // new app.Schools;





});