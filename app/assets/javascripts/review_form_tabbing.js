var reviewFormTabbing = function() {
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
    $('#reviewformeducationtab').addClass('hidden')
    $('#reviewformconfirmationtab').removeClass('hidden')

    $('#progressbarconfirmation').removeClass('progress-bar-warning')
    $('#progressbarconfirmation').addClass('progress-bar-success')
  });

// HERE ILL MAKE THE TABS CLICKABLE AS WELL

  // CLICKED ON SELECT PROGRAM TAB
  $(document).on('click', '#progressbarselectprogram', function(e){
    e.preventDefault();
    $('#reviewformeducationtab').addClass('hidden')
    $('#reviewformconfirmationtab').addClass('hidden')
    $('#reviewformlocationtab').addClass('hidden')
    $('#reviewformfacilitiestab').addClass('hidden')
    $('#reviewformheadcoachtab').addClass('hidden')

    $('#reviewformselectprogramtab').removeClass('hidden')

    $('#progressbarselectprogram').removeClass('progress-bar-warning')
    $('#progressbarselectprogram').addClass('progress-bar-success')

    $('#progressbarfacilities').removeClass('progress-bar-success')
    $('#progressbarfacilities').addClass('progress-bar-warning')

    $('#progressbareducation').removeClass('progress-bar-success')
    $('#progressbareducation').addClass('progress-bar-warning')

    $('#progressbarlocation').removeClass('progress-bar-success')
    $('#progressbarlocation').addClass('progress-bar-warning')

    $('#progressbarheadcoach').removeClass('progress-bar-success')
    $('#progressbarheadcoach').addClass('progress-bar-warning')

    $('#progressbarconfirmation').removeClass('progress-bar-success')
    $('#progressbarconfirmation').addClass('progress-bar-warning')
  });

  // CLICKED ON HEAD COAHC TAB
  $(document).on('click', '#progressbarheadcoach', function(e){
    e.preventDefault();
    $('#reviewformselectprogramtab').addClass('hidden')
    $('#reviewformeducationtab').addClass('hidden')
    $('#reviewformconfirmationtab').addClass('hidden')
    $('#reviewformlocationtab').addClass('hidden')
    $('#reviewformfacilitiestab').addClass('hidden')

    $('#reviewformheadcoachtab').removeClass('hidden')

    $('#progressbarselectprogram').removeClass('progress-bar-warning')
    $('#progressbarselectprogram').addClass('progress-bar-success')

    $('#progressbarheadcoach').removeClass('progress-bar-warning')
    $('#progressbarheadcoach').addClass('progress-bar-success')

    $('#progressbarfacilities').removeClass('progress-bar-success')
    $('#progressbarfacilities').addClass('progress-bar-warning')

    $('#progressbareducation').removeClass('progress-bar-success')
    $('#progressbareducation').addClass('progress-bar-warning')

    $('#progressbarlocation').removeClass('progress-bar-success')
    $('#progressbarlocation').addClass('progress-bar-warning')

    $('#progressbarconfirmation').removeClass('progress-bar-success')
    $('#progressbarconfirmation').addClass('progress-bar-warning')
  });

  // CLICKED ON FACILITIES TAB
  $(document).on('click', '#progressbarfacilities', function(e){
    e.preventDefault();
    $('#reviewformselectprogramtab').addClass('hidden')
    $('#reviewformeducationtab').addClass('hidden')
    $('#reviewformconfirmationtab').addClass('hidden')
    $('#reviewformlocationtab').addClass('hidden')
    $('#reviewformheadcoachtab').addClass('hidden')
    $('#reviewformfacilitiestab').removeClass('hidden')

    $('#progressbarselectprogram').removeClass('progress-bar-warning')
    $('#progressbarselectprogram').addClass('progress-bar-success')

    $('#progressbarheadcoach').removeClass('progress-bar-warning')
    $('#progressbarheadcoach').addClass('progress-bar-success')

    $('#progressbarfacilities').removeClass('progress-bar-warning')
    $('#progressbarfacilities').addClass('progress-bar-success')

    $('#progressbareducation').removeClass('progress-bar-success')
    $('#progressbareducation').addClass('progress-bar-warning')

    $('#progressbarlocation').removeClass('progress-bar-success')
    $('#progressbarlocation').addClass('progress-bar-warning')

    $('#progressbarconfirmation').removeClass('progress-bar-success')
    $('#progressbarconfirmation').addClass('progress-bar-warning')
  });

  // CLICKED ON LOCATION TAB
  $(document).on('click', '#progressbarlocation', function(e){
    e.preventDefault();
    $('#reviewformselectprogramtab').addClass('hidden')
    $('#reviewformeducationtab').addClass('hidden')
    $('#reviewformconfirmationtab').addClass('hidden')
    $('#reviewformheadcoachtab').addClass('hidden')
    $('#reviewformfacilitiestab').addClass('hidden')
    $('#reviewformlocationtab').removeClass('hidden')

    $('#progressbarselectprogram').removeClass('progress-bar-warning')
    $('#progressbarselectprogram').addClass('progress-bar-success')

    $('#progressbarheadcoach').removeClass('progress-bar-warning')
    $('#progressbarheadcoach').addClass('progress-bar-success')

    $('#progressbarfacilities').removeClass('progress-bar-warning')
    $('#progressbarfacilities').addClass('progress-bar-success')

    $('#progressbarlocation').removeClass('progress-bar-warning')
    $('#progressbarlocation').addClass('progress-bar-success')

    $('#progressbareducation').removeClass('progress-bar-success')
    $('#progressbareducation').addClass('progress-bar-warning')

    $('#progressbarconfirmation').removeClass('progress-bar-success')
    $('#progressbarconfirmation').addClass('progress-bar-warning')
  });

  // CLICKED ON EDUCATION TAB
  $(document).on('click', '#progressbareducation', function(e){
    e.preventDefault();
    $('#reviewformselectprogramtab').addClass('hidden')
    $('#reviewformconfirmationtab').addClass('hidden')
    $('#reviewformheadcoachtab').addClass('hidden')
    $('#reviewformfacilitiestab').addClass('hidden')
    $('#reviewformlocationtab').addClass('hidden')
    $('#reviewformeducationtab').removeClass('hidden')

    $('#progressbarselectprogram').removeClass('progress-bar-warning')
    $('#progressbarselectprogram').addClass('progress-bar-success')

    $('#progressbarheadcoach').removeClass('progress-bar-warning')
    $('#progressbarheadcoach').addClass('progress-bar-success')

    $('#progressbarfacilities').removeClass('progress-bar-warning')
    $('#progressbarfacilities').addClass('progress-bar-success')

    $('#progressbarlocation').removeClass('progress-bar-warning')
    $('#progressbarlocation').addClass('progress-bar-success')

    $('#progressbareducation').removeClass('progress-bar-warning')
    $('#progressbareducation').addClass('progress-bar-success')

    $('#progressbarconfirmation').removeClass('progress-bar-success')
    $('#progressbarconfirmation').addClass('progress-bar-warning')
  });

  // CLICKED ON CONFIRMATION TAB
  $(document).on('click', '#progressbarconfirmation', function(e){
    e.preventDefault();
    $('#reviewformselectprogramtab').addClass('hidden')
    $('#reviewformheadcoachtab').addClass('hidden')
    $('#reviewformfacilitiestab').addClass('hidden')
    $('#reviewformlocationtab').addClass('hidden')
    $('#reviewformeducationtab').addClass('hidden')
    $('#reviewformconfirmationtab').removeClass('hidden')

    $('#progressbarselectprogram').removeClass('progress-bar-warning')
    $('#progressbarselectprogram').addClass('progress-bar-success')

    $('#progressbarheadcoach').removeClass('progress-bar-warning')
    $('#progressbarheadcoach').addClass('progress-bar-success')

    $('#progressbarfacilities').removeClass('progress-bar-warning')
    $('#progressbarfacilities').addClass('progress-bar-success')

    $('#progressbarlocation').removeClass('progress-bar-warning')
    $('#progressbarlocation').addClass('progress-bar-success')

    $('#progressbareducation').removeClass('progress-bar-warning')
    $('#progressbareducation').addClass('progress-bar-success')

    $('#progressbarconfirmation').removeClass('progress-bar-warning')
    $('#progressbarconfirmation').addClass('progress-bar-success')
  });
}