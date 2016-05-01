


/*
var init_notifications_lookup;
var openNotification;
var firstTime = true;
openNotification = function(notificationId ,orderId){
   notificationTalking.find( notificationId , function(err, notification) {
     	notification.$update({ isRead: true }, function(err, notification) {
              });
           });
            window.location.replace("/orders/"+orderId)
}



  //    
//      
init_notifications_lookup = function(){

	alert("hi");

	var Message = new Entangled('ws://localhost:3000/users/'+currentUserId+'/notifications');
		Message.all(function(err, notifications) {
			  var holder=document.getElementById("notifications");

	          var newHolder = '<a id="noteClicker" class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false"> <%= fa_icon "bell-o" , :class => "fa-2x"%><span class="caret"></span></a><ul class="dropdown-menu">'

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

	          if(numberOfUnSeen > 0 && !firstTime  ){
	            new Audio('/notification.mp3').play();

	          }
	          if(firstTime){
	            firstTime = false;
	          }
	          noteWrapper.setNotificationScene(numberOfUnSeen)
	          //$("#UnSeenNotifications").html(numberOfUnSeen)

	          newHolder += '<li role="presentation" class="divider"></li>';
	          newHolder += '<li role="presentation"><a href="/allNotifications/'+currentUserId+'">show all notifications</a></li>'
	          holder.innerHTML = newHolder;       

        
		});


}
*/
/*$(document).ready(function(){
	 setInterval(function(){ init_notifications_lookup(); }, 3000);
	
});*/