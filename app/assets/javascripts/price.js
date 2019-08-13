$(function() {
  $('#item_price').on("input", function() {
  var input = $('#item_price').val();
  var fee = Math.floor(input / 10);
  var profit = Math.floor(input - fee);
  if (input >= 300 && input < 10000000) {
    $('.fee__right').empty(fee);
    $('.fee__right').append(fee);
    $('.profit__right').empty(profit);
    $('.profit__right').append(profit);
  } else  {
    $('.fee__right').empty(fee);
    $('.fee__right').append('-');
    $('.profit__right').empty(profit);
    $('.profit__right').append('-');
  }
  })
});