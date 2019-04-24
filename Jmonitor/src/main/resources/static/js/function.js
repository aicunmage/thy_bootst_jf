BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_DEFAULT] = '提示';
BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_INFO] = '提示';
BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_PRIMARY] = '提示';
BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_SUCCESS] = '成功';
BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_WARNING] = '警告';
BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_DANGER] = '失败';
BootstrapDialog.DEFAULT_TEXTS['OK'] = '确定';
BootstrapDialog.DEFAULT_TEXTS['CANCEL'] = '取消';
BootstrapDialog.DEFAULT_TEXTS['CONFIRM'] = '确认';

// 设置Ajax异常统一处理
jQuery.ajaxSetup({
    error: function (jqXHR, textStatus, errorThrown) {
        BootstrapDialog.alert(jqXHR.responseText);
    }
});

function getTableId() {
    var tableId = "table";
    if ($("body").hasClass("modal-open")) {
        tableId = $("body").find("table.table:last").attr("id");
    }
    return tableId;
}

var buttons = [{
    id: 'btn-ok',
    label: '提交',
    cssClass: 'btn-primary',
    action: function (dialogRef) {
        var $button = this;
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
                        BootstrapDialog.alert(data.message);
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
}, {
    id: 'btn-reset',
    label: '重置',
    cssClass: 'btn-info',
    action: function (dialogRef) {
        dialogRef.getModalBody().find("form").resetForm();
    }
}, {
    id: 'btn-cancle',
    label: '关闭',
    cssClass: 'btn-default',
    action: function (dialogRef) {
        dialogRef.close();
    }
}];

$(function ($) {
    $.add = function (href, callback) {
        var dialog = BootstrapDialog.show({
            title: '新增',
            message: $('<div></div>').load(href),
            draggable: true,
            type: BootstrapDialog.TYPE_SUCCESS,
            buttons: buttons
        });

        if ((typeof callback == 'function') && callback.constructor == Function) {
            callback(dialog);
        }
    };

    $.edit = function (href, targetUrl, callback) {
        var records = $('#' + getTableId()).bootstrapTable('getSelections');
        if (records.length == 0) {
            BootstrapDialog.alert({
                title: '提示',
                message: '请选择要修改的行'
            });
            return;
        }

        var dialog = BootstrapDialog.show({
            title: '编辑',
            message: $('<div></div>').load(href + records[0].id + (targetUrl == undefined ? "" : "?targetUrl=" + targetUrl)),
            draggable: true,
            type: BootstrapDialog.TYPE_PRIMARY,
            buttons: buttons
        });

        if ((typeof callback == 'function') && callback.constructor == Function) {
            callback(dialog);
        }
    };

    $.del = function (href) {
        var records = $('#' + getTableId()).bootstrapTable('getSelections');
        if (records.length == 0) {
            BootstrapDialog.alert('请选择要删除的行');
            return;
        }

        /*if(records.length > 1) {
        	 BootstrapDialog.confirm('确定要删除选中数据?', function (result) {
                 if (result) {
                	 var ids = [];
                 	 for (var i = 0; i < records.length; i++) {
                 		 ids.push(records[i].id);
					 }
                 	$.ajax({
                		type : "POST",
						url : href,
						data : {
							ids:ids.join(",")
						},
						success : function(msg) {
							$('#' + getTableId()).bootstrapTable('refresh');
						},
						error : function() {
							BootstrapDialog.alert({
                                title: '提示',
                                message: '删除失败'
                            });
						}
                	});
                 }
             });
        	 return;
        }*/
        
        BootstrapDialog.confirm('确定要删除该行数据?', function (result) {
            if (result) {
                $.getJSON(href + records[0].id, function (data) {// 提交后台进行删除
                    if (data.success) {
                        $('#' + getTableId()).bootstrapTable('refresh');
                    } else {
                        BootstrapDialog.alert(data.message);
                    }
                });
            }
        });
    };

    $.query = function (params) {
        var c = $("#search-form").serializeArray();
        $.each(c, function(index, data) {
            if (data.value != "") {
                params[data.name] = data.value;
            }
        });
        return params;
    };

    $.tableRefresh = function () {
        $('#table').bootstrapTable('refresh');
    };
    $.tableRefreshcust = function (table) {
    	$('#'+table).bootstrapTable('refresh');
    };

    $.tableReset = function(callback) {
    	console.log(";;;;;;;;;;;;;;;;;;;;;;;");
    	console.log(getTableId());
    	console.log(";;;;;;;;;;;;;;;;;;;;;;;");
        $('#search-form').resetForm();

        if ((typeof callback == 'function') && callback.constructor == Function) {
            callback();
        }
        $.tableRefresh();
    };

    $.ajaxSelect = function (options) {
        var defaults = {
            url: '',
            selectId: '#select',
            valueName: 'value',
            textName: 'text',
            defaultValue: '',
            callback: undefined,
            data: null
        };

        var settings = $.extend({}, defaults, options);
        var $select = $(settings.selectId);

        if(settings.data == null) {
            $.ajax({
                url : settings.url,
                dataType : "json",
                async : false
            }).done(function(data) {
                var tempObj = {};
                tempObj[settings.valueName] = "";
                tempObj[settings.textName] = "请选择";

                data.unshift(tempObj);
                settings.data = data;
            });
        }

        $.each(settings.data, function(index, value) {
            $("<option value='" + value[settings.valueName] + "'>" + value[settings.textName] + "</option>").appendTo($select);
        });

        $select.selectpicker('refresh').on('change', function(event) {
            var $form = $(settings.selectId).parents("form");
            if ($.fn.formValidation && $form.hasClass("fv-form")) {
                $form.formValidation('revalidateField', $select);
            }
        });
        $select.selectpicker('val', settings.defaultValue);

        if ((typeof settings.callback == 'function') && settings.callback.constructor == Function) {
            settings.callback();
        }
    };
});