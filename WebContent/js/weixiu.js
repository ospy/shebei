$(function(){
	$('#weixiu').datagrid({
		url:'weixiu_data.do',
		singleSelect:true,
		selectOnCheck:false,
		checkOnSelect:false,
		fit:true,
		fitColumns:true,
		rownumbers:true,
		border:false,
		striped:true,
//		pagination:true,
//		pageSize:5,
//		pageList:[5,10,15],
//		pageNumber:1,
		sortName:'bgdate',
		sortOrder:'desc',
		toolbar:'#weixiu_tb',

		columns:[[{
			title:"自动编号",	field:'id',	width:100,checkbox:true,},
		{	title:"设备编号",	field:'code',width:100,sortable:true,halign:'center'},
		{	title:"设备名称",	field:'name',width:150,	sortable:true,halign:'center'},
		{	title:"报修时间",	field:'bgdate',width:100,sortable:true,halign:'center'},
		{	title:"维修时间",	field:'wxdate',	width:100,	sortable:true,	halign:'center'},
		{	title:"维修人",	field:'wxren',width:100,sortable:true,	halign:'center'	}
		]]		
	});
	
	
	//新增
	$('#weixiu_add').dialog({
		width:650,
		title:"新增管理",
		iconCls:'icon-add',
		modal:true,
		closed:true,
		onBeforeOpen:function(){

		},
		buttons:[{
			text:'提交',
			iconCls:'icon-ok',
			handler:function(){
				
			}
		},{
			text:'取消',
			iconCls:'icon-cancel',
			handler:function(){
				$('#weixiu_add').dialog('close').form('reset');
			}
		}]
	});
	
	
	
	//工具栏
	weixiu_tool ={

			//取消选择
			redo:function(){
				$('#weixiu').datagrid('clearChecked');
			},
			//点击新增
			add:function(){
				var rows = $('#shebei').datagrid('getSelected');
				if(rows){
					$('#weixiu_add').dialog('open');
				}else{
					$.messager.alert('提示','请先选择要添加维修记录的设备！','info');
				}
			},
			//删除
			remove:function(){
				var rows = $('#weixiu').datagrid('getChecked');
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
									$('#weixiu').datagrid('loading');
								},
								success:function(data){
									if(data){
										$('#weixiu').datagrid('loaded');
										$('#weixiu').datagrid('load');
										$('#weixiu').datagrid('unselectAll');
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
				var rows = $('#weixiu').datagrid('getSelections');
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
								$('#weixiu_edit').form('load',{
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