// var app = window.app = {};
// console.log('auto_test')
// app.Schools = function() {
//   console.log('apps.Schools')
//   this._input = $('#city');
//   this._initAutocomplete();
// };

// app.Schools.prototype = {
//   _initAutocomplete: function() {
//     console.log('entered _initAutocomplete')
//     this._input
//       .autocomplete({
//         source: '/schools/search',
//         appendTo: '#log',
//         select: $.proxy(this._select, this)
//       })
//       .autocomplete('instance')._renderItem = $.proxy(this._render, this);
//   },

//   _render: function(ul, item) {
//     console.log('entered _render')
//     var markup = [
//       '<span class="name">' + item.name + '</span>'
//     ];
//     return $('<li>')
//       .append(markup.join(''))
//       .appendTo(ul);
//   },

//   _select: function(e, ui) {
//     console.log('entered _select')
//     this._input.val(ui.item.name);
//     return false;
//   }
// };


// $("#city").keyup(function(){
//     console.log('entered keyup before ajax')
    // $.ajax({
    //   url: "/schools/search", // Route to the Script Controller method
    //   type: "GET",
    //   dataType: "json",
    //   data: { input: 'a' },
    //   success: function(data) {
    //     console.log(data)
    //   }
    // });
// });