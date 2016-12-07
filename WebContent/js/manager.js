/**
 * 
 */

$(function(){
	
	obj = {
		search:function(){
//			alert('');
			$('#manager').datagrid('load',{
				user:$.trim($('input[name="user"]').val()),
			});
		},
	};
	
	$('#manager').datagrid({
		url:'manager_data.do',
//		url:'manager_data.jsp',
		title:'用户列表',
		iconCls:'icon-home',
		fit:true,
		fitColumns:true,
		rownumbers:true,
		border:false,
		striped:true,
		pagination:true,
		pageSize:5,
		pageList:[5,10,15],
		pageNumber:1,
		sortName:'date',
		sortOrder:'desc',
		toolbar:'#tb',
		columns:[[{
			title:"自动编号",
			field:'id',
			width:100,
			checkbox:true,
		},
		{
			title:"用户名",
			field:'user',
			width:200,
			sortable:true,
			halign:'center'
		},
		{
			title:"邮箱",
			field:'email',
			width:300,
			sortable:true,
			halign:'center'
		},
		{
			title:"日期",
			field:'date',
			width:300,
			sortable:true,
			halign:'center'
		}
		]]		
	});
	
	$('#manager_add').dialog({
		width:350,
		title:"新增管理",
		iconCls:'icon-add',
		modal:true,
		closed:true,
		buttons:[{
			text:'提交',
			iconCls:'icon-add',
			handler:function(){
				if($('#manager_add').form('validate')){
					$.ajax({
						url:'addManager.do',
						type:'post',
						data:{
							user:$('input[name="manager"]').val(),
							password:$('input[name="password"]').val(),
							email:$('input[name="email"]').val(),
						},
						beforeSend:function(){
							$.messager.progress({
								text:'正在新增中...',
							});
						},
					});
				}
			}
		},{
			text:'取消',
			iconCls:'icon-cancel',
			handler:function(){
				$('#manager_add').dialog('close').form('reset');
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
	manager_tool ={
			add:function(){
				$('#manager_add').dialog('open');
				$('input[name="manager"]').focus();
			}
	};
	
	
});