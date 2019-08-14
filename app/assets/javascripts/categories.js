$(document).on('turbolinks:load', function() {

  $("#categories-list-parent li ul").hide();
  
  $(document).on({
    "mouseenter": function(){
      $("ul", this).stop(true, true).slideDown("fast");
      $(this).addClass("active-red");
    },
    "mouseleave": function(){
      $("ul", this).stop(true,true).slideUp("fast");
      $(this).removeClass("active-red");
    }
    }, "#categories-list-parent li");
});