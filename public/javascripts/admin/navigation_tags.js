NavigationTagsBehavior = Behavior.create({
  initialize: function(options){
    this.update();
  },
  
  onchange: function(event) {
    this.update();
  },
  
  update: function() {
    var tag = $('navigation_tag');
    if(this.element.value == '' || this.element.value.match(/^Archive/)) {
      tag.show();
    } else {
      $('page_in_navigation').value = "false";
      tag.hide();
    }
  }
});

Event.addBehavior({ '#page_class_name': NavigationTagsBehavior() });