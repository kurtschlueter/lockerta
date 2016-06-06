var ratingsHover = function() {
  console.log('ratings hover function entered')



  $(document).on('mouseover', '.rating-stars', function(e) {
    console.log('mouseover entered')

    var current_id_tag = $(this).attr('id')
    var current_id_num = parseInt(current_id_tag.slice(-1))
    var or_source = $(this).children()[0].src
    var alt_source = $(this).children().data('alt-src')

    $(this).children()[0].src = alt_source
    // for (1 to <= current_id_num ++) {

    //   change to full star

    // }

  });

}