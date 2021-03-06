// OK this file is a doozy. It is well organized and documented but it is just a lot. All the listeners for creating a review are in here.

// This object will be passed to the review controller create method once it is populated.
var reviewToSubmit = {
  coach_id: '',
  school_id: '',
  program_id: '',

  hc_player_relationships: '',
  hc_player_development: '',
  hc_recruiting: '',
  hc_pro_connections: '',
  hc_sport_knowledge: '',
  hc_would_play_with_again: '',
  hc_comments: '',

  f_main_arena: '',
  f_home_atmosphere: '',
  f_weight_room: '',
  f_locker_room: '',
  f_training_facility: '',
  f_comments: '',

  l_program_tradition: '',
  l_community_interest: '',
  l_weather: '',
  l_nightlife: '',
  l_comments: '',

  e_school_difficulty: '',
  e_academic_support: '',
  e_school_reputation: '',
  e_graduated: '',
  e_comments: '',

  conference_rival: '',
  toughest_conference_place_to_play: ''
};

// Reason I did this is becuase before, the data would save in this review to submit object but the form would reset when clicking out of reviews/new and clicking back in. So I could fill half of it out, click out and back in, the form would reset, and if i clicked submit, only half of the fill out error messages would appear even tho the entire form was blank.
$(document).on('click', ".link-to-new-review", function(){
  reviewToSubmit.coach_id = '';
  reviewToSubmit.school_id = '';
  reviewToSubmit.program_id = '';

  reviewToSubmit.hc_player_relationships = '';
  reviewToSubmit.hc_player_development = '';
  reviewToSubmit.hc_recruiting = '';
  reviewToSubmit.hc_pro_connections = '';
  reviewToSubmit.hc_sport_knowledge = '';
  reviewToSubmit.hc_would_play_with_again = '';
  reviewToSubmit.hc_comments = '';

  reviewToSubmit.f_main_arena = '';
  reviewToSubmit.f_home_atmosphere = '';
  reviewToSubmit.f_weight_room = '';
  reviewToSubmit.f_locker_room = '';
  reviewToSubmit.f_training_facility = '';
  reviewToSubmit.f_comments = '';

  reviewToSubmit.l_program_tradition = '';
  reviewToSubmit.l_community_interest = '';
  reviewToSubmit.l_weather = '';
  reviewToSubmit.l_nightlife = '';
  reviewToSubmit.l_comments = '';

  reviewToSubmit.e_school_difficulty = '';
  reviewToSubmit.e_academic_support = '';
  reviewToSubmit.e_school_reputation = '';
  reviewToSubmit.e_graduated = '';
  reviewToSubmit.e_comments = '';

  reviewToSubmit.conference_rival = '';
  reviewToSubmit.toughest_conference_place_to_play = '';
});

// This is my json to html function for the programs dropdown and the head coach dropdown
var jsonToHTMLselectOptions = function(object_array, attr) {

  console.log('entered jsontohtmlselectoptions func')
  var jsonHTML = ''

  // sometimes the response from the server is an array of objects which is what we want. Other times it is just one object so we cannot iterate with .length. SO this if statement wraps single objects in [] so we can continue to use the same for loop.
  if(typeof(object_array[0]) == 'undefined') {
    object_array = [object_array]
  }

  //Looping through the array of objects
  for (var ii = 0; ii < object_array.length; ii++) {
    console.log('entered for loop')

    // These if statements are needed because we want to output the programs are labeled by sport and the coaches are labeled by first and last name.
    if(attr == 'program') {
      jsonHTML = jsonHTML + "<option value='" + (ii+2).toString() + "'>" + object_array[ii].sport + "</option>"
      console.log('entered program')
    }
    if(attr == 'coach') {
      jsonHTML = jsonHTML + "<option value='" + (ii+1).toString() + "'>" + object_array[ii].first_name + " " + object_array[ii].last_name + "</option>"

      console.log('entered coach')
    }
  }
  return jsonHTML
}

// This is the function that holds all of the listners/actions for the review form fill out page. It handles all of the tabbing and data calls to and from the server
var reviewFormProgram = function() {
  console.log('reviewFormProgram function entered')

  // WHEN THE SCHOOL DROPDOWN IS CHANGED
  $( document ).on('change', "#review_program_select_school_dropdown", function() {

    // Everytime this dropdown is altered we want to clear the school, program, and coach. It just assures that everything will match up at the end when it is time to submit. You can imagine selecting a coach after a school and program is selected. Then the user changes the program and forgets to select a coach. The review object on the js side will still have the old coach for the other program so it will pass all of the tests for submitting the review.
    reviewToSubmit.school_id = '';
    reviewToSubmit.program_id = '';
    reviewToSubmit.coach_id = '';

    // What is the selector value and text?
    var school_dpdown_val = $( "#review_program_select_school_dropdown" ).val();
    var school_dpdown_text = $( "#review_program_select_school_dropdown option:selected").text();

    // Ok.. The first row of the school dropdown menu is "select school". So if the school selector changes to an actual school (not val = 1), then we want to do all of the changes/server calls
    if (school_dpdown_val != 1) {

      // The only thing that should display when a school is selected is the program options. Everything else should have css class hidden
      $("#review_program_select_program_div").removeClass('hidden')
      $("#review_program_select_headcoach_div").addClass('hidden')
      $("#review_program_select_rival_div").addClass('hidden')
      $("#review_program_select_toughestplace_div").addClass('hidden')

      //Lets now get those program options
      $.ajax({
        url: '/schools/program_list_in_school',
        type: "GET",
        dataType: "json",
        data: { school_name: school_dpdown_text },
        success: function(response){

          //response returns a json object with two parts: an array of program obbjects and a school object. We can now populate the main review object.school
          reviewToSubmit.school_id = response.school_id

          // Like with the schools dropdown. The first row should be 'select program'. I clear it first so that it does not stack everytime the dropdown selection changes
          $("#review_program_select_program_dropdown").html('')
          $("#review_program_select_program_dropdown").append("<option value='1'> Select Program </option>")

          //json to html
          $("#review_program_select_program_dropdown").append(jsonToHTMLselectOptions(response.programs, 'program'))
        }
      });

    // This is the case when 'select school' has been chosen. HIDE EVERYTHING!!!!!!
    } else {
      $("#review_program_select_program_div").addClass('hidden')
      $("#review_program_select_headcoach_div").addClass('hidden')
      $("#review_program_select_rival_div").addClass('hidden')
      $("#review_program_select_toughestplace_div").addClass('hidden')
    }
  });

  // WHEN THE PROGRAM DROPDOWN IS CHANGED
  $( document ).on('change', "#review_program_select_program_dropdown", function() {

    // This is explained in a similar situation with school dropdown event listener

    // A LOT MORE VALUES IN THIS OBJECT NEED TO BE RESET **********************
    reviewToSubmit.program_id = ''
    reviewToSubmit.coach_id = ''

    var program_dpdown_val = $( "#review_program_select_program_dropdown" ).val();
    var program_dpdown_text = $( "#review_program_select_program_dropdown option:selected").text()

    if (program_dpdown_val != 1) {
      $("#review_program_select_headcoach_div").removeClass('hidden')
      $("#review_program_select_rival_div").removeClass('hidden')
      $("#review_program_select_toughestplace_div").removeClass('hidden')

      $.ajax({
        url: '/programs/head_coach_of_program',
        type: "GET",
        dataType: "json",
        // this will have to be checked server side. You can image someone playing with the css, removing the hidden class and then we would be sending 'select program' as the program name. It would break our server.
        data: { school_id: reviewToSubmit.school_id,
                program_sport:  program_dpdown_text},
        success: function(response){

          // Program now filled in review object
          reviewToSubmit.program_id = response.program_id

          // Coach now filled but this will have to change. If I want to review a program and my old coach is no there anymore then what do I do. Maybe not allow for coach ratings..
          reviewToSubmit.coach_id = response.coach.id

          //json to html
          $("#review_program_select_headcoach_dropdown").html('')
          $("#review_program_select_headcoach_dropdown").append(jsonToHTMLselectOptions(response.coach, 'coach'))
        }
      });

    } else {
      $("#review_program_select_headcoach_div").addClass('hidden')
      $("#review_program_select_rival_div").addClass('hidden')
      $("#review_program_select_toughestplace_div").addClass('hidden')
    }
  });

  // WHEN THE CONFERENCE RIVAL KEYUP
  $(document).delegate("#review_program_select_rival_input", "keyup", function() {
      // Every keyup in this textbox and the review object will update accordingly
      reviewToSubmit.conference_rival = $(this).val()
  });

  // WHEN TOUGHEST PLACE TO PLAY KEYUP
  $(document).delegate("#review_program_select_toughestplace_input", "keyup", function() {
      // Every keyup in this textbox and the review object will update accordingly
      reviewToSubmit.toughest_conference_place_to_play = $(this).val()

  });

  // HEADCOACH PLAYER RELATIONSHIPS
  $(document).delegate("#hc_player_relationships a", "click", function() {
    reviewToSubmit.hc_player_relationships = parseInt($(this).attr('id'));
  });

  // HEADCOACH PLAYER DEVELOPMENT
  $(document).delegate("#hc_player_development a", "click", function() {
    reviewToSubmit.hc_player_development = parseInt($(this).attr('id'));
  });

  // HEADCOACH RECRUITING
  $(document).delegate("#hc_recruiting a", "click", function() {
    reviewToSubmit.hc_recruiting = parseInt($(this).attr('id'));
  });

  // HEADCOACH PRO CONNECTIONS
  $(document).delegate("#hc_pro_connections a", "click", function() {
    reviewToSubmit.hc_pro_connections = parseInt($(this).attr('id'));
  });

  // HEADCOACH SPORT KNOWLEDGE
  $(document).delegate("#hc_sport_knowledge a", "click", function() {
    reviewToSubmit.hc_sport_knowledge = parseInt($(this).attr('id'));
  });

  // HEADCOACH WOULD YOU PLAY FOR AGAIN: YES
  $(document).delegate("#hc_would_you_play_for_again_yes", "click", function() {
    reviewToSubmit.hc_would_play_with_again = true;

  });

  // HEADCOACH WOULD YOU PLAY FOR AGAIN: NO
  $(document).delegate("#hc_would_you_play_for_again_no", "click", function() {
    reviewToSubmit.hc_would_play_with_again = false;
  });

  // HEADCOACH COMMENTS
  $(document).delegate("#hc_comments", "keyup", function() {
      // Every keyup in this textbox and the review object will update accordingly
      reviewToSubmit.hc_comments = $(this).val()
  });

  // FACILITIES MAIN ARENA
  $(document).delegate("#f_main_arena a", "click", function() {
    reviewToSubmit.f_main_arena = parseInt($(this).attr('id'));
  });

  // FACILITIES HOME GAME ATMOSPHERE
  $(document).delegate("#f_home_atmosphere a", "click", function() {
    reviewToSubmit.f_home_atmosphere = parseInt($(this).attr('id'));
  });

  // FACILITIES WEIGHT ROOM
  $(document).delegate("#f_weight_room a", "click", function() {
    reviewToSubmit.f_weight_room = parseInt($(this).attr('id'));
  });

  // FACILITIES LOCKER ROOM
  $(document).delegate("#f_locker_room a", "click", function() {
    reviewToSubmit.f_locker_room = parseInt($(this).attr('id'));
  });

  // FACILITIES TRAINING FACILITY
  $(document).delegate("#f_training_facility a", "click", function() {
    reviewToSubmit.f_training_facility = parseInt($(this).attr('id'));
  });

  // FACILITIES COMMENTS
  $(document).delegate("#f_comments", "keyup", function() {
      // Every keyup in this textbox and the review object will update accordingly
      reviewToSubmit.f_comments = $(this).val()
  });

  // LOCATION NIGHTLIFE
  $(document).delegate("#l_nightlife a", "click", function() {
    reviewToSubmit.l_nightlife = parseInt($(this).attr('id'));
  });

  // LOCATION COMMUNITY INTEREST
  $(document).delegate("#l_community_interest a", "click", function() {
    reviewToSubmit.l_community_interest = parseInt($(this).attr('id'));
  });

  // LOCATION WEATHER
  $(document).delegate("#l_weather a", "click", function() {
    reviewToSubmit.l_weather = parseInt($(this).attr('id'));
  });

  // LOCATION PROGRAM TRADITION
  $(document).delegate("#l_program_tradition a", "click", function() {
    reviewToSubmit.l_program_tradition = parseInt($(this).attr('id'));
  });

  // LOCATION COMMENTS
  $(document).delegate("#l_comments", "keyup", function() {
      // Every keyup in this textbox and the review object will update accordingly
      reviewToSubmit.l_comments = $(this).val()
  });

  // EDUCATION SCHOOL DIFFICULTY
  $(document).delegate("#e_school_difficulty a", "click", function() {
    reviewToSubmit.e_school_difficulty = parseInt($(this).attr('id'));
  });

  // EDUCATION ACADEMIC SUPPORT
  $(document).delegate("#e_academic_support a", "click", function() {
    reviewToSubmit.e_academic_support = parseInt($(this).attr('id'));
  });

  // EDUCATION SCHOOL REPUTATION
  $(document).delegate("#e_school_reputation a", "click", function() {
    reviewToSubmit.e_school_reputation = parseInt($(this).attr('id'));
  });

  // EDUCATION DID YOU GRADUATE: YES
  $(document).delegate("#e_graduated_yes", "click", function() {
    reviewToSubmit.e_graduated = true;

  });

  // EDUCATION DID YOU GRADUATE: NO
  $(document).delegate("#e_graduated_no", "click", function() {
    reviewToSubmit.e_graduated = false;
  });

  // EDUCATION
  $(document).delegate("#e_comments", "keyup", function() {
      // Every keyup in this textbox and the review object will update accordingly
      reviewToSubmit.e_comments = $(this).val()
  });


  $(document).on('click', '#review-form-submit-button', function(e){
    e.preventDefault();
  // reviewToSubmit.coach_id = '1';
  // reviewToSubmit.school_id = '1';
  // reviewToSubmit.program_id = '1';

  // reviewToSubmit.hc_player_relationships = '1';
  // reviewToSubmit.hc_player_development = '2';
  // reviewToSubmit.hc_recruiting = '3';
  // reviewToSubmit.hc_pro_connections = '4';
  // reviewToSubmit.hc_sport_knowledge = '5';
  // reviewToSubmit.hc_would_play_with_again = true;
  // reviewToSubmit.hc_comments = 'sssss';

  // reviewToSubmit.f_main_arena = '3';
  // reviewToSubmit.f_home_atmosphere = '3';
  // reviewToSubmit.f_weight_room = '3';
  // reviewToSubmit.f_locker_room = '3';
  // reviewToSubmit.f_training_facility = '3';
  // reviewToSubmit.f_comments = 'ddddd';

  // reviewToSubmit.l_program_tradition = '3';
  // reviewToSubmit.l_community_interest = '3';
  // reviewToSubmit.l_weather = '3';
  // reviewToSubmit.l_nightlife = '3';
  // reviewToSubmit.l_comments = 'rrrrr';

  // reviewToSubmit.e_school_difficulty = '4';
  // reviewToSubmit.e_academic_support = '4';
  // reviewToSubmit.e_school_reputation = '4';
  // reviewToSubmit.e_graduated = true;
  // reviewToSubmit.e_comments = 'eeeee';

  // reviewToSubmit.conference_rival = 'eeee';
  // reviewToSubmit.toughest_conference_place_to_play = 'eeee';

    $(".empty_fields_table").empty()
    $.ajax({
      url: '/reviews',
      type: "POST",
      dataType: "json",
      data: { review_data: reviewToSubmit},
      success: function(response){
        if(response.empty_fields[0] == 'saved') {
          window.location.assign('/');
        } else {
          $('#empty-fields-div').removeClass('hidden')
          // debugger
          for(var x=0; x < response.empty_fields.length; x++) {
            $('.empty_fields_table').append("<tr class='danger'><td>"+ response.empty_fields[x] +"</td></tr>")
          }
        }
      }
    });

  });
}