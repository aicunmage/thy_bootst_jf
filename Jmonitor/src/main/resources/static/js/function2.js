
var locale = {
    OK: '确定',
    CONFIRM: '取消',
    CANCEL: '确认'
};

locale.TYPE_DEFAULT = '提示';
locale.TYPE_INFO = '提示';
locale.TYPE_PRIMARY = '提示';
locale.TYPE_SUCCESS = '成功';
locale.TYPE_WARNING = '警告';
locale.TYPE_DANGER = '失败';	 

bootbox.addLocale('bootbox', locale);
	            
	
// 设置Ajax异常统一处理
jQuery.ajaxSetup({
    error: function (jqXHR, textStatus, errorThrown) {
    	bootbox.alert(jqXHR.responseText);
    }
});

function getTableId() {
    var tableId = "table";
    if ($("body").hasClass("modal-open")) {
        tableId = $("body").find("table.table:last").attr("id");
    }
    return tableId;
}

var buttons = {
	 cancel: {
		 id: 'btn-ok',
         label: "关闭",
         className: 'btn-default',
         callback: function(){
        	 console.log("..关闭打印..");
         }
     },
     noclose: {
         label: "重置",
         className: 'btn-info',
         callback: function(){
             return false;
         }
     },
     ok: {
         label: "确认",
         className: 'btn-primary',
         callback: function(dialogRef){
        	 var $button = this;
        	 console.log(dialogRef);
             $button.disable();
             $button.spin();

             var form = dialogRef.getModalBody().find("form");
             var flag = true;
             if ($.fn.formValidation && form.hasClass("fv-form")) {
                 form.data('formValidation').validate();
                 if (!form.data('formValidation').isValid()) {
                     flag = false
                 }
             }
             if (flag) {
                 form.ajaxSubmit({
                     success: function (data, status, $form) {
                         if (data.success) {
                             dialogRef.close();

                             $('#' + getTableId()).bootstrapTable('refresh');
                         } else {
                        	 bootbox.alert(data.message);
                         }

                     },
                     complete:function(){
                     	$button.stopSpin();
                     	$button.enable();
                     }
                 });
             } else {
                 $button.stopSpin();
                 $button.enable();
             }
         }
     }
};


$(function ($) {
    $.add = function (href, callback) {
        var dialog = bootbox.dialog({
            title: '新增',
            message: $('<div></div>').load(href),
            size: 'large',
            buttons: buttons
        });
        if ((typeof callback == 'function') && callback.constructor == Function) {
            callback(dialog);
        }
    };
});