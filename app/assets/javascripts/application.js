// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require ./jquery.bgiframe
//= require ./jquery.dimensions
//= require ./jquery.markitup
//= require ./jquery.autocomplete
//= require ./autocomplete-rails
//= require_tree .



$(document).ready(function() {
	var yieldh = $(".yield").height();
	if ( $(".sidebar").height() < yieldh ){
    $(".sidebar").height(yieldh);
  }
});

$(function() {
	function format(tag) {
		return tag.name;
	}
	$("#post_tag_list").autocomplete('http://dev.yh.com.tr/autocomplete_tag_name', {
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




