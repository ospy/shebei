
$(function(){
	
	
	$('#keshi').datagrid({
		url:'keshi_data.do',
//		title:'科室列表',
//		iconCls:'icon-home',
		singleSelect:true,
		selectOnCheck:false,
		checkOnSelect:false,
		fit:true,
		fitColumns:true,
		rownumbers:true,
		border:false,
		striped:true,
		pagination:true,
		pageSize:30,
		pageList:[20,30,40],
		pageNumber:1,
		sortName:'id',
		sortOrder:'desc',
		toolbar:'#keshi_tb',
		columns:[[{
			title:"自动编号",	field:'id',	width:100,checkbox:true,},
		{	title:"科室名",	field:'keshiname',	width:200,	sortable:true,halign:'center'},
		{	title:"负责人",	field:'keshimanager',width:300,	sortable:true,	halign:'center'},
		{	title:"楼层",field:'keshiposition',	width:300,	sortable:true,	halign:'center'}
		]]		
	});
	
	//新增
	$('#keshi_add').dialog({
		width:350,
		title:"新增管理",
		iconCls:'icon-add',
		modal:true,
		closed:true,
		buttons:[{
			text:'提交',
			iconCls:'icon-ok',
			handler:function(){
				if($('#keshi_add').form('validate')){
					$.ajax({
						url:'addKeshi.do',
						type:'post',
						data:{
							keshiname:$('input[name="keshiname"]').val(),
							keshimanager:$('input[name="keshimanager"]').val(),
							keshiposition:$('input[name="keshiposition"]').val(),
						},
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
									msg:'新增科室成功',
								});
								$('#keshi_add').dialog('close').form('reset');
								$('#keshi').datagrid('reload');//刷新
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
				$('#keshi_add').dialog('close').form('reset');
			}
		}]
	});
	
	//修改
	$('#keshi_edit').dialog({
		width:350,
		title:"修改管理",
		iconCls:'icon-edit',
		modal:true,
		closed:true,
		buttons:[{
			text:'提交',
			iconCls:'icon-edit',
			handler:function(){
				if($('#keshi_edit').form('validate')){
					$.ajax({
						url:'updateKeshi.do',
						type:'post',
						data:{
							id:$('input[name="keshiid"]').val(),
							keshiname_edit:$('input[name="keshiname_edit"]').val(),
							keshimanager_edit:$('input[name="keshimanager_edit"]').val(),
							keshiposition_edit:$('input[name="keshiposition_edit"]').val(),
						},
						beforeSend:function(){
							$.messager.progress({
								text:'正在更新中...',
							});
						},
						success:function(data,response,status){
							$.messager.progress('close');
							if(data>0){
								$.messager.show({
									title:'提示',
									msg:'修改科室成功',
								});
								$('#keshi_edit').dialog('close').form('reset');
								$('#keshi').datagrid('reload');//刷新
							}else{
								$.messager.alert('修改失败！','未知错误或没有任何修改！','warning');
							}
						},
					});
				}
			}
		},{
			text:'取消',
			iconCls:'icon-cancel',
			handler:function(){
				$('#keshi_edit').dialog('close').form('reset');
			}
		}]
	});
	
	//验证
	$('input[name="keshiname"]').validatebox({
		required:true,
		validType:'length[2,20]',
		missingMessage:'请输入科室名',
		invalidMessage:'科室名称在2-20位',
	});
	//验证
	$('input[name="keshimanager"]').validatebox({
		required:true,
		validType:'length[2,10]',
		missingMessage:'请输入科室负责人',
		invalidMessage:'科室负责人名称在2-10位',
	});
	
	
	keshi_tool ={
			//刷新
			reload:function(){
				$('#keshi').datagrid('reload');
			},
			//取消选择
			redo:function(){
				$('#keshi').datagrid('clearChecked');
//				$('#keshi').datagrid('unselectAll');
			},
			//点击新增
			add:function(){
				$('#keshi_add').dialog('open');
				$('input[name="keshiname"]').focus();
			},
			//删除
			remove:function(){
				var rows = $('#keshi').datagrid('getChecked');
//				var rows = $('#keshi').datagrid('getSelections');
				if(rows.length>0){
					$.messager.confirm('确定操作',"您真的要删除所选中的记录吗？",function(flag){
						if(flag){
							var ids=[];
							for(var i=0;i<rows.length;i++){
								ids.push(rows[i].id);
							}
							$.ajax({
								type:'POST',
								url:'deleteKeshi.do',
								data:{
									ids:ids.join(','),
								},
								beforeSend:function(){
									$('#keshi').datagrid('loading');
								},
								success:function(data){
									if(data){
										$('#keshi').datagrid('loaded');
										$('#keshi').datagrid('load');
										$('#keshi').datagrid('unselectAll');
										$.messager.show({
											title:'提示',
											msg:data+'个科室被删除成功！',
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
				var rows = $('#keshi').datagrid('getSelections');
				if(rows.length>1){
					$.messager.alert('操作提示！','编辑记录只能选择一条记录！','warning');
				}else if(rows.length==1){
					$.ajax({
						url:'getkeshi.do',
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
								$('#keshi_edit').form('load',{
									keshiid:obj[0].id,
									keshiname_edit:obj[0].keshiname,
									keshimanager_edit:obj[0].keshimanager,
									keshiposition_edit:obj[0].keshiposition,
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