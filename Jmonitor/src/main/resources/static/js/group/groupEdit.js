//////////////////////group增改删--bootbox//////////////////////////////////////////////////////////////////////
	// bootbox
	var locale = {
		OK : '确定',
		CONFIRM : '取消',
		CANCEL : '确认'
	};
	bootbox.addLocale('bootbox', locale);
	var buttons = {
		cancel : {
			id : 'btn-ok',
			label : "关闭",
			className : 'btn-default',
			callback : function() {
			}
		},
		noclose : {
			label : "重置",
			className : 'btn-info',
			callback : function() {
				$("#editLayerFrom")[0].reset();
				return false;
			}
		},
		ok : {
			label : "确认",
			className : 'btn-primary',
			callback : function() {
				$("#editGroupFrom").ajaxSubmit({
					success : function(data, status, $form) {
						if (data.status == 200) {
							groupMap=getGroupMap();
							$("#group_table").bootstrapTable('refresh');
							$("#rule_table").bootstrapTable('refresh');
						} else {
							bootbox.alert("提交失败");
						}

					},
					complete : function() {

					}
				});
			}
		}
	};

	//////////////////////group增改删--bootbox//////////////////////////////////////////////////////////////////////
	$(function($) {
		//////////////////////group增改删--add-edit-del//////////////////////////////////////////////////////////////////////
		$.addgroup = function(href, callback) {
			var dialog = bootbox.dialog({
				title : '新增',
				message : $('<div></div>').load(
						href + "?layerId="
								+ $('#layerSelect').selectpicker("val")),
				size : 'large',
				buttons : buttons
			});
			if ((typeof callback == 'function')
					&& callback.constructor == Function) {
				callback(dialog);
			}
		};

		$.editgroup = function(href, callback) {
			var records = $("#group_table").bootstrapTable('getSelections');
			if (records.length == 0) {
				bootbox.alert({
					title : '提示',
					message : '请选择要修改的行'
				});
				return;
			}
			var dialog = bootbox.dialog({
				title : '编辑',
				message : $('<div></div>').load(href + "?id=" + records[0].id),
				size : 'large',
				buttons : buttons
			});

			if ((typeof callback == 'function')
					&& callback.constructor == Function) {
				callback(dialog);
			}
		};

		$.delgroup = function(href) {
			var records = $("#group_table").bootstrapTable('getSelections');
			if (records.length == 0) {
				bootbox.alert({
					title : "提示",
					message : '请选择要删除的行'
				});
				return;
			}
			bootbox.confirm({
				title : "删除",
				message : "确定要删除组及该组下的所有规则信息?",
				callback : function(result) {
					if (result) {
						$.ajax({
							url : href + records[0].id,
							type : 'delete',
							dataType : 'json',
							success : function(msg) {
								$("#group_table").bootstrapTable('refresh');
								$("#rule_table").bootstrapTable('refresh');
							},
							error : function() {
								alert('删除失败');
							}
						});
					}
				}
			});
		};
		//////////////////////group增改删--add-edit-del//////////////////////////////////////////////////////////////////////
	});
