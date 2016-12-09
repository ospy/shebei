/**
 * 
 */

$(function(){
	//新增
	$('#test_add2').dialog({
		width:650,
		title:"新增管理",
		iconCls:'icon-add',
		modal:true,
		closed:true,
	});
	
	shebei_tool2 ={
			
			//点击新增
			add:function(){
				$('#test_add2').dialog('open');
			}
	}
});