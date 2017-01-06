<%String username = (String)session.getAttribute("username");
if(username ==null || username.equals("")){
	 response.setHeader("Refresh","0;url=login.jsp");
	 return;
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="css/admin.css">
<link rel="stylesheet" href="css/viewer.css" type="text/css"> 

<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/admin.js"></script>
</head>
<body class="easyui-layout">

	<div data-options="region:'north',border:false" style="height: 60px;  padding: 1px" class="north_el">
		<div class="logo">后台管理</div>
		<div class="logout">您好：<%=session.getAttribute("username") %> | <a href="Logout.do">退出</a></div>
	</div>
	
	<div data-options="region:'west',split:true,title:'导航',iconCls:'icon-icon146'" style="width: 150px; padding: 1px;">
		<ul id="nav"></ul>
	</div>

	<div data-options="region:'south',border:true" style="height: 20px; padding: 2px; text-align: center;">&copy;Zhaomj 2016-2020</div>

	<div data-options="region:'center'">
		<div id="tabs">
			<div title="起始页" iconCls="icon-home" style="padding: 0 1px;display: block;">
				
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
			<div style="padding: 0 0 0 7px;color: #333"><form id="chaxuntiaojian">
			设备编号或名称：<input type="text" name="sb_search" class="textbox" style="width: 110px">
			使用科室：<input id="sykeshi_search" name="sykeshi_search" style="width: 110px">
			购买时间从：<input type="text" name="date_from" class="easyui-datebox" style="width: 110px">
			到：<input type="text" name="date_to" class="easyui-datebox"  style="width: 110px">
			&nbsp;&nbsp;计量设备：<input type="checkbox" name="bjiliang_search" id="bjiliang_search">
			设备类型：<select name="sbleixing_search" id="sbleixing_search" class="easyui-combobox">
				          <option value="专用设备">专用设备</option>
				          <option value="电子设备">电子设备</option>
				        </select>&nbsp;&nbsp;
			上报医保：<input type="checkbox" name="shangbaoyb_search" id="shangbaoyb_search">
			卫计委：<input type="checkbox" name="shangbaowjw_search" id="shangbaowjw_search">&nbsp;&nbsp;
			设备等级：<input type="text" name="sbdengji_search" class="textbox" style="width: 50px">
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="searchsb.search();">查询</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="searchsb.qingkong();">清空条件</a>
			</form></div>
		</div>
		
		<!-- 设备添加-->	

			<form id="shebei_add" style="margin: 0; padding: 5px 0 0 25px; color: #333;">
				<table width="800" height="326" >
				    <tbody>
				      <tr>
				        <td width="60">设备类型</td>
				        <td width="200"><select name="sbleixing" id="sbleixing" class="easyui-combobox">
				          <option value="专用设备">专用设备</option>
				          <option value="电子设备">电子设备</option>
				        </select></td>
				        <td width="60">医保大类</td>
				        <td width="200"><input name="groupdl" id="groupdl">
				        </td>
                        <td width="60">医保小类</td>
                        <td width="200"><input name="groupxl" id="groupxl">
                        </td>
				      </tr>
				      <tr>
				        <td>设备编号</td>
				        <td><input class="easyui-textbox" type="text" name="sbcode" id="sbcode"></td>
				        <td>设备名称</td>
				        <td><input class="easyui-textbox" type="text" name="sbname" id="sbname"></td>
                        <td>出厂编号</td>
                        <td><input class="easyui-textbox" type="text" name="ccbianhao" id="ccbianhao"></td>
				      </tr>
				      <tr>
				        <td>设备品牌</td>
				        <td><input class="easyui-textbox" type="text" name="pinpai" id="pinpai"></td>
                        <td>设备型号</td>
                        <td><input class="easyui-textbox" type="text" name="xhtype" id="xhtype"></td>
                        <td>计量设备</td>
                        <td><input type="checkbox" name="bjiliang" id="bjiliang">
                        </td>
				      </tr>
				      <tr>
				        <td>出厂日期</td>
				        <td><input type="text" name="chuchangdate" id="chuchangdate" class="easyui-datebox"></td>
				        <td>购买日期</td>
				        <td><input name="buydate" id="buydate" class="easyui-datebox" ></td>
                        <td>启用时间</td>
                        <td><input name="begindate" id="begindate" class="easyui-datebox" ></td>
				      </tr>
				      <tr>
				        <td>生产厂家</td>
				        <td><input name="sscj" id="sscj"></td>
                        <td>产地</td>
                        <td><input name="chandi" id="chandi" class="easyui-textbox" ></td>
                        <td>使用年限</td>
                        <td><input name="useyears" id="useyears" type="text" ></td>
				      </tr>
				      <tr>
				        <td>数量</td>
				        <td><input type="text" name="shuliang" id="shuliang"></td>
				        <td>单位</td>
				        <td><input name="danwei" id="danwei" class="easyui-textbox" ></td>
                        <td>单价</td>
                        <td><input name="danjia" id="danjia" type="text"></td>
				      </tr>
				      <tr>
				        <td>使用部门</td>
				        <td><input name="sykeshi" id="sykeshi"></td>
                        <td>使用状态</td>
                        <td><input name="syzhuangtai" id="syzhuangtai" class="easyui-textbox" ></td>
                        <td>存放地点</td>
                        <td><input name="didian" id="didian" class="easyui-textbox" ></td>
				      </tr>
				      <tr>
				        <td>管理分类</td>
				        <td><input type="text" name="glfenlei" id="glfenlei" class="easyui-textbox"></td>
				        <td>分类编码</td>
				        <td><input  name="glfenleibm" id="glfenleibm" class="easyui-textbox" ></td>
                        <td>分类名称</td>
                        <td><input name="glfenleimc" id="glfenleimc" class="easyui-textbox" ></td>
				      </tr>
                      <tr>
				        <td>经销商</td>
				        <td><input type="text" name="jingxiaoshang" id="jingxiaoshang"></td>
				        <td>设备等级</td>
				        <td><input name="sbdengji" id="sbdengji"></td>
                        <td>医保上报</td>
                        <td><input type="checkbox" name="shangbaoyb" id="shangbaoyb">                         
                           &nbsp;&nbsp;卫计委上报
                           <input type="checkbox" name="shangbaowjw" id="shangbaowjw"></td>
				      </tr>
				      <tr>
				        <td height="32">技术规格</td>
				        <td colspan="5"><input name="jishuguige" id="jishuguige" class="easyui-textbox" data-options="multiline:true" style="height:30px;width:600px"></td>
				      </tr>
                      <tr>
				        <td height="32">详细配置</td>
				        <td colspan="5"><input name="peizhi" id="peizhi" class="easyui-textbox" data-options="multiline:true" style="height:30px;width:600px"></td>
				      </tr>
                      <tr>
				        <td height="32">备        注</td>
				        <td colspan="5"><input name="beizhu" id="beizhu" class="easyui-textbox" data-options="multiline:true" style="height:30px;width:600px"></td>
				      </tr>
				    </tbody>
				  </table>
			</form>

		<!-- 设备添加  end-->
		
		<!-- 设备编辑-->	
		<form id="shebei_edit" style="margin: 0; padding: 5px 0 0 25px; color: #333;">
		<input type="hidden" name="shebeiid" class="textbox" style="width:200px">
		<table width="800" height="326" >
				    <tbody>
				      <tr>
				        <td width="60">设备类型</td>
				        <td width="200"><select name="sbleixing_edit" id="sbleixing_edit" class="easyui-combobox">
				          <option value="专用设备">专用设备</option>
				          <option value="电子设备">电子设备</option>
				        </select></td>
				        <td width="60">医保大类</td>
				        <td width="200"><input name="groupdl_edit" id="groupdl_edit">
				        </td>
                        <td width="60">医保小类</td>
                        <td width="200"><input name="groupxl_edit" id="groupxl_edit">
                        </td>
				      </tr>
				      <tr>
				        <td>设备编号</td>
				        <td><input class="easyui-textbox" type="text" name="sbcode_edit" id="sbcode_edit"></td>
				        <td>设备名称</td>
				        <td><input class="easyui-textbox" type="text" name="sbname_edit" id="sbname_edit"></td>
                        <td>出厂编号</td>
                        <td><input class="easyui-textbox" type="text" name="ccbianhao_edit" id="ccbianhao_edit"></td>
				      </tr>
				      <tr>
				        <td>设备品牌</td>
				        <td><input class="easyui-textbox" type="text" name="pinpai_edit" id="pinpai_edit"></td>
                        <td>设备型号</td>
                        <td><input class="easyui-textbox" type="text" name="xhtype_edit" id="xhtype_edit"></td>
                        <td>计量设备</td>
                        <td><input type="checkbox" name="bjiliang_edit" id="bjiliang_edit">
                        </td>
				      </tr>
				      <tr>
				        <td>出厂日期</td>
				        <td><input type="text" name="chuchangdate_edit" id="chuchangdate_edit" class="easyui-datebox"></td>
				        <td>购买日期</td>
				        <td><input name="buydate_edit" id="buydate_edit" class="easyui-datebox" ></td>
                        <td>启用时间</td>
                        <td><input name="begindate_edit" id="begindate_edit" class="easyui-datebox" ></td>
				      </tr>
				      <tr>
				        <td>生产厂家</td>
				        <td><input name="sscj_edit" id="sscj_edit"></td>
                        <td>产地</td>
                        <td><input name="chandi_edit" id="chandi_edit" class="easyui-textbox" ></td>
                        <td>使用年限</td>
                        <td><input name="useyears_edit" id="useyears_edit" type="text" ></td>
				      </tr>
				      <tr>
				        <td>数量</td>
				        <td><input type="text" name="shuliang_edit" id="shuliang_edit"></td>
				        <td>单位</td>
				        <td><input name="danwei_edit" id="danwei_edit" class="easyui-textbox" ></td>
                        <td>单价</td>
                        <td><input name="danjia_edit" id="danjia_edit" type="text"></td>
				      </tr>
				      <tr>
				        <td>使用部门</td>
				        <td><input name="sykeshi_edit" id="sykeshi_edit"></td>
                        <td>使用状态</td>
                        <td><input name="syzhuangtai_edit" id="syzhuangtai_edit" class="easyui-textbox" ></td>
                        <td>存放地点</td>
                        <td><input name="didian_edit" id="didian_edit" class="easyui-textbox" ></td>
				      </tr>
				      <tr>
				        <td>管理分类</td>
				        <td><input type="text" name="glfenlei_edit" id="glfenlei_edit" class="easyui-textbox"></td>
				        <td>分类编码</td>
				        <td><input  name="glfenleibm_edit" id="glfenleibm_edit" class="easyui-textbox" ></td>
                        <td>分类名称</td>
                        <td><input name="glfenleimc_edit" id="glfenleimc_edit" class="easyui-textbox" ></td>
				      </tr>
                      <tr>
				        <td>经销商</td>
				        <td><input type="text" name="jingxiaoshang_edit" id="jingxiaoshang_edit"></td>
				        <td>设备等级</td>
				        <td><input name="sbdengji_edit" id="sbdengji_edit"></td>
                        <td>医保上报</td>
                        <td><input type="checkbox" name="shangbaoyb_edit" id="shangbaoyb_edit">                         
                           &nbsp;&nbsp;卫计委上报
                           <input type="checkbox" name="shangbaowjw_edit" id="shangbaowjw_edit"></td>
				      </tr>
				      <tr>
				        <td height="32">技术规格</td>
				        <td colspan="5"><input name="jishuguige_edit" id="jishuguige_edit" class="easyui-textbox" data-options="multiline:true" style="height:30px;width:600px"></td>
				      </tr>
                      <tr>
				        <td height="32">详细配置</td>
				        <td colspan="5"><input name="peizhi_edit" id="peizhi_edit" class="easyui-textbox" data-options="multiline:true" style="height:30px;width:600px"></td>
				      </tr>
                      <tr>
				        <td height="32">备        注</td>
				        <td colspan="5"><input name="beizhu_edit" id="beizhu_edit" class="easyui-textbox" data-options="multiline:true" style="height:30px;width:600px"></td>
				      </tr>
				    </tbody>
				  </table>
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
				
				<!-- 维修添加-->	
				<form id="weixiu_add" style="margin: 0; padding: 5px 0 0 25px; color: #333;">
				  <table width="590" height="350" >
				    <tbody>
				      <tr>
				        <td width="95">状    态</td>
				        <td width="200"><select class="easyui-combobox" name="wxzhuangtai" style="width:150px;">
				          <option value="在修">在修</option>
				          <option value="已结束">已结束</option>
				        </select></td>
				        <td width="95">维修保养类型</td>
				        <td width="200"><select class="easyui-combobox" name="wxleixing" style="width:150px;">
				          <option value="故障维修">故障维修</option>
				          <option value="定期维修">定期维修</option>
				          <option value="保养">保养</option>
				        </select></td>
				      </tr>
				      <tr>
				        <td>维修科室</td>
				        <td><input id="wxkeshi" name="wxkeshi"></td>
				        <td>维修金额</td>
				        <td><input class="easyui-numberbox" type="text" name="wxjine" id="wxjine" data-options="min:0,precision:2"></td>
				      </tr>
				      <tr>
				        <td>维修保养原因</td>
				        <td colspan="3"><input class="easyui-textbox"  name="wxyuanyin" id="wxyuanyin" data-options="multiline:true" style="height:60px;width:500px"></td>
				      </tr>
				      <tr>
				        <td>报  修  人</td>
				        <td><input type="text" name="bxren" id="bxren" class="easyui-validatebox textbox"></td>
				        <td>检查日期</td>
				        <td><input name="bxdate" id="bxdate" class="easyui-datetimebox" editable="false" required ="required"></td>
				      </tr>
				      <tr>
				        <td>维修保养内容</td>
				        <td colspan="3"><input class="easyui-textbox"  name="wxneirong" id="wxneirong" data-options="multiline:true" style="height:60px;width:500px"></td>
				      </tr>
				      <tr>
				        <td>维  修  人</td>
				        <td><input type="text" name="wxren" id="wxren" class="easyui-textbox"></td>
				        <td>维修时间</td>
				        <td><input name="wxdate" id="wxdate" class="easyui-datetimebox" editable="false"></td>
				      </tr>
				      <tr>
				        <td>验收记录</td>
				        <td colspan="3"><input class="easyui-textbox" name="yanshoujilu" id="yanshoujilu" data-options="multiline:true" style="height:60px;width:500px"></td>
				      </tr>
				      <tr>
				        <td>验收人员</td>
				        <td><input type="text" name="ysren" id="ysren" class="easyui-textbox"></td>
				        <td>验收日期</td>
				        <td><input  name="ysdate" id="ysdate" class="easyui-datebox" editable="false"></td>
				      </tr>
				      <tr>
				        <td>备        注</td>
				        <td colspan="3"><input name="beizhu" id="beizhu" class="easyui-textbox" data-options="multiline:true" style="height:60px;width:500px"></td>
				      </tr>
				    </tbody>
				  </table>
				</form>
				<!-- 维修添加  end-->	
				
				<!-- 维修编辑-->	
				<form id="weixiu_edit" style="margin: 0; padding: 5px 0 0 25px; color: #333;">
				<input type="hidden" name="weixiuid" class="textbox" style="width:200px">
				  <table width="590" height="350" >
				    <tbody>
				      <tr>
				        <td width="95">状    态</td>
				        <td width="200"><select class="easyui-combobox" name="wxzhuangtai_edit" style="width:150px;">
				          <option value="在修">在修</option>
				          <option value="已结束">已结束</option>
				        </select></td>
				        <td width="95">维修保养类型</td>
				        <td width="200"><select class="easyui-combobox" name="wxleixing_edit" style="width:150px;">
				          <option value="故障维修">故障维修</option>
				          <option value="定期维修">定期维修</option>
				          <option value="保养">保养</option>
				        </select></td>
				      </tr>
				      <tr>
				        <td>维修科室</td>
				        <td><input id="wxkeshi_edit" name="wxkeshi_edit"></td>
				        <td>维修金额</td>
				        <td><input class="easyui-textbox" type="text" name="wxjine_edit" id="wxjine_edit"></td>
				      </tr>
				      <tr>
				        <td>维修保养原因</td>
				        <td colspan="3"><input class="easyui-textbox"  name="wxyuanyin_edit" id="wxyuanyin_edit" data-options="multiline:true" style="height:60px;width:500px"></td>
				      </tr>
				      <tr>
				        <td>报  修  人</td>
				        <td><input type="text" name="bxren_edit" id="bxren_edit" class="easyui-textbox"></td>
				        <td>检查日期</td>
				        <td><input name="bxdate_edit" id="bxdate_edit" class="easyui-datetimebox" editable="true" required ="required"></td>
				      </tr>
				      <tr>
				        <td>维修保养内容</td>
				        <td colspan="3"><input class="easyui-textbox"  name="wxneirong_edit" id="wxneirong_edit" data-options="multiline:true" style="height:60px;width:500px"></td>
				      </tr>
				      <tr>
				        <td>维  修  人</td>
				        <td><input type="text" name="wxren_edit" id="wxren_edit" class="easyui-textbox"></td>
				        <td>维修时间</td>
				        <td><input name="wxdate_edit" id="wxdate_edit" class="easyui-datetimebox" ></td>
				      </tr>
				      <tr>
				        <td>验收记录</td>
				        <td colspan="3"><input class="easyui-textbox" name="yanshoujilu_edit" id="yanshoujilu_edit" data-options="multiline:true" style="height:60px;width:500px"></td>
				      </tr>
				      <tr>
				        <td>验收人员</td>
				        <td><input type="text" name="ysren_edit" id="ysren_edit" class="easyui-textbox"></td>
				        <td>验收日期</td>
				        <td><input  name="ysdate_edit" id="ysdate_edit" class="easyui-datebox" ></td>
				      </tr>
				      <tr>
				        <td>备        注</td>
				        <td colspan="3"><input name="beizhu_edit" id="beizhu_edit" class="easyui-textbox" data-options="multiline:true" style="height:60px;width:500px"></td>
				      </tr>
				    </tbody>
				  </table>
				</form>
				<!-- 维修编辑  end-->	
				</div>
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
			<div title="转移管理" style="padding: 1px">
				<table id="zhuanyi"></table>
				<div id="zhuanyi_tb">
					<div style="margin-bottom: 2px">
						<a href="#" class="easyui-linkbutton" iconCls="icon-add2" plain="true" onclick="zhuanyi_tool.add();">添加</a> 
						<a href="#" class="easyui-linkbutton" iconCls="icon-edit1" plain="true"	onclick="zhuanyi_tool.edit();">修改</a> 
						<a href="#" class="easyui-linkbutton" iconCls="icon-del" plain="true" onclick="zhuanyi_tool.remove();">删除</a> 
						<a href="#" class="easyui-linkbutton" iconCls="icon-undo1" plain="true" onclick="zhuanyi_tool.redo();">取消选择</a>
					</div>
				</div>
				<!-- 转移添加-->	
				<form id="zhuanyi_add" style="margin: 0; padding: 5px 0 0 25px; color: #333;">
				<table width="590">
				    <tbody>
				      <tr>
				        <td width="95">调拨日期</td>
				        <td width="200"><input name="diaobodate" id="diaobodate" class="easyui-datebox" editable="false" /></td>
				        <td width="95">批准人</td>
				        <td width="200"><input type="text" name="pizhunren" id="pizhunren" class="easyui-textbox" /></td>
				      </tr>
				      <tr>
				        <td>原科室</td>
				        <td><input id="oldkeshi" name="oldkeshi"><input type="hidden" name="hiddenoldkeshi" id="hiddenoldkeshi"></td>
				        <td>原存放地</td>
				        <td><input class="easyui-textbox"  data-options="disabled:true" type="text" name="olddidian" id="olddidian">
				        <input name="hiddenolddidian" id="hiddenolddidian"  type="hidden"></td>
				      </tr>
				      <tr>
				        <td>新科室</td>
				        <td><input name="newkeshi" id="newkeshi"></td>
				        <td>新存放地</td>
				        <td><input name="newdidian" id="newdidian" class="easyui-textbox"  type="text"></td>
				      </tr>
				      <tr>
				        <td>备        注</td>
				        <td colspan="3"><input name="zybeizhu" id="zybeizhu" class="easyui-textbox" data-options="multiline:true" style="height:60px;width:450px"></td>
				      </tr>
				    </tbody>
				  </table>
				</form>
				<!-- 转移添加  end-->	
				
				<!-- 转移修改-->	
				<form id="zhuanyi_edit" style="margin: 0; padding: 5px 0 0 25px; color: #333;">
				<input type="hidden" name="zhuanyiid" class="textbox" style="width:200px">
				<table width="590">
				    <tbody>
				      <tr>
				        <td width="95">调拨日期</td>
				        <td width="200"><input name="diaobodate_edit" id="diaobodate_edit" class="easyui-datebox" editable="false" /></td>
				        <td width="95">批准人</td>
				        <td width="200"><input type="text" name="pizhunren_edit" id="pizhunren_edit" class="easyui-textbox" /></td>
				      </tr>
				      <tr>
				        <td>原科室</td>
				        <td><input id="oldkeshi_edit" name="oldkeshi_edit"></td>
				        <td>原存放地</td>
				        <td><input class="easyui-textbox" data-options="disabled:true" type="text" name="olddidian_edit" id="olddidian_edit"></td>
				      </tr>
				      <tr>
				        <td>新科室</td>
				        <td><input name="newkeshi_edit" id="newkeshi_edit"></td>
				        <td>新存放地</td>
				        <td><input name="newdidian_edit" id="newdidian_edit" class="easyui-textbox"  type="text"></td>
				      </tr>
				      <tr>
				        <td>备        注</td>
				        <td colspan="3"><input name="zybeizhu_edit" id="zybeizhu_edit" class="easyui-textbox" data-options="multiline:true" style="height:60px;width:450px"></td>
				      </tr>
				    </tbody>
				  </table>
				</form>
				<!-- 维修修改  end-->	
			</div>
			<div title="图片信息" style="padding: 1px">
				 <form id="importFileForm" method="post" enctype="multipart/form-data" >
			        <div style="text-align:center;clear:both;margin:5px;">
			        请选择文件<input type="text" id="fileImport" name="fileImport" style="width:260px;">
			            <a id="uploadFile" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="fileupload.importFileClick();">上传</a>
			            <label id="uploadInfo"/>
			        </div>
			    </form>
			    <div>
				  <ul class="images">
				    <img src="upload/1483670514135.jpg" width="130px" height="130px" alt="Picture">
				    <img src="upload/1482370620251.jpg" width="130px" height="130px"  alt="Picture 2">
				    <img src="upload/1482370353992.jpg" width="130px" height="130px"  alt="Picture 3">
				  </ul>
				</div> 
			</div>
		</div>
	</div>
</div>
<!-- 下部  end-->	
</div>


				
								
			</div>
		</div>
	</div>

<script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="test.js"></script>
<script type="text/javascript" src="js/shebei.js"></script>
<script type="text/javascript" src="js/weixiu.js"></script>
<script type="text/javascript" src="js/zhuanyi.js"></script>
<script type="text/javascript" src="js/fileupload.js"></script>
<script type="text/javascript" src="js/viewer.js"></script>      
<style scoped="scoped">
		.textbox{
			height:20px;
			margin:0;
			padding:0 2px;
			box-sizing:content-box;
		}
	</style>
</body>
</html>