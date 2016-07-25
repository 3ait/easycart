$(function() {
	$("#rpway1").click(function() {
		$("#rpw1").css("display", "block");
		$("#rpway1").css("color", "#F0C103").css("border-bottom-color", "#F0C103");
		$("#rpw2").css("display", "none");
		$("#rpway2").css("color", "#626262").css("border-bottom-color", "#E6E6E6");
	});
	$("#rpway2").click(function() {
		$("#rpw2").css("display", "block");
		$("#rpway2").css("color", "#F0C103").css("border-bottom-color", "#F0C103");
		$("#rpw1").css("display", "none");
		$("#rpway1").css("color", "#626262").css("border-bottom-color", "#E6E6E6");
	});
});

$(function() {
	$(".rpiLabel").click(function() {
		$(this).children(".rpiInput").css("height", "45px");
		$(this).children(".rpiInput")[0].focus();
	});
});