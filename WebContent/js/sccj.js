/**
 * 
 */

$(function(){
	
	obj = {
		search:function(){
			$('#manager').datagrid('load',{
				user:$.trim($('input[name="user"]').val()),
			});
		},
	};
	
	$('#sccj').datagrid({
		url:'sccj.do?method=getAll',
		title:'生产厂家列表',
		iconCls:'icon-home',
		fit:true,
		fitColumns:true,
		rownumbers:true,
		border:false,
		striped:true,
		pagination:true,
		pageSize:15,
		pageList:[15,20,25],
		pageNumber:1,
		sortName:'cbm',
		sortOrder:'asc',
		toolbar:'#tb',
		/*toolbar:[{
                        id: 'btnAddChoise',
                        text: '添加选择',
                        iconCls: 'icon-add',
                        handler: function () {
                            addChoise();//实现添加记录
                        },
                    }, '-', {
                        id: 'btnComplete',
                        text: '完成选择',
                        iconCls: 'icon-ok',
                        handler: function () {
                            completeChoise();//完成选择并返回
                        }
                    }, '-', {
                        id: 'btnCleare',
                        text: '清空',
                        iconCls: 'icon-remove',
                        handler: function () {
                            cleareChoise();//清空用户选择记录
                        }
                    }, '-', {
                        id: 'btnReload',
                        text: '刷新',
                        iconCls: 'icon-reload',
                        handler: function () {
                            //实现刷新栏目中的数据
                            $("#grid").datagrid("reload");
                        }
                    }],
                    */
		columns:[[{
			title:"自动编号",
			field:'ID',
			width:50,
			checkbox:true,
		},
		{
			title:"编号",
			field:'CBM',
			width:50,
			sortable:true,
			halign:'center'
		},
		{
			title:"厂家名称",
			field:'cjname',
			width:200,
			sortable:true,
			halign:'center'
		},
		{
			title:"拼音码",
			field:'CPYM',
			width:200,
			sortable:true,
			halign:'center'
		},
		{
			title:"国别",
			field:'CGB',
			width:50,
			sortable:true,
			halign:'center'
		},
		{
			title:"单位地址",
			field:'CDWDZ',
			width:100,
			sortable:true,
			halign:'center'
		},
		{
			title:"联系人",
			field:'CLXR',
			width:50,
			sortable:true,
			halign:'center'
		},
		{
			title:"电话",
			field:'CDH',
			width:50,
			sortable:true,
			halign:'center'
		},
		{
			title:"邮箱",
			field:'CEmail',
			width:100,
			sortable:true,
			halign:'center'
		},
		{
			title:"可用性",
			field:'BENABLE',
			width:100,
			sortable:true,
			halign:'center',
			formatter: function (val, rowdata, index) {
                             if (val==1) {
                                 return '可用';
                             } else {
                                 return '不可用';
                             }
                         }
		},
		{
			title:"档案号",
			field:'CDAH',
			width:100,
			sortable:true,
			halign:'center'
		},
		{
			title:"备注",
			field:'CBZ',
			width:100,
			sortable:true,
			halign:'center'
		}
		]]		
	});
	
	$('#sccj_add').dialog({
		width:650,
		title:"新增管理",
		iconCls:'icon-add',
		modal:true,
		closed:true,
		buttons:[{
			text:'提交',
			iconCls:'icon-add',
			handler:function(){
				if($('#sccj_add').form('validate')){
					$.ajax({
						url:'sccj.do?method=add',
						type:'post',
						data:$('#sccj_add').serialize(),
						beforeSend:function(){
							$.messager.progress({
								text:'正在新增中...',
							});
						},
						success:function(data,response,status){
							$.messager.progress('close');
							if(data>0){
								$.messager.show({
									title:'提示',
									msg:'新增生产厂家成功',
								});
								$('#sccj_add').dialog('close').form('reset');
								$('#sccj').datagrid('reload');//刷新
							}else{
								$.messager.alert('新增失败！','未知错误！','warning');
							}
						},
					});
				}
			}
		},{
			text:'取消',
			iconCls:'icon-cancel',
			handler:function(){
				$('#sccj_add').dialog('close').form('reset');
			}
		}]
	});
	
	//验证
	$('input[name="manager"]').validatebox({
		required:true,
		validType:'length[2,20]',
		missingMessage:'请输入账号',
		invalidMessage:'管理名称在2-20位',
	});
	//验证
	$('input[name="password"]').validatebox({
		required:true,
		validType:'length[3,20]',
		missingMessage:'请输入管理密码',
		invalidMessage:'管理密码在3-20位',
	});
	
	//点击新增
	sccj_tool ={
			add:function(){
				$('#sccj_add').dialog('open');
				$('input[name="cbm"]').focus();
			},
			//删除
			remove:function(){
				var rows = $('#sccj').datagrid('getChecked');
				if(rows.length>0){
					$.messager.confirm('确定操作',"您真的要删除所选中的记录吗？",function(flag){
						if(flag){
							var ids=[];
							for(var i=0;i<rows.length;i++){
								ids.push(rows[i].ID);
							}
							$.ajax({
								type:'POST',
								url:'sccj.do?method=del',
								data:{
									ids:ids.join(','),
								},
								beforeSend:function(){
									$('#sccj').datagrid('loading');
								},
								success:function(data){
									if(data){
										$('#sccj').datagrid('loaded');
										$('#sccj').datagrid('load');
										$('#sccj').datagrid('unselectAll');
										$.messager.show({
											title:'提示',
											msg:data+'个生产厂家被删除成功！',
										});
									}
								},
							});
						}
					});
				}else{
					$.messager.alert('提示','请选择要删除的记录！','info');
				}
			},
			//编辑
			edit:function(){
				var rows = $('#sccj').datagrid('getSelections');
				if(rows.length>1){
					$.messager.alert('操作提示！','编辑记录只能选择一条记录！','warning');
				}else if(rows.length==1){
					$.ajax({
						url:'sccj.do?method=getOneByID',
						type:'post',
						data:{
							id:rows[0].id,
						},
						beforeSend:function(){
							$.messager.progress({
								text:'正在获取中...',
							});
						},
						success:function(data,response,status){
							$.messager.progress('close');
							if(data){
								var obj = $.parseJSON(data);
								$('#sccj_edit').form('load',{
									zhuanyiid:obj[0].id,
									diaobodate_edit:obj[0].diaobodate,
									pizhunren_edit:obj[0].pizhunren,
									oldkeshi_edit:obj[0].oldkeshi,
									newkeshi_edit:obj[0].newkeshi,
									olddidian_edit:obj[0].olddidian,
									newdidian_edit:obj[0].newdidian,
									zybeizhu_edit:obj[0].beizhu,
								}).dialog('open');
							}else{
								$.messager.alert('获取失败！','未知错误！','warning');
							}
						},
					});
				
				}else if(rows.length==0){
					$.messager.alert('修改失败！','编辑记录至少选择一条记录！','warning');
				}
			},
	};
	
	
});