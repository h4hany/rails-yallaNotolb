var users = [];
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
}

function insertUsers(users){
	var elm;
	
	for(var i = 0;i < users.length;i++){
		elm = "<div id=" + users[i].id + " class='row'><h3>" + users[i].email + "</h3>&nbsp;<a href='#' onclick='removeFriend("+users[i].id+")'><i class='fa fa-times'></i></a></div>";
		$('#users-container').append(elm);
	}
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
					users.push(response.user[i]);
				}
				insertUsers(response.user);
			}
			else
				console.alert("there in no user or group with the specidfied name");
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
				users.push(response.user)
				insertUsers([response.user]);
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