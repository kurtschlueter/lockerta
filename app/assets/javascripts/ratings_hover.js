var ratingsHover = function() {
  console.log('ratings hover function entered')

  $(document).on('mouseenter', '.rating-stars-img', function(e) {
    // console.log('mouseenter')
    var $this = $(this);
    if($this.hasClass('selected') == false) {
      var newSource = $this.data('fullstar');
      $this.attr('src', newSource);
    }
      var current_id_tag = $(this).parent().attr('id')
      var current_id_num = parseInt(current_id_tag.slice(-1))

      var thisArray = $this.parent().prevAll();
      // debugger

      for (var star_index = 0; star_index < thisArray.length; star_index++){
        var $this2 = $(thisArray[star_index]).children();
        if($this2.hasClass('selected') == false) {
          var newSource2 = $this2.data('fullstar');
          $this2.attr('src', newSource2);
        }
      }
  });


  $(document).on('mouseleave', '.rating-stars-img', function(e) {
    // console.log('mouseleave')
    var $this = $(this);
    if($this.hasClass('selected') == false) {
      var newSource = $this.data('emptystar');
      $this.attr('src', newSource);
    }
    var current_id_tag = $(this).parent().attr('id')
    var current_id_num = parseInt(current_id_tag.slice(-1))

    var thisArray = $this.parent().prevAll();
    // debugger
    for (var star_index = 0; star_index < thisArray.length; star_index++){

      var $this2 = $(thisArray[star_index]).children();
      if($this2.hasClass('selected') == false) {
        var newSource2 = $this2.data('emptystar');
        $this2.attr('src', newSource2);
      }
    }

  });

  $(document).on('click', '.rating-stars', function(e) {

    // console.log('entered star click');
      var $this33 = $(this).children();
      var newSource33 = $this33.data('fullstar');
      $this33.data('currentstar', newSource33);
      $this33.attr('src', newSource33);
      $this33.addClass('selected');

    var selectedComponents = $this33.parent().prevAll();
    var deSelectedComponents = $this33.parent().nextAll();

    for (var star_index = 0; star_index < selectedComponents.length; star_index++){
      $this22 = $(selectedComponents[star_index]).children();
      $this22.addClass('selected')
      var newSource2 = $this22.data('fullstar');
      $this22.attr('src', newSource2);

    }

    for (var unstar_index = 0; unstar_index < deSelectedComponents.length; unstar_index++){
      var $this232 = $(deSelectedComponents[unstar_index]).children();
      $this232.removeClass('selected')
      var newSource22 = $this232.data('emptystar');
      $this232.attr('src', newSource22);

    }
  });
}