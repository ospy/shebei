$(function(){
	$('#shebei').datagrid({
		url:'shebei_data.do',
		singleSelect:true,
		selectOnCheck:false,
		checkOnSelect:false,
		fit:true,
		fitColumns:true,
		rownumbers:true,
		border:false,
		striped:true,
		pagination:true,
		pageSize:5,
		pageList:[5,10,15],
		pageNumber:1,
		sortName:'id',
		sortOrder:'desc',
		toolbar:'#shebei_tb',
		onDblClickRow:function(index,row){
			$('#weixiu').datagrid('reload',{
				id:row.id,
			});//刷新
		},
		columns:[[{
			title:"自动编号",field:'id',width:100,checkbox:true,		},
		{	title:"设备编号",	field:'sbcode',width:100,sortable:true,halign:'center'},
		{	title:"设备名称",	field:'sbname',width:150,	sortable:true,	halign:'center'},
		{	title:"品牌",	field:'pinpai',	width:100,	sortable:true,	halign:'center'},
		{	title:"规格型号",	field:'xhtype',	width:100,	sortable:true,	halign:'center'},
		{	title:"购买日期",	field:'buydate',width:100,	sortable:true,	halign:'center'}
		]]	
	});
	
	
	
	//新增
	$('#shebei_add').dialog({
		width:840,
		title:"新增管理",
		iconCls:'icon-add',
		modal:true,
		closed:true,
		buttons:[{
			text:'提交',
			iconCls:'icon-ok',
			handler:function(){
				console.log($('#shebei_add').serialize());
				if($('#shebei_add').form('validate')){
					$.ajax({
						url:'addShebei.do',
						type:'post',
						data:$('#shebei_add').serialize(),
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
									msg:'新增设备成功',
								});
								$('#shebei_add').dialog('close').form('reset');
								$('#shebei').datagrid('reload');//刷新
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
				$('#shebei_add').dialog('close').form('clear');
			}
		}]
	});
	
	
	
	//验证
	$('input[name="sbdengji"]').validatebox({
		required:true,
		validType:'length[1]',
		missingMessage:'请输入科室名',
		invalidMessage:'科室名称在2-20位',
	});
	
	
	
	
	
	//工具栏
	shebei_tool ={
			//刷新
			reload:function(){
				$('#shebei').datagrid('reload');
			},
			//取消选择
			redo:function(){
				$('#shebei').datagrid('clearChecked');
			},
			//点击新增
			add:function(){
				$('#shebei_add').dialog('open');
//				$('input[name="keshiname"]').focus();
			},
			//删除
			remove:function(){
				var rows = $('#shebei').datagrid('getChecked');
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
								url:'deleteShebei.do',
								data:{
									ids:ids.join(','),
								},
								beforeSend:function(){
									$('#shebei').datagrid('loading');
								},
								success:function(data){
									if(data){
										$('#shebei').datagrid('loaded');
										$('#shebei').datagrid('load');
										$('#shebei').datagrid('unselectAll');
										$.messager.show({
											title:'提示',
											msg:data+'个设备被删除成功！',
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
				var rows = $('#shebei').datagrid('getSelections');
				if(rows.length>1){
					$.messager.alert('操作提示！','编辑记录只能选择一条记录！','warning');
				}else if(rows.length==1){
					$.ajax({
						url:'getShebei.do',
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
								$('#shebei_edit').form('load',{
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