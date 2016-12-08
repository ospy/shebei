<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="easyui-layout" data-options="fit:true">

	<div id="p" data-options="region:'south',border:false" title="详细信息" style="height: 250px;">
		<div class="easyui-tabs" data-options="tabWidth:112,fit:true,border:false">
			<div title="维修管理" style="padding: 10px">
				<p>Home Content.</p>
			</div>
			<div title="文档管理" style="padding: 10px">
				<p>Maps Content.</p>
			</div>
			<div title="借出还入" style="padding: 10px">
				<p>Journal Content.</p>
			</div>
			<div title="验收管理" style="padding: 10px">
				<p>History Content.</p>
			</div>
			<div title="附属设备" style="padding: 10px">
				<p>References Content.</p>
			</div>
			<div title="转移管理" style="padding: 10px">
				<p>Contact Content.</p>
			</div>
			<div title="图片信息" style="padding: 10px">
				<p>Contact Content.</p>
			</div>
		</div>
	</div>

	<div data-options="region:'center',border:false " title="设备列表">
		<table id="shebei">
		</table>
		<div id="shebei_tb" style="padding: 5px">
			<div style="margin-bottom: 5px">
				<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="shebei_tool.add();">添加</a> 
				<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"	onclick="shebei_tool.edit();">修改</a> 
				<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="shebei_tool.remove();">删除</a> 
				<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="shebei_tool.reload();">刷新</a> 
				<a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="shebei_tool.redo();">取消选择</a>
			</div>
		</div>
	</div>

</div>
<script type="text/javascript" src="./js/shebei.js"></script>