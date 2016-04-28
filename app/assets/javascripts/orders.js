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
			if(response.user != null)
				console.log(response.user);
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
			if(response.user != null)
				console.log(response.user);
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