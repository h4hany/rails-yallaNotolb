var init_notifications_lookup;
var openNotification;
var openAllNotifications;
var firstTime = true;
var Notifications;
openNotification = function(notificationId ,orderId){
   notificationTalking.find( notificationId , function(err, notification) {
     	notification.$update({ isRead: true }, function(err, notification) {
              });
           });
            window.location.replace("/orders/"+orderId)
}

init_notifications = function(){
	Notifications = new Entangled('ws://localhost:3000/users/'+currentUserId+'/notifications');
}


openAllNotifications = function(){
		Notifications.create({ body: 'text' }, function(err, message) {
			$("#UnSeenNotifications").hide();

});
}

init_notifications_lookup = function(){

		Notifications.all(function(err, notifications) {
			console.log(notifications);
			  var holder=document.getElementById("notifications");

	          var newHolder = '';
	          var numberOfUnSeen = 0;
	          var limitOfNotification = notifications.length-11;
	          limitOfNotification = Math.max(0,limitOfNotification);
	          var classes = "dark";

	          for( var i = notifications.length-1 ; i >= limitOfNotification  ; i-- ){
	            if(notifications[i].isRead){
	              classes = "dark";              
	            }
	            else{
	              classes = "white"; 
	            }

	            var notifText=notifications[i].name + notifications[i].ofrom
	              newHolder += "<li class='"+classes+"' onclick="+"openNotification('"+notifications[i].id +"','"+notifications[i].orderId+"') >" + notifText+"</li>";
	            
	            if(notifications[i].seen == 0|| notifications[i].seen == false){
	                numberOfUnSeen += 1;              
	            }
	            
	          }

	          if(numberOfUnSeen > 0 && firstTime !=false  ){
	            new Audio('/notification.mp3').play();
	            firstTime = false;

	          }
	          if(firstTime){
	            firstTime = false;
	          }
	          if(numberOfUnSeen > 0){
	          $("#UnSeenNotifications").html(numberOfUnSeen);
			  $("#UnSeenNotifications").show();
			}
			else{
				$("#UnSeenNotifications").hide();
			}
	          newHolder += '<li role="presentation" class="divider"></li>';
	          newHolder += '<li role="presentation"><a href="/allNotifications/'+currentUserId+'">show all notifications</a></li>'
	          $("#notifications").html(newHolder);
	          //holder.innerHTML = newHolder;       

        
		});


}
//init_notifications_lookup();
init_notifications();
	 setInterval(function(){ init_notifications_lookup(); }, 3000);
/*$(function(){
	init_notifications();
	 setInterval(function(){ init_notifications_lookup(); }, 3000);
	
});*/