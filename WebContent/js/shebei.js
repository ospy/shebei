$(function(){
	
	searchsb = {
			search:function(){
//				alert($("#sbleixing_search").combobox('getValues'));
//				alert($("#bjiliang_search").is(":checked")?'on':'');
				$('#shebei').datagrid('load',{
					sb_search:$.trim($('input[name="sb_search"]').val()),
					sbdengji_search:$.trim($('input[name="sbdengji_search"]').val()),
					sykeshi_search:$.trim($("#sykeshi_search").combobox('getValues')),
					sbleixing_search:$.trim($("#sbleixing_search").combobox('getValues')),
//					sykeshi_search:$.trim($('input[name="sykeshi_search"]').val()),
					date_from:$.trim($('input[name="date_from"]').val()),
					date_to:$.trim($('input[name="date_to"]').val()),
					bjiliang_search:$("#bjiliang_search").is(":checked")?'on':'',
					shangbaoyb_search:$.trim($('input[name="shangbaoyb_search"]:checked').val()),
					shangbaowjw_search:$.trim($('input[name="shangbaowjw_search"]:checked').val()),
				});
			},
			qingkong:function(){
//				$('#chaxuntiaojian').form('reset');
				$('#chaxuntiaojian').form('clear');
////				alert($('#date_from').textbox('getValue'));
//				$("#sykeshi_search").removeAttr('selected');//清空下拉框
////				$("#sykeshi_search").empty();//清空下拉框
//				$("#bjiliang_search").val('');//不打勾
//				$("#shangbaoyb_search").val('');//不打勾
////				$("#shangbaowjw_search").attr("checked",'');//不打勾
//				$("#shangbaowjw_search").val('');//不打勾
//				$('#date_from').combo('reset'); 
//				$('#date_to').combo('reset'); 
				$('#sykeshi_search').combobox('reload');
				$('#shebei').datagrid('load',{});
			},
		};
	
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
		pageSize:20,
		pageList:[10,20,30],
		pageNumber:1,
		sortName:'id',
		sortOrder:'desc',
		toolbar:'#shebei_tb',
		onDblClickRow:function(index,row){
			$('#weixiu').datagrid('reload',{
				id:row.id,
			});//刷新维修数据
			$('#zhuanyi').datagrid('reload',{
				id:row.id,
			});//刷新转移数据
		},
		columns:[[{
			title:"自动编号",field:'id',width:100,checkbox:true,		},
		{	title:"设备编号",	field:'sbcode',width:50,sortable:true,halign:'center'},
		{	title:"设备名称",	field:'sbname',width:150,	sortable:true,	halign:'center'},
		{	title:"使用科室",	field:'keshiname',width:50,	sortable:true,	halign:'center'},
		{	title:"存放地点",	field:'didian',width:50,	sortable:true,	halign:'center'},
		{	title:"品牌",	field:'pinpai',	width:50,	sortable:true,	halign:'center'},
		{	title:"规格型号",	field:'xhtype',	width:100,	sortable:true,	halign:'center'},
		{	title:"出厂编号",	field:'ccbianhao',	width:100,	sortable:true,	halign:'center'},
		{	title:"生产日期",	field:'chuchangdate',width:100,	sortable:true,	halign:'center'},
		{	title:"购买日期",	field:'buydate',width:100,	sortable:true,	halign:'center'},
		{	title:"单价",	field:'danjia',width:50,	sortable:true,	halign:'center'},
		{	title:"计量",	field:'bjiliang',width:50,	sortable:true,	halign:'center'},
		{	title:"医保",	field:'shangbaoyb',width:50,	sortable:true,	halign:'center'},
		{	title:"卫计委",	field:'shangbaowjw',width:50,	sortable:true,	halign:'center'},
		]]	
	});
	
	
	//添加设备时 医保大类下拉列表
	$('#groupdl').combobox({
		url:'getYbfenlei.do?pid=0',
		valueField:'id',
		textField:'flname',
		editable:false,
		required:true,
		onSelect: function(rec){    
            var url = 'getYbfenlei.do?pid='+rec.id;    
            $('#groupxl').combobox('reload', url);
        }
	});
	

	//添加设备时 医保小类下拉列表
	$('#groupxl').combobox({
		url:'getYbfenlei.do',
		valueField:'id',
		textField:'flname',
		queryParams:{
			"pid":"",
		},
		editable:false,
		required:true
	});
	
	//添加设备时 科室下拉列表
	$('#sykeshi').combobox({
		url:'getkeshi.do',
		valueField:'id',
		textField:'keshiname',
		queryParams:{
			"getall":"all",
		},
		editable:false,
		required:true,
	});
	
	//检索设备时 科室下拉列表
	$('#sykeshi_search').combobox({
		url:'getkeshi.do',
		valueField:'id',
		textField:'keshiname',
		queryParams:{
			"getall":"all",
		},
		editable:false,
		multiple:true,
	});
		
	//添加设备时 厂家下拉列表
	$('#sscj').combobox({
		url:'getsccj.do',
		valueField:'id',
		textField:'cjname',
		queryParams:{
			"getall":"all",
		},
		editable:false,
		required:true,
		missingMessage:'请选择厂家',
	});
	
	//添加设备时 经销商下拉列表
	$('#jingxiaoshang').combobox({
		url:'getJingxiaoshang.do',
		valueField:'id',
		textField:'jxsname',
		queryParams:{
			"getall":"all",
		},
		editable:false,
		required:true,
		missingMessage:'请选择经销商',
	});
	
	//添加设备时 经销商下拉列表
	$('#sbdengji').combobox({		
		valueField:'label',
		textField:'value',
		data:[{label: ' 1 ',value: '1'},{label: ' 2 ',	value: '2'},{label: ' 3 ',	value: '3'}],
		editable:false,
		required:true,
		missingMessage:'请选择经设备等级',
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
				console.log($('#shebei_add').form('validate'));
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
	
	//验证 使用年限
	$('#useyears').numberbox({
		required:true,
		missingMessage:'请填写设备使用年限',
		width:150,
		min:0, 
		max:50,
	    value:5,
	});
	
	//验证 数量
	$('#shuliang').numberbox({
		required:true,
		missingMessage:'请填写设备数量',
		width:150,
		min:0,    
	    value:1,
	});
	//验证 单价
	$('#danjia').numberbox({
		required:true,
		missingMessage:'请填写设备单价',
		width:150,
		min:0,    
	    precision:2 ,
	    value:0.00,
	});
	
	//-------------修改
	
	//修改设备时 医保大类下拉列表
	$('#groupdl_edit').combobox({
		url:'getYbfenlei.do?pid=0',
		valueField:'id',
		textField:'flname',
		editable:false,
		required:true,
		onSelect: function(rec){    
            var url = 'getYbfenlei.do?pid='+rec.id;    
            $('#groupxl_edit').combobox('reload', url);    
        }
	});
	
	//修改设备时 医保小类下拉列表
	$('#groupxl_edit').combobox({
		url:'getYbfenlei.do',
		valueField:'id',
		textField:'flname',
		queryParams:{
			"pid":"",
		},
		editable:false,
		required:true
	});
	
	//修改设备时 科室下拉列表
	$('#sykeshi_edit').combobox({
		url:'getkeshi.do',
		valueField:'id',
		textField:'keshiname',
		queryParams:{
			"getall":"all",
		},
		editable:false,
		required:true,
	});
		
	//修改设备时 厂家下拉列表
	$('#sscj_edit').combobox({
		url:'getsccj.do',
		valueField:'id',
		textField:'cjname',
		queryParams:{
			"getall":"all",
		},
		editable:false,
		required:true,
		missingMessage:'请选择厂家',
	});
	
	//修改设备时 经销商下拉列表
	$('#jingxiaoshang_edit').combobox({
		url:'getJingxiaoshang.do',
		valueField:'id',
		textField:'jxsname',
		queryParams:{
			"getall":"all",
		},
		editable:false,
		required:true,
		missingMessage:'请选择经销商',
	});
	
	//修改设备时 经销商下拉列表
	$('#sbdengji_edit').combobox({		
		valueField:'label',
		textField:'value',
		data:[{label: ' 1 ',value: '1'},{label: ' 2 ',	value: '2'},{label: ' 3 ',	value: '3'}],
		editable:false,
		required:true,
		missingMessage:'请选择经设备等级',
	});
	
	
	
	
	//修改设备
	$('#shebei_edit').dialog({
		width:840,
		title:"修改管理",
		iconCls:'icon-edit',
		modal:true,
		closed:true,
		buttons:[{
			text:'提交',
			iconCls:'icon-edit',
			handler:function(){
				if($('#shebei_edit').form('validate')){
//					console.log('#shebei_edit=' +$('#shebei_edit').serialize());
					$.ajax({
						url:'updateShebei.do',
						type:'post',
						data:$('#shebei_edit').serialize(),
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
									msg:'修改设备信息成功',
								});
								$('#shebei_edit').dialog('close').form('reset');
								$('#shebei').datagrid('reload');//刷新
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
				$('#shebei_edit').dialog('close').form('reset');
			}
		}]
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
									shebeiid:obj[0].id,
									sbcode_edit : obj[0].sbcode,
									sbname_edit : obj[0].sbname,
									groupdl_edit : obj[0].groupdl,
									groupxl_edit : obj[0].groupxl,
									sykeshi_edit : obj[0].sykeshi,
									xhtype_edit : obj[0].xhtype,
									pinpai_edit : obj[0].pinpai,
									chandi_edit : obj[0].chandi,
									peizhi_edit : obj[0].peizhi,
									jishuguige_edit : obj[0].jishuguige,
									buydate_edit : obj[0].buydate,
									useyears_edit : obj[0].useyears,
									begindate_edit : obj[0].begindate,
									sbleixing_edit : obj[0].sbleixing,
									ccbianhao_edit : obj[0].ccbianhao,
									bjiliang_edit : obj[0].bjiliang,
									chuchangdate_edit : obj[0].chuchangdate,
									sscj_edit : obj[0].sscj,
									shuliang_edit : obj[0].shuliang,
									danwei_edit : obj[0].danwei,
									danjia_edit : obj[0].danjia,
									beizhu_edit : obj[0].beizhu,
									syzhuangtai_edit : obj[0].syzhuangtai,
									didian_edit : obj[0].didian,
									glfenlei_edit : obj[0].glfenlei,
									glfenleibm_edit : obj[0].glfenleibm,
									glfenleimc_edit : obj[0].glfenleimc,
									jingxiaoshang_edit : obj[0].jingxiaoshang,
									sbdengji_edit : obj[0].sbdengji,
									shangbaoyb_edit : obj[0].shangbaoyb,
									shangbaowjw_edit : obj[0].shangbaowjw,
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