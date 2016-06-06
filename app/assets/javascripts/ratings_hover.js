var ratingsHover = function() {
  console.log('ratings hover function entered')


  var sourceSwap = function () {
      var $this = $(this);
      var newSource = $this.data('alt-src');
      $this.data('alt-src', $this.attr('src'));
      $this.attr('src', newSource);

      debugger
  }

  $('.rating-stars-img').hover(sourceSwap, sourceSwap);
//   $(document).on('mouseover', '.rating-stars', function(e) {

//     console.log('mouseover entered')

//     var current_id_tag = $(this).attr('id')
//     var current_id_num = parseInt(current_id_tag.slice(-1))
//     var or_source = $(this).children()[0].src
//     var alt_source = $(this).children().data('alt-src')

//     $(this).children()[0].src = alt_source
//     // $(this).children().data('alt-src') = or_source

// debugger
//     // for (1 to <= current_id_num ++) {

//     //   change to full star

//     // }

//   });

//   $(document).on('mouseleave', '.rating-stars', function(e) {

//     console.log('mouseover leave')

//     var current_id_tag = $(this).attr('id')
//     var current_id_num = parseInt(current_id_tag.slice(-1))
//     // var or_source = $(this).children()[0].src
//     // var alt_source = $(this).children().data('alt-src')
// debugger
//     $(this).children()[0].src = or_source
//     // for (1 to <= current_id_num ++) {

//     //   change to full star

//     // }

//   });


}