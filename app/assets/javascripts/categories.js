$(function() {

	$("#dd li ul").hide();
	$("#dd li").hover(function() {
		$(">ul", this).stop(true, true).slideDown("fast");
		$(">a", this).addClass("active");
	},
	function() {
		$(">ul", this).stop(true, true).slideUp("fast");
		$(">a", this).removeClass("active");
	});
});