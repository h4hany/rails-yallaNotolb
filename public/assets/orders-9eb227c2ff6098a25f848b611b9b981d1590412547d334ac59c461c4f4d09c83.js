var users = [];
var userIds = [];

function getUserIndex(id){
	for(var i = 0; i < users.length; i++){
		if(users[i].id == id)
			return i;
	}
	return -1;
}

function removeFriend(id){
	var idx = getUserIndex(id);
	users.splice(idx,1);
	$('#'+id).remove();
	// --
	var invited = parseInt($('#ordr_invited').val());
	invited--;
	$('#ordr_invited').val(invited);
	// --
	var arr = ($('#ordr_uids').val()).split(",");
	var idx = arr.indexOf(id.toString());
	arr.splice(idx,1);
	$('#ordr_uids').val(arr.toString());
	console.log(arr);
}

function insertUsers(users){
	var elm;
	var invited = parseInt($('#ordr_invited').val());

	for(var i = 0;i < users.length;i++){
		elm = "<div id=" + users[i].id + " class='row'><h3>" + users[i].email + "</h3>&nbsp;<a href='#' onclick='removeFriend("+users[i].id+")'><i class='fa fa-times'></i></a></div>";
		$('#users-container').append(elm);
		invited++;
		$('#ordr_uids').val($('#ordr_uids').val()+","+users[i].id);
	}
	userIds = ($('#ordr_uids').val()).split(",");
	$('#ordr_invited').val(invited);
}
function addFriendsFromGroup(){
	var val = $('#ordr_virtual_attribute').val();
	var url = "/group/getUsers";
	$.ajax({
		url:url,
		method:'post',
		data:{
			"str": val
		},
		success:function(response){
			if(response.user != null){
				for(var i = 0; i < response.user.length;i++){
					if(getUserIndex(response.user[i].id) < 0){
						users.push(response.user[i]);
						insertUsers([response.user[i]]);
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

function addFriend(){
	var val = $('#ordr_virtual_attribute').val();
	var url = "/user/getId";
	$.ajax({
		url:url,
		method:'post',
		data:{
			"str": val
		},
		success:function(response){
			if(response.user != null){
				if(getUserIndex(response.user.id) < 0){
					users.push(response.user)
					insertUsers([response.user]);
				}
			}
			else
				addFriendsFromGroup();
		},
		error:function(err,status,error){
			console.log(error);
		},
		complete:function(complete){
			console.log("complete");
		},
		dataType:'json'
	});
	// console.log(val);
	// console.log($('#ordr_virtual_attribute'));
}

function addOrder(){
	console.log("heeey");
}
