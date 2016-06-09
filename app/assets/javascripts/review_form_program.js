var reviewFormProgram = function() {
  console.log('reviewFormProgram function entered')

  var jsonToHTMLselectOptions = function(jsonn, attr) {
    console.log('entered jsontohtmlselectoptions func')
    var jsonHTML = ''
    // debugger
    for (var ii = 0; ii < jsonn.data.length; ii++) {
      console.log('entered for loop')
      if(attr == 'program') {
        jsonHTML = jsonHTML + "<option value='" + (ii+2).toString() + "'>" + jsonn.data[ii].sport + "</option>"
        console.log('entered program')
      }
      if(attr == 'coach') {
        jsonHTML = jsonHTML + "<option value='" + (ii+2).toString() + "'>" + jsonn.data[ii].first_name + " " + jsonn.data[ii].last_name + "</option>"

        console.log('entered coach')
      }
    }
    // debugger
    return jsonHTML
  }

  // WHEN A SCHOOL IS SELECTED OR NOT
  $( "#review_program_select_school_dropdown" ).change(function() {
    var school_dpdown_val = $( "#review_program_select_school_dropdown" ).val();
    var school_dpdown_text = $( "#review_program_select_school_dropdown option:selected").text()

    if (school_dpdown_val != 1) {
      $("#review_program_select_program_div").removeClass('hidden')
      $("#review_program_select_headcoach_div").addClass('hidden')
      $("#review_program_select_rival_div").addClass('hidden')
      $("#review_program_select_toughestplace_div").addClass('hidden')

      $.ajax({
        url: '/schools/program_list_in_school',
        type: "GET",
        dataType: "json",
        data: { school_name: school_dpdown_text },
        success: function(response){
          $("#review_program_select_program_dropdown").html('')
          $("#review_program_select_program_dropdown").append("<option value='1'> Select Program </option>")
          $("#review_program_select_program_dropdown").append(jsonToHTMLselectOptions(response, 'program'))
        }
      });

    } else {
      $("#review_program_select_program_div").addClass('hidden')
      $("#review_program_select_headcoach_div").addClass('hidden')
      $("#review_program_select_rival_div").addClass('hidden')
      $("#review_program_select_toughestplace_div").addClass('hidden')
    }
  });

  // WHEN A PROGRAM IS SELECTED OR NOT
  $( "#review_program_select_program_dropdown" ).change(function() {
    var program_dpdown_val = $( "#review_program_select_program_dropdown" ).val();
    var program_dpdown_text = $( "#review_program_select_program_dropdown option:selected").text()
    var school_dpdown_text = $( "#review_program_select_school_dropdown option:selected").text()

    if (program_dpdown_val != 1) {
      $("#review_program_select_headcoach_div").removeClass('hidden')
      $("#review_program_select_rival_div").removeClass('hidden')
      $("#review_program_select_toughestplace_div").removeClass('hidden')

      $.ajax({
        url: '/programs/head_coach_of_program',
        type: "GET",
        dataType: "json",
        data: { school_name: school_dpdown_text, program_sport:  program_dpdown_text},
        success: function(response){
          // debugger
          $("#review_program_select_headcoach_dropdown").html('')
          $("#review_program_select_headcoach_dropdown").append("<option value='1'> Select Coach </option>")
          $("#review_program_select_headcoach_dropdown").append(jsonToHTMLselectOptions(response, 'coach'))
        }
      });

    } else {
      $("#review_program_select_headcoach_div").addClass('hidden')
      $("#review_program_select_rival_div").addClass('hidden')
      $("#review_program_select_toughestplace_div").addClass('hidden')
    }
  });

}