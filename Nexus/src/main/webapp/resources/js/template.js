$(function(){

    $("#tokenSubmit").click(function(){
        var token = $("#gitToken").val();
        $.ajax({
            url:"enrollToken",
            data:{token:token},
            type:"POST",
            success:function(data){
               
                alertify.alert(data);
                location.href="repository.p";

            }, error:function(){
                alertify.alert("등록중에 에러가 발생했습니다. 다시 등록해주세요");
            }
        })
    })
})