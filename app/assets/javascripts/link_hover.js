var linkHover = function() {
  console.log('link hover function entered')

  var originalLeave = $.fn.popover.Constructor.prototype.leave;
  $.fn.popover.Constructor.prototype.leave = function(obj){
    var self = obj instanceof this.constructor ?
      obj : $(obj.currentTarget)[this.type](this.getDelegateOptions()).data('bs.' + this.type)
    var container, timeout;

    originalLeave.call(this, obj);

    if(obj.currentTarget) {
      container = $(obj.currentTarget).siblings('.popover')
      timeout = self.timeout;
      container.one('mouseenter', function(){
        //We entered the actual popover – call off the dogs
        clearTimeout(timeout);
        //Let's monitor popover content instead
        container.one('mouseleave', function(){
          $.fn.popover.Constructor.prototype.leave.call(self, self);
        });
      })
    }
  };

  $(document).on('mouseover', '.location-div', function(e) {
      var $tr = $(this);
      var jsonToHTMLtable = function(jsonn) {
        console.log('entered jsontohtmltable func')
        var jsonHTML = '<table class="table table-striped table-hover"><tbody>'
        // debugger
        for (var ii = 0; ii < jsonn.programs.length; ii++) {
          console.log('entered for loop')
            jsonHTML = jsonHTML + "<tr class='danger'><td><a href='/programs/" + jsonn.programs[ii].id + "'>" + jsonn.programs[ii].sport + "</a></tr></td>"
            // debugger
        }

        // for (var jsonArrayIndex=0; jsonArrayIndex<jsonn.data.length; jsonArrayIndex++){console.log('yes')}
        jsonHTML = jsonHTML + '</tbody></table>'
        // debugger
        return jsonHTML
      }

      $.ajax({
        url: '/schools/program_list_in_school',
        type: "GET",
        dataType: "json",
        data: { school_name: $(this).html() },
        success: function(response){
          console.log(response)
              $tr.popover({
                  title: 'Which team would you like to view?',
                  content: jsonToHTMLtable(response),
                  placement: 'bottom',
                  html: true,
                  trigger: 'hover',
                  delay: {show: 50, hide: 400}
              }).popover('show');
        }
      });
  });
}