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
		sortName:'bxdate',
		sortOrder:'desc',
		toolbar:'#weixiu_tb',

		columns:[[{
			title:"自动编号",	field:'id',	width:20,checkbox:true,},
		{	title:"设备编号",	field:'code',width:40,sortable:true,halign:'center'},
		{	title:"设备名称",	field:'name',width:70,	sortable:true,halign:'center'},
		{	title:"维修科室",	field:'keshiname',width:40,sortable:true,halign:'center'},
		{	title:"维修状态",	field:'wxzhuangtai',width:30,sortable:true,halign:'center'},
		{	title:"维修类型",	field:'wxleixing',width:30,sortable:true,halign:'center'},
		{	title:"维修原因",	field:'wxyuanyin',width:100,sortable:true,halign:'center'},
		{	title:"维修内容",	field:'wxneirong',width:150,sortable:true,halign:'center'},
		{	title:"保修人",	field:'bxren',width:30,sortable:true,halign:'center'},
		{	title:"报修时间",	field:'bxdate',width:50,sortable:true,halign:'center'},
		{	title:"维修人",	field:'wxren',width:30,sortable:true,halign:'center'},
		{	title:"维修时间",	field:'wxdate',	width:50,	sortable:true,	halign:'center'},
		{	title:"维修金额",	field:'wxjine',width:40,sortable:true,	halign:'center'	}
		]]		
	});
	
	//添加维修时 科室下拉列表
	$('#wxkeshi').combobox({
		url:'getkeshi.do',
		valueField:'id',
		textField:'keshiname',
		queryParams:{
			"getall":"all",
		},
		editable:false,
		required:true,
	});
	
	//修改维修时 科室下拉列表
	$('#wxkeshi_edit').combobox({
		url:'getkeshi.do',
		valueField:'id',
		textField:'keshiname',
		queryParams:{
			"getall":"all",
		},
		editable:false,
		required:true,
	});
	
	
	//新增
	$('#weixiu_add').dialog({
		width:650,
		title:"新增管理",
		iconCls:'icon-add',
		modal:true,
		closed:true,
		buttons:[{
			text:'提交',
			iconCls:'icon-ok',
			handler:function(){
//				console.log($('#weixiu_add').serialize());
				var rows = $('#shebei').datagrid('getSelected');
//				console.log(rows.id+"|"+rows.name);
//				$('#sbid').val(rows.id);
				if($('#weixiu_add').form('validate')){
					$.ajax({
						url:'addWeixiu.do',
						type:'post',
						data:$('#weixiu_add').serialize()+"&sbid="+rows.id,
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
									msg:'新增维修成功',
								});
								$('#weixiu_add').dialog('close').form('reset');
								$('#weixiu').datagrid('reload');//刷新
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
				$('#weixiu_add').dialog('close').form('reset');
			}
		}]
	});
	

	
	//修改维修
	$('#weixiu_edit').dialog({
		width:650,
		title:"修改管理",
		iconCls:'icon-edit',
		modal:true,
		closed:true,
		buttons:[{
			text:'提交',
			iconCls:'icon-edit',
			handler:function(){
				if($('#weixiu_edit').form('validate')){
//					console.log('#weixiu_edit=' +$('#weixiu_edit').serialize());
					$.ajax({
						url:'updateWeixiu.do',
						type:'post',
						data:$('#weixiu_edit').serialize(),
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
									msg:'修改维修成功',
								});
								$('#weixiu_edit').dialog('close').form('reset');
								$('#weixiu').datagrid('reload');//刷新
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
				$('#weixiu_edit').dialog('close').form('reset');
			}
		}]
	});
	
	
	
	//验证
	$('input[name="bxren"]').validatebox({
		required:true,
		missingMessage:'请填写保修人',
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
								url:'deleteWeixiu.do',
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
											msg:data+'个维修记录被删除成功！',
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
						url:'getweixiu.do',
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
									weixiuid:obj[0].id,
									wxzhuangtai_edit:obj[0].wxzhuangtai,
									wxleixing_edit:obj[0].wxleixing,
									wxkeshi_edit:obj[0].wxkeshi,
									wxjine_edit:obj[0].wxjine,
									wxyuanyin_edit:obj[0].wxyuanyin,
									bxren_edit:obj[0].bxren,
									bxdate_edit:obj[0].bxdate,
									wxneirong_edit:obj[0].wxneirong,
									wxren_edit:obj[0].wxren,
									wxdate_edit:obj[0].wxdate,
									yanshoujilu_edit:obj[0].yanshoujilu,
									ysren_edit:obj[0].ysren,
									ysdate_edit:obj[0].ysdate,
									beizhu_edit:obj[0].beizhu,
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