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
//= require camera.min
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

function insertFriends(friends){
	var elm;
	// var invited = parseInt($('#ordr_invited').val());

	for(var i = 0;i < friends.length;i++){
		elm = "<div id=" + friends[i].id + " class='row'><h3>" + friends[i].email + "</h3>&nbsp;<a href='#' onclick='removeUser("+friends[i].id+")'><i class='fa fa-times'></i></a></div>";
		$('#users-container').append(elm);
		// invited++;
		$('#group_uids').val($('#group_uids').val()+","+friends[i].id);
	}
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
<<<<<<< HEAD
		method:'get',
=======
		method:'GET',
>>>>>>> 61ec804dc5ed28b9b5d4c2592b47b13561274cd1
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
