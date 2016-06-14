$(document).ready(function(){
    function activaTab(tab){
      $('.nav-tabs li a[href="#' + tab + '"]').tab('show');
    };

    if(window.location.href.match('#')) {
      activaTab(window.location.href.split('#')[1]);
    }

    $(document).on('click', ".nav-tabs li a", function(){
      var minihref = $(this).attr('href');
      window.location.href = window.location.href.split('#')[0] + minihref;
      $('.nav-tabs li a[href="' + minihref + '"]').tab('show');
    });


});