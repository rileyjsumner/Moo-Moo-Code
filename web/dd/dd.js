function updateDropDowns()
{
	$(".dd-select").each(function()
	{
		var select_el = $(this);
		var found=false;
		$(">.dd-options>.dd-option").each(function()
		{
			if(!found) {
				if ($(this).data("selected")) {
					found = true;
					console.log("FOUND");
					select_el.find(".dd-selected-icon").css("background-image",$(this).child(".dd-option-icon").css("background-image"));
					select_el.find(".dd-selected-text").html($(this).child(".dd-option-text").html());
				}
			}
		});
		if(!found)
		{
			select_el.find(".dd-selected-icon").css("background-image","");
			select_el.find(".dd-selected-text").html("None");
		}
	});
	$(".dd-select>.dd-selected").click(function()
	{
		$(this).parent().children(".dd-options").slideToggle(100);
	});
}