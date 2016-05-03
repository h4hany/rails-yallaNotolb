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
//= require jquery.min
//= require jquery.easing.1.3
//= require jquery_ujs
//= require turbolinks
//= require jquery.min
//= require jquery.lightbox
//= require jquery-ui
//= require autocomplete-rails
//= require_tree .

var friends = [];
var friendIds = [];

function getElementIndex(arr,id){
	for(var i = 0; i < arr.length; i++){
		if(arr[i].id == id)
			return i;
	}
	return -1;
}

function removeUser(id){
	var idx = getElementIndex(friends,id);
	friends.splice(idx,1);
	$('#'+id).remove();
	// --
	// var invited = parseInt($('#ordr_invited').val());
	// invited--;
	// $('#ordr_invited').val(invited);
	// --
	var arr = ($('#group_uids').val()).split(",");
	var idx = arr.indexOf(id.toString());
	arr.splice(idx,1);
	$('#group_uids').val(arr.toString());
	console.log(arr);
}

function insertFriends(friends,editable){
	if(typeof(editable) == 'undefined')
		editable = true;
	var elm;
	for(var i = 0;i < friends.length;i++){
		if(editable)
			elm = "<div id=" + friends[i].id + " class='row'><h3>" + friends[i].email + "</h3>&nbsp;<a href='#' onclick='removeUser("+friends[i].id+")'><i class='fa fa-times'></i></a></div>";
		else
			elm = "<div id=" + friends[i].id + " class='row'><h3>" + friends[i].email + "</h3>&nbsp;</div>";
		$('#users-container').append(elm);
		// invited++;
		if(editable)
			$('#group_uids').val($('#group_uids').val()+","+friends[i].id);
	}
	if(editable)
		friendIds = ($('#group_uids').val()).split(",");
	// $('#ordr_invited').val(invited);
}
// function addFriendsFromGroup(){
// 	var val = $('#ordr_virtual_attribute').val();
// 	var url = "/group/getUsers";
// 	$.ajax({
// 		url:url,
// 		method:'post',
// 		data:{
// 			"str": val
// 		},
// 		success:function(response){
// 			if(response.user != null){
// 				for(var i = 0; i < response.user.length;i++){
// 					if(getElementIndex(response.user[i].id) < 0){
// 						friends.push(response.user[i]);
// 						insertFriends([response.user[i]]);
// 					}
// 				}
// 			}
// 			else
// 				console.log("there in no user or group with the specidfied name");
// 		},
// 		error:function(err,status,error){
// 			console.log(error);
// 		},
// 		complete:function(complete){
// 			console.log("complete");
// 		},
// 		dataType:'json'
// 	});
// }

function addUser(){
	var val = $('#group_virtual_attribute').val();
	console.log("hey")
	var url = "/user/getFriendId";
	$.ajax({
		url:url,

		method:'get',
		method:'GET',
		data:{
			"str": val
		},
		success:function(response){
			if(response.user != null){
				console.log(getElementIndex(friends,response.user.id));
				if(getElementIndex(friends,response.user.id) < 0){
					friends.push(response.user)
					insertFriends([response.user]);
				}
			}
		},
		error:function(err,status,error){
			console.log(error);
		},
		complete:function(complete){
			console.log("complete");
		},
		dataType:'json'
	});
}


function getGroupMembers(){
	var val = $('#group_gname').val();
	var url = "/group/getUsers";
	$.ajax({
		url:url,
		method:'GET',
		data:{
			"str": val
		},
		success:function(response){
			if(response.user != null){
				for(var i = 0; i < response.user.length;i++){
					if(getUserIndex(response.user[i].id) < 0){
						friends.push(response.user[i]);
						insertFriends([response.user[i]]);
					}
				}
			}
			else
				console.log("there in no user or group with the specidfied name");
		},
		error:function(err,status,error){
			console.log(error);
		},
		complete:function(complete){
			console.log("complete");
		},
		dataType:'json'
	});
}

function getGroupMembersStatic(){
	var val = $('#group_gname').html();
	var url = "/group/getUsers";
	$.ajax({
		url:url,
		method:'GET',
		data:{
			"str": val
		},
		success:function(response){
			if(response.user != null){
				for(var i = 0; i < response.user.length;i++){
					if(getUserIndex(response.user[i].id) < 0){
						friends.push(response.user[i]);
						insertFriends([response.user[i]],false);
					}
				}
			}
			else
				console.log("there in no user or group with the specidfied name");
		},
		error:function(err,status,error){
			console.log(error);
		},
		complete:function(complete){
			console.log("complete");
		},
		dataType:'json'
	});
}

function autocomplet_group() {
    var min_length = 0; // min caracters to display the autocomplete
    var keyword = $('#ordr_virtual_attribute').val();
    var url = '/group/getGroupNameLikeString';
    if (keyword.length >= min_length) {
        $.ajax({
            url: url,
            type: 'GET',
            data: {keyword:keyword},
            success:function(data){
            	$('#contacts').empty();
                if(data.groups.length > 0) {
                    for(var i = 0; i < data.groups.length; i++){
                    	$('#contacts').append("<option value='"+data.groups[i]+"'>");
                    }
                }
            }
        });
    } else {
        $('#local_list_id').hide();
    }
}

function autocomplet_friend() {
    var min_length = 0; // min caracters to display the autocomplete
    var keyword = $('#ordr_virtual_attribute').val();
    var url = '/user/getFriendLikeString';
    if (keyword.length >= min_length) {
        $.ajax({
            url: url,
            type: 'GET',
            data: {keyword:keyword},
            success:function(data){
            	$('#contacts').empty();
                if(data.emails.length > 0) {
                    for(var i = 0; i < data.emails.length; i++){
                    	$('#contacts').append("<option value='"+data.emails[i]+"'>");
                    }
                }else
                    autocomplet_group();
            }
        });
    } else {
        $('#local_list_id').hide();
    }
}

function autocomplet_user() {
	console.log("dfghjk")
    var min_length = 0; // min caracters to display the autocomplete
    var keyword = $('#user_email').val();
    var url = '/user/getUserLikeString';
    if (keyword.length >= min_length) {
        $.ajax({
            url: url,
            type: 'GET',
            data: {keyword:keyword},
            success:function(data){
            	console.log(data)
            	$('#contacts').empty();
                if(data.emails.length > 0) {
                    for(var i = 0; i < data.emails.length; i++){
                    	$('#contacts').append("<option value='"+data.emails[i]+"'>");
                    }
                }else
                    autocomplet_group();
            }
        });
    } else {
        $('#local_list_id').hide();
    }
}

function set_item(item) {
    jQuery(document).ready(function($){

        // change input value
        $('#local_id').val(item);
        // hide proposition list
        $('#local_list_id').hide();});
}

