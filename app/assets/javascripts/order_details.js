/**
 * Created by hany on 30/04/16.
 */
function addOrderDetails(){
    var item= $('#item').val();
    var qty=$('#qty').val();
    var price=$('#price').val();
    var comment=$('#comment').val();
    var url = "/order_details/addAjax";
    $.ajax({
        url:url,
        method:'post',
        data:{
            "item": item,
            "qty": qty,
            "price": price,
            "comment": comment
        },
        success:function(response){
           console.log(response)
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