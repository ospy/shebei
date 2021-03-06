<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">	
<!-- 上部 -->
	<div data-options="region:'center',border:false " >
		<table id="shebei"></table>
		<div id="shebei_tb" style="padding: 5px">
			<div style="margin-bottom: 5px">
				<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="shebei_tool.add();">添加</a> 
				<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"	onclick="shebei_tool.edit();">修改</a> 
				<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="shebei_tool.remove();">删除</a> 
				<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="shebei_tool.reload();">刷新</a> 
				<a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="shebei_tool.redo();">取消选择</a>
			</div>
			<div style="padding: 0 0 0 7px;color: #333">
			查询账户：<input type="text" name="user" class="textbox" style="width: 110px">
			创建时间从：<input type="text" name="date_from" class="easyui-datebox" style="width: 110px">
			到：<input type="text" name="date_to" class="easyui-datebox"  style="width: 110px">
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="obj.search();">查询</a>
			</div>
		</div>
		
		<!-- 设备添加-->	
		<div id="shebei_add">
		<input class="easyui-datebox">
		<form  style="margin: 0; padding: 5px 0 0 25px; color: #333;">
		<p>科室名称：<input type="text" name="shebeiname" class="textbox" style="width:200px"></p>
		<p>科室负责人：<input type="text" name="date_too" class="easyui-datebox"  style="width: 110px"></p>
		<p>科室楼层：<input type="text" name="shebeiposition" class="textbox" style="width:200px"></p>
		</form>
		</div>
		<!-- 设备添加  end-->
		
		<!-- 设备编辑-->	
		<form id="shebei_edit" style="margin: 0; padding: 5px 0 0 25px; color: #333;">
		<input type="hidden" name="shebeiid" class="textbox" style="width:200px">
		<p>科室名称：<input type="text" name="shebeiname_edit" class="textbox" style="width:200px"></p>
		<p>科室负责人：<input type="text" name="shebeimanager_edit" class="textbox" style="width:200px"></p>
		<p>科室楼层：<input type="text" name="shebeiposition_edit" class="textbox" style="width:200px"></p>
		</form>
		<!-- 设备编辑  end-->	
	</div>
<!-- 上部  end-->	
<!-- 下部-->	
	<div id="p" data-options="region:'south',border:false" title="更多信息" style="height: 250px;">
		<div class="easyui-tabs" data-options="tabWidth:112,fit:true,border:false">
			<div title="维修管理" style="padding: 1px">
				<table id="weixiu"></table>
				<div id="weixiu_tb">
					<div style="margin-bottom: 2px">
						<a href="#" class="easyui-linkbutton" iconCls="icon-add2" plain="true" onclick="weixiu_tool.add();">添加</a> 
						<a href="#" class="easyui-linkbutton" iconCls="icon-edit1" plain="true"	onclick="weixiu_tool.edit();">修改</a> 
						<a href="#" class="easyui-linkbutton" iconCls="icon-del" plain="true" onclick="weixiu_tool.remove();">删除</a> 
						<a href="#" class="easyui-linkbutton" iconCls="icon-undo1" plain="true" onclick="weixiu_tool.redo();">取消选择</a>
					</div>
				</div>
				<!-- 维修添加-->	
				<form id="weixiu_add">
				  <input class="easyui-datebox"></input>
				</form>
				
				
				<!-- 维修添加  end-->	
				
				<!-- 维修编辑-->	
				
				<!-- 维修编辑  end-->	
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
</div>
<!-- 下部  end-->	
</div>

			


<script type="text/javascript" src="./js/shebei.js"></script>
