// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var task_collapse = function(el){
		var ul = el.find('.tasks ul');
		var tasks = el.children('.tasks');
		var len = ul.children('li').length;
		ul.children('li').each(function(index){
			$(this).css({"z-index": len-index, "position": "absolute"});
		});
		tasks.css({"position": "absolute", "top": "60%"});
		tasks.addClass("toggled");
	};

function updateVal(currentEle, value)
{
    $(currentEle).html('<input class="thVal" type="text" value="'+value+'" />');
    $(".thVal").focus();
    $(".thVal").keyup(function(event){
        if(event.keyCode == 13){
            $(currentEle).html($(".thVal").val().trim());
        }
    });

//    $('body').not(".editable").click(function(){
//        if(('.thVal').length != 0)
//        {
//        	$(currentEle).html($(".thVal").val().trim());
//        }
//
//    });
}

function ajaxcalls(action,data) {
	$.ajax({
    		method: 'GET',
    		url: action,
    		data: data,
    		dataType: 'script'
    	});
}

function update_task(description, hours_left, hours_total, color) {

}

function update_story(project, sprint, title, story_points, priority, keyword, acceptance_criteria, description, color, order) {

}

var main = function () {
	
	var toggleState = true;

	$('.taskboard-menu').on("click", function(){
		if(toggleState) {
			$('.taskboard-items').animate({width: 0}, 'fast');
			$('.taskboard-items').css("padding", "4px");
			//$('.taskboard-items').find('h4').css("visibility", "hidden");
			//$('.taskboard-items').find('h4').collapse();
			//$('.menu-arrow').html('<span class="glyphicon glyphicon-chevron-right"></span><p>Close</p>');
		}
		else {
			$('.taskboard-items').animate({width: 200}, 'fast');
			//$('.menu-arrow').html('<span class="glyphicon glyphicon-chevron-left"></span><p>Open Menu</p>');
			$('.taskboard-items').find('h4').css("visibility", "visible");
		}		
		toggleState = !toggleState;
	});


	$('.sticky-container').each(function(){
		//var len = $(this).children('li').length;
		task_collapse($(this));
	});

	$('.sticky .glyphicon').on("click", function () {
		var tasks = $(this).parents('.sticky-container').find('.tasks');
		if(tasks.hasClass('toggled')) {
			tasks.removeClass('toggled');
			tasks.parent().find('*').removeAttr('style');
		} else {
			task_collapse($(this).parents('.sticky-container'));
		}
	});

	$("body").on("dblclick", ".editable", function(e){
		//e.stopPropagation();    
		var currentElement = $(this);
	    var value = $(this).html();
	    var editableText = $("<input />");
	    editableText.val(value);
	    $(this).replaceWith(editableText);
	    editableText.focus();
	    //updateVal(currentEle, value);
	    editableText.blur(function() {
	    	$(this).replaceWith(currentElement.val(value));
	    });
	    editableText.keyup(function(event){
	        if(event.keyCode == 13){
	        	value = $(this).val().trim();
	        	var changedhtml = currentElement.html(value);
	            $(this).replaceWith(changedhtml);


	            if(changedhtml.hasClass('keyword')) {
	            	
	            	var sticky_id = currentElement.parent('.sticky').attr('id');

	            	var action = '/stories/' + sticky_id;
	            	//var data = $(this).serializeArray();
	            	var data = { story: { keyword: value } };

	            	ajaxcalls(action, data);
	            }
	            else if(changedhtml.hasClass('title')) {
	            	var sticky_id = currentElement.parent('.sticky').attr('id');

	            	var action = '/stories/' + sticky_id;
	            	//var data = $(this).serializeArray();
	            	var data = { story: { title: value } };

	            	ajaxcalls(action, data);
	            }
	            else if(changedhtml.hasClass('task')) {

	            	var task_id = currentElement.parent('li').attr('id');

	            	var action = '/tasks/' + task_id;

	            	var data = { task: { description: value }};

	            	ajaxcalls(action, data);
	            }
	            
	        }
	    });
	});


	$('body').on('click', '.bar', function () {

		if ($(this).hasClass('grey')) {
			$(this).addClass('green').removeClass('grey');
			$(this).prevUntil('.green').addClass('green').removeClass('grey');
			var hour = parseInt($(this).attr('id'));
			var data = { task: { hours_left: hour } };
			var task_id = $(this).parents('li').attr('id');
			var action = '/tasks/' + task_id;
			ajaxcalls(action,data);
		}
		else {
			$(this).addClass('grey').removeClass('green');
			$(this).nextUntil('.grey').addClass('grey').removeClass('green');
			var hour = parseInt($(this).attr('id'));
			var data = { task: { hours_left: hour } };
			var task_id = $(this).parents('li').attr('id');
			var action = '/tasks/' + task_id;
			ajaxcalls(action,data);
		}
	});

	$('.poster').sortable({
		connectWith: ".sticky-container",
		placeholder: "sortable-placeholder"
	});

	$('body').on('click', '.sticky .glyphicon-plus', function () {
		var tasks = $(this).parent('.sticky').siblings('.tasks').first();
		if(tasks.hasClass('toggled')) {
			tasks.removeClass('toggled');
			tasks.parent().find('*').removeAttr('style');
		}
		//var current = tasks.children('ul').first().append('<li><input placeholder="description"><input placeholder="total hours"></li>');
		var current = $('<li><input placeholder="description"><input placeholder="total hours"></li>').appendTo(tasks.children('ul').first());
		
		current.children('input').first().focus();
		//$('.new-description').focus();
		// $('body').not('li').click(function(e) {
		// 	e.stopPropagation();
		// 	alert("off!");
		// 	//$(current).remove();
		// });
		//current.focusout(function() {
		//	$(current).remove();
		//});
		current.keyup(function(e) {
			if (e.keyCode == 13) {
				var desc = current.children('input').first().val().trim();
				var hours = current.children('input').last().val().trim();
				var story_id = current.parents('.tasks').siblings('.sticky').attr('id');
				var data = { task: { description: desc, hours_total: hours, story_id: story_id } };
				var action = '/tasks/';
				ajaxcalls(action,data);
				$(current).remove();
			}
		});
	});

	$('body').on('click', '.story-points', function() {
		var expandable = $(this).next('.story-points-expandable');
		var story_points = $(this);
		//var toggled = true;
		expandable.animate({width: "160px"}, 500);
		// $('body').not(expandable).click(function() {
		// 	if (toggled) {
		// 		expandable.animate({width: "0"}, 500);	
		// 	}
			
		// });
		expandable.children().click(function () {
			var id = $(this).parents('.sticky').attr('id');
			var points = $(this).text();
			var data = { story: { story_points: points } };
			var action = '/stories/' + id;
			ajaxcalls(action,data);
			story_points.html('<p>'+points+'</p>');
			expandable.animate({width: "0"}, 500);
		});
	});

};

$(document).ready(main);