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
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .


//= require search_autocomplete
console.log('app.js')
$(document).ready(function(){
  console.log('doc ready')
  autoComplete()

  // $(document).delegate( '.aaaa', "popover", function(e) {
  //   console.log('entered keyup')
  //   e.preventDefault();
  // })


$(document).on('click', '.aaaa', function (e) {
    // code here
    e.preventDefault();

    console.log('entered keyup')
    $('[data-toggle="popover"]').popover();
});
  // $('[data-toggle="popover"]').popover();


//   $('body').on('hidden.bs.popover', function () {
//   // do something…
//   console.log('entered k2eyup')
// })
});