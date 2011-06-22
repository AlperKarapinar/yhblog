$(function() {
	function format(tag) {
		return tag.name;
	}
	$("#post_tag_list").autocomplete('http://localhost:3000/autocomplete_tag_name', {
		multiple: true,
		dataType: "json",
		autoFill: true,
		parse: function(data) {
			return $.map(data, function(row) {
				return {
					data: row,
					value: row.name,
					result: row.name
				}
			});
		},
		formatItem: function(item) {
			return format(item);
		}
	});
});