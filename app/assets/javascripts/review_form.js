var reviewForm = function() {
  console.log('reviewForm function entered')

// TAB 1: ONE BUTTON -> to head coach

  $(document).on('click', '#reviewformgetstarted', function(e){
    e.preventDefault();
    $('#reviewformselectprogramtab').addClass('hidden')
    $('#reviewformheadcoachtab').removeClass('hidden')
    $('#progressbarheadcoach').removeClass('progress-bar-warning')
    $('#progressbarheadcoach').addClass('progress-bar-success')
  });

// TAB 2: TWO BUTTONS -> back to program and to facilities

  $(document).on('click', '#reviewformbacktogetstarted', function(e){
    e.preventDefault();
    $('#reviewformselectprogramtab').removeClass('hidden')
    $('#reviewformheadcoachtab').addClass('hidden')
    $('#progressbarheadcoach').addClass('progress-bar-warning')

    $('#progressbarheadcoach').removeClass('progress-bar-success')
  });


  $(document).on('click', '#reviewformfacilities', function(e){
    e.preventDefault();

    $('#reviewformheadcoachtab').addClass('hidden')
    $('#reviewformfacilitiestab').removeClass('hidden')

    $('#progressbarfacilities').removeClass('progress-bar-warning')
    $('#progressbarfacilities').addClass('progress-bar-success')
  });

// TAB 3: TWO BUTTONS -> back to head coach and to location

  $(document).on('click', '#reviewformbacktoheadcoach', function(e){
    e.preventDefault();
    $('#reviewformheadcoachtab').removeClass('hidden')
    $('#reviewformfacilitiestab').addClass('hidden')

    $('#progressbarfacilities').removeClass('progress-bar-success')
    $('#progressbarfacilities').addClass('progress-bar-warning')
  });


  $(document).on('click', '#reviewformlocation', function(e){
    e.preventDefault();
    $('#reviewformfacilitiestab').addClass('hidden')
    $('#reviewformlocationtab').removeClass('hidden')

    $('#progressbarlocation').removeClass('progress-bar-warning')
    $('#progressbarlocation').addClass('progress-bar-success')
  });

// TAB 4: TWO BUTTONS -> back to facilities and to education

  $(document).on('click', '#reviewformbacktofacilities', function(e){
    e.preventDefault();
    $('#reviewformfacilitiestab').removeClass('hidden')
    $('#reviewformlocationtab').addClass('hidden')

    $('#progressbarlocation').removeClass('progress-bar-success')
    $('#progressbarlocation').addClass('progress-bar-warning')
  });


  $(document).on('click', '#reviewformeducation', function(e){
    e.preventDefault();
    $('#reviewformlocationtab').addClass('hidden')
    $('#reviewformeducationtab').removeClass('hidden')

    $('#progressbareducation').removeClass('progress-bar-warning')
    $('#progressbareducation').addClass('progress-bar-success')
  });

// TAB 5: TWO BUTTONS -> back to location and to confirmation

  $(document).on('click', '#reviewformbacktolocation', function(e){
    e.preventDefault();
    $('#reviewformlocationtab').removeClass('hidden')
    $('#reviewformeducationtab').addClass('hidden')

    $('#progressbareducation').removeClass('progress-bar-success')
    $('#progressbareducation').addClass('progress-bar-warning')
  });


  $(document).on('click', '#reviewformconfirmation', function(e){
    e.preventDefault();
    $('#reviewformeducationtab').addClass('hidden')
    $('#reviewformconfirmationtab').removeClass('hidden')

    $('#progressbarconfirmation').removeClass('progress-bar-warning')
    $('#progressbarconfirmation').addClass('progress-bar-success')
  });

// TAB 6: TWO BUTTONS -> back to education and SUBMIT FORM!!!

  $(document).on('click', '#reviewformbacktoeducation', function(e){
    e.preventDefault();
    $('#reviewformeducationtab').removeClass('hidden')
    $('#reviewformconfirmationtab').addClass('hidden')

    $('#progressbarconfirmation').removeClass('progress-bar-success')
    $('#progressbarconfirmation').addClass('progress-bar-warning')
  });


  $(document).on('click', '#reviewforsubmit', function(e){
    e.preventDefault();
    // $('#reviewformeducationtab').addClass('hidden')
    // $('#reviewformconfirmationtab').removeClass('hidden')

    // $('#progressbarconfirmation').removeClass('progress-bar-warning')
    // $('#progressbarconfirmation').addClass('progress-bar-success')
  });
}