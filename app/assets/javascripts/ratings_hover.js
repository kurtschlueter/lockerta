var ratingsHover = function() {
  console.log('ratings hover function entered')


  var sourceSwap = function () {
      var $this = $(this);
      var newSource = $this.data('alt-src');
      $this.data('alt-src', $this.attr('src'));
      $this.attr('src', newSource);

    var current_id_tag = $(this).parent().attr('id')
    var current_id_num = parseInt(current_id_tag.slice(-1))

    // var $this2;
    // var newSource2;
    // debugger
    var thisArray = $this.parent().prevAll();
    // debugger
    for (var star_index = 0; star_index < thisArray.length; star_index++){

    var $this2 = $(thisArray[star_index]).children();
    var newSource2 = $this2.data('alt-src');
    $this2.data('alt-src', $this2.attr('src'));
    $this2.attr('src', newSource2);

    // for (var star_index = 0; star_index < $thisArray.length; star_index++){
    //   debugger
    //   var $this2 = $thisArray[star_index].children[0];
    //   var newSource2 = $this2.data('alt-src');
    //   $this2.data('alt-src', $this2.attr('src'));
    //   $this2.attr('src', newSource2);

    }

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