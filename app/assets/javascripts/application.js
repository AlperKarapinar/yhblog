// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require ./jquery.bgiframe
//= require ./jquery.dimensions
//= require ./jquery.autocomplete
//= require ./jquery.markitup
//= require ./set
//= require ./xregexp
//= require ./shCore
//= require ./shAutoloader
//= require ./shBrushRuby
//= require_tree .


$(document).ready(function() {
  //Find all <pre> tags that have a <code> tag child, and add the "brush: ruby" class to the <pre> tag.  
  $('pre:has(code)').addClass('brush: ruby');
  //Find each <code> tag (with a <pre> parent), and replace it’s contents with itself leaving only the <pre> tag behind.
  $('pre>code').each(function(index) {
    var cnt = $(this).contents();  
    $(this).replaceWith(cnt);   
  });
  SyntaxHighlighter.all();
	var yieldh = $(".yield").height();
	if ( $(".sidebar").height() < yieldh ){
    $(".sidebar").height(yieldh);
  }
});


