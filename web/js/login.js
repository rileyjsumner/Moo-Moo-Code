$(document).ready(function() {
	$(document).mouseup(function (e) {
		var container = $("#account-dropdown");
		
		// if the target of the click isn't the container nor a descendant of the container
		if (!container.is(e.target) && container.has(e.target).length === 0) {
			container.hide();
		}
	});
});
function toggleAccountDropdown() {
	$("#account-dropdown").show();
}