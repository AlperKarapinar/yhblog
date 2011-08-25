// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require ./jquery.bgiframe
//= require ./jquery.dimensions
//= require ./autocomplete-rails
//= require ./jquery.autocomplete
//= require ./jquery.markitup
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




