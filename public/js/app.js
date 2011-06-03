$(function(){
  $(".next-holiday").bind('swipeleft', function(){
    $("#target").trigger('click')
  }).bind('swiperight', function(){
    $("#home").trigger('click')
  })
  $("div[data-role*='page']").live('pagehide', function(event, ui) {
    $(".next-holiday").bind('swipeleft', function(){
      $(ui.nextPage[0]).find('#target').trigger('click')
    }).bind('swiperight', function(){
      $(ui.nextPage[0]).find('#home').trigger('click')
    })
  });
})
