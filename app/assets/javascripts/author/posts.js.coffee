jQuery ->
	r = $.ajax({url: 'http://localhost:3000/autocomplete_tag_name/rai', type: 'get', dataType: 'json'});
	alert r.responseText;
	$("#post_tag_list").autocomplete r.responseText, {multiple: true, dataType: "json"}
