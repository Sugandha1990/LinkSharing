
function deleteConfirm(id) {
    var url = "${createLink(controller: 'topic',action: 'deleteTopic')}";
    BootstrapDialog.confirm({
        title: 'WARNING',
        message: 'Warning! Do you really wanna delete??????',
        type: BootstrapDialog.TYPE_WARNING,
        closable: true,
        draggable: true,
        btnCancelLabel: 'Do not Delete it!',
        btnOKLabel: 'Delete it!',
        onshow: function(dialogRef){
            alert('Dialog is popping up, its message is ' + dialogRef.getMessage());
        },
        btnOKClass: 'btn-warning',

        callback: function(result) {
            if(result) {
                var $request = jQuery.ajax({
                    url: url,
                    data: {
                        topic: id
                    },
                    success: function (data) {
                        showError();
                        window.location.href ="/user/dashboard";

                    },
                    error: function (error) {


                        alert(error);
                    }
                });
            }
            else {
                alert('Nope.');
            }
        }
    });

    /*if (confirm("Do you really wanna delete??????")) {
     var $request = jQuery.ajax({
     url: url,
     data: {
     topic: id
     },
     success: function (data) {

     window.location.href ="/user/dashboard"
     },
     error: function (error) {
     alert(error)
     }
     });
     }*/
}
/*
 function editFunction(id,tid,sid,cid) {

 $('#'+tid).css('display','block')
 $('#'+sid).css('display','block')
 $('#'+cid).css('display','block')
 $('#'+id).css('display','none')
 }
 function updateCancel(id,tid,sid,cid) {

 $('#'+tid).css('display','none')
 $('#'+sid).css('display','none')
 $('#'+cid).css('display','none')
 $('#'+id).css('display','block')
 }*/
/*    function formSubmit() {
 alert("in submitForm")
 var url = "${createLink(controller: 'topic',action: 'updateTopic')}";
 jQuery.ajax({
 type:'POST',
 url:url,
 data: {'name':'Sugandha'},
 success: function(data) {
 alert(data);
 },
 error:function(error){
 alert(error)
 }
 });
 }*/
function editf(d1, d2) {
    $('#' + d2).css('display', 'block')
    $('#' + d1).css('display', 'none')
}


function showError(msg) {
    BootstrapDialog.show({
        title:'Error',
        type: BootstrapDialog.TYPE_DANGER,
        message:msg
    });

}


function showSuccess(msg) {
    BootstrapDialog.show({
        title:'Success',
        type: BootstrapDialog.TYPE_SUCCESS,
        message:msg
    });

}