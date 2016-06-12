var schoolPicker = function() {

  var jsonToHTMLselectOptions = function(object_array, attr) {

  var jsonHTML = ''

  // sometimes the response from the server is an array of objects which is what we want. Other times it is just one object so we cannot iterate with .length. SO this if statement wraps single objects in [] so we can continue to use the same for loop.
  if(typeof(object_array[0]) == 'undefined') {
    object_array = [object_array]
  }

  //Looping through the array of objects
  for (var ii = 0; ii < object_array.length; ii++) {

    // These if statements are needed because we want to output the programs are labeled by sport and the coaches are labeled by first and last name.
    if(attr == 'program') {
      jsonHTML = jsonHTML + '<option value="' + object_array[ii].sport + '">' + object_array[ii].sport + "</option>"
    }
  }
  return jsonHTML
  }


$( document ).on('change', "#user_school_id", function() {
  var school_dpdown_val = $( "#user_school_id" ).val();
  var school_dpdown_text = $( "#user_school_id option:selected").text();

  $.ajax({
        url: '/schools/program_list_in_school',
        type: "GET",
        dataType: "json",
        data: { school_name: school_dpdown_text },
        success: function(response){

          // Like with the schools dropdown. The first row should be 'select program'. I clear it first so that it does not stack everytime the dropdown selection changes
          $("#user_sport").html('')
          $("#user_sport").append("<option value='1'> Select Program </option>")

          //json to html
          $("#user_sport").append(jsonToHTMLselectOptions(response.programs, 'program'))
        }
      });
});
};