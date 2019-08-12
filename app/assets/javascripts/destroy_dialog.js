$(function(){
  $('.items-new-change-box__btn-gray').on('click', function(e){
    $('#items-show-modal').addClass('items-show-modal');
    $('.items-show-modal__banner').removeClass('display');
  })
  $('.btn-cancel').on('click', function(){
    $('#items-show-modal').removeClass('items-show-modal');
    $('.items-show-modal__banner').addClass('display');
  })
});

$(document).on('click','.items-show-modal',function(e) {
  if(!$(e.target).closest('.items-show-modal__banner__body').length) {
    $('#items-show-modal').removeClass('items-show-modal');
    $('.items-show-modal__banner').addClass('display');
  }
});