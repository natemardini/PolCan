// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery(function() {
	jQuery("#progressbar").progressbar({
		value: 60
	});
	
	jQuery("#yea").button({ label: "Yea" });
	jQuery("#nay").button({ label: "Nay" });
	jQuery("#abst").button({ label: "Present" });
});
