var schoolPicker = function() {


$( document ).on('change', "#session_school_picked", function() {
  var school_dpdown_val = $( "#session_school_picked" ).val();
  var school_dpdown_text = $( "#session_school_picked option:selected").text();

  $.ajax({
        url: '/schools/program_list_in_school',
        type: "GET",
        dataType: "json",
        data: { school_name: school_dpdown_text },
        success: function(response){

          // Like with the schools dropdown. The first row should be 'select program'. I clear it first so that it does not stack everytime the dropdown selection changes
          $("#program_select_user").html('')
          $("#program_select_user").append("<option value='1'> Select Program </option>")

          //json to html
          $("#program_select_user").append(jsonToHTMLselectOptions(response.programs, 'program'))
        }
      });
});
};