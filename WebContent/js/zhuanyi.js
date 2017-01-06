$(function(){
	$('#zhuanyi').datagrid({
		url:'zhuanyi_data.do',
		singleSelect:true,
		selectOnCheck:false,
		checkOnSelect:false,
		fit:true,
		fitColumns:true,
		rownumbers:true,
		border:false,
		striped:true,
		sortName:'diaobodate',
		sortOrder:'desc',
		toolbar:'#zhuanyi_tb',

		columns:[[{
			title:"自动编号",	field:'id',	width:20,checkbox:true,},
		{	title:"调拨日期",	field:'diaobodate',width:50,sortable:true,halign:'center'},
		{	title:"设备编号",	field:'sbcode',width:40,sortable:true,halign:'center'},
		{	title:"设备名称",	field:'sbname',width:70,	sortable:true,halign:'center'},
		{	title:"原科室",	field:'oldkeshiname',width:40,sortable:true,halign:'center'},
		{	title:"原存放地",	field:'olddidian',width:40,sortable:true,halign:'center'},
		{	title:"新科室",	field:'keshiname',width:40,sortable:true,halign:'center'},
		{	title:"新存放地",	field:'newdidian',width:40,sortable:true,halign:'center'},
		{	title:"批准人",	field:'pizhunren',width:30,sortable:true,halign:'center'},
		{	title:"备注",	field:'beizhu',width:80,sortable:true,halign:'center'},
		]]		
	});
	
	//添加转移时 原科室下拉列表
	$('#oldkeshi').combobox({
		url:'getkeshi.do',
		valueField:'id',
		textField:'keshiname',
		queryParams:{
			"getall":"all",
		},
		editable:false,
		required:true,
		disabled:true,
		width:150,
	});
	
	//添加转移时 原科室下拉列表   隐藏
//	$('#hiddenoldkeshi').combobox({
//		url:'getkeshi.do',
//		valueField:'id',
//		textField:'keshiname',
//		queryParams:{
//			"getall":"all",
//		},
//		editable:false,
//		width:150,
//	});
	
	//添加转移时 新科室下拉列表
	$('#newkeshi').combobox({
		url:'getkeshi.do',
		valueField:'id',
		textField:'keshiname',
		queryParams:{
			"getall":"all",
		},
		editable:false,
		required:true,
		width:150,
	});
	
	//修改转移时 原科室下拉列表
	$('#oldkeshi_edit').combobox({
		url:'getkeshi.do',
		valueField:'id',
		textField:'keshiname',
		queryParams:{
			"getall":"all",
		},
//		editable:false,
		disabled:true,
		required:true,
		width:150,
	});
	//修改转移时 新科室下拉列表
	$('#newkeshi_edit').combobox({
		url:'getkeshi.do',
		valueField:'id',
		textField:'keshiname',
		queryParams:{
			"getall":"all",
		},
		editable:false,
		required:true,
		width:150,
	});
	
	
	//新增
	$('#zhuanyi_add').dialog({
		width:650,
		title:"新增管理",
		iconCls:'icon-add',
		modal:true,
		closed:true,
		buttons:[{
			text:'提交',
			iconCls:'icon-ok',
			handler:function(){
//				console.log($('#zhuanyi_add').serialize());
				var rows = $('#shebei').datagrid('getSelected');
//				console.log(rows.id+"|"+rows.name);
//				$('#sbid').val(rows.id);
				if($('#zhuanyi_add').form('validate')){
					$.ajax({
						url:'addZhuanyi.do',
						type:'post',
						data:$('#zhuanyi_add').serialize()+"&sbid="+rows.id,
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
									msg:'新增转移成功',
								});
								$('#zhuanyi_add').dialog('close').form('reset');
								$('#zhuanyi').datagrid('reload');//刷新
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
				$('#zhuanyi_add').dialog('close').form('reset');
			}
		}]
	});
	

	
	//修改转移
	$('#zhuanyi_edit').dialog({
		width:650,
		title:"修改管理",
		iconCls:'icon-edit',
		modal:true,
		closed:true,
		buttons:[{
			text:'提交',
			iconCls:'icon-edit',
			handler:function(){
				if($('#zhuanyi_edit').form('validate')){
//					console.log('#zhuanyi_edit=' +$('#zhuanyi_edit').serialize());
					$.ajax({
						url:'updatezhuanyi.do',
						type:'post',
						data:$('#zhuanyi_edit').serialize(),
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
									msg:'修改转移记录成功',
								});
								$('#zhuanyi_edit').dialog('close').form('reset');
								$('#zhuanyi').datagrid('reload');//刷新
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
				$('#zhuanyi_edit').dialog('close').form('reset');
			}
		}]
	});
	
	
	
	//验证

	
	
	
	
	//工具栏
	zhuanyi_tool ={

			//取消选择
			redo:function(){
				$('#zhuanyi').datagrid('clearChecked');
			},
			//点击新增
			add:function(){
				var rows = $('#shebei').datagrid('getSelected');
				if(rows){
					$.ajax({
						url:'getShebei.do',
						type:'post',
						data:{
							id:rows.id,
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
								console.log(obj[0].didian);
								$('#zhuanyi_add').form('load',{
									oldkeshi:obj[0].sykeshi,
									olddidian:obj[0].didian,
									hiddenoldkeshi:obj[0].sykeshi,
									hiddenolddidian:obj[0].didian,
								}).dialog('open');
							}else{
								$.messager.alert('获取失败！','未知错误！','warning');
							}
						},
					});
				}else{
					$.messager.alert('提示','请先选择要添加转移记录的设备！','info');
				}
			},
			//删除
			remove:function(){
				var rows = $('#zhuanyi').datagrid('getChecked');
				if(rows.length>0){
					$.messager.confirm('确定操作',"您真的要删除所选中的记录吗？",function(flag){
						if(flag){
							var ids=[];
							for(var i=0;i<rows.length;i++){
								ids.push(rows[i].id);
							}
							$.ajax({
								type:'POST',
								url:'deletezhuanyi.do',
								data:{
									ids:ids.join(','),
								},
								beforeSend:function(){
									$('#zhuanyi').datagrid('loading');
								},
								success:function(data){
									if(data){
										$('#zhuanyi').datagrid('loaded');
										$('#zhuanyi').datagrid('load');
										$('#zhuanyi').datagrid('unselectAll');
										$.messager.show({
											title:'提示',
											msg:data+'个转移记录被删除成功！',
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
				var rows = $('#zhuanyi').datagrid('getSelections');
				if(rows.length>1){
					$.messager.alert('操作提示！','编辑记录只能选择一条记录！','warning');
				}else if(rows.length==1){
					$.ajax({
						url:'getzhuanyi.do',
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
								$('#zhuanyi_edit').form('load',{
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