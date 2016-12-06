/**
 * 
 */

$(function(){
	
	obj = {
		search:function(){
			alert('');
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
});