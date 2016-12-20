<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">

<script type="text/javascript" src="../easyui/jquery.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/easyui-lang-zh_CN.js"></script>
</head>
<body>
   <form id="importFileForm" method="post" enctype="multipart/form-data" >
        <table style="margin:5px;height:70px;">
            <tr>
                <td>请选择文件</td>
                <td width="5px;"></td>
                <td><input class="easyui-filebox" data-options="prompt:'选择文件',buttonText:'&nbsp;选&nbsp;择&nbsp;',required:true" id="fileImport" name="fileImport" style="width:260px;"></td>
                <td></td></tr>
            <tr>
                <td colspan="4"><label id="fileName" /></td>
            </tr>
            <tr>
                <td colspan="4">
                    <label id="uploadInfo" />
                </td>
            </tr>
        </table><div style="text-align:center;clear:both;margin:5px;">
            <a id="uploadFile" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" data-bind="click:importFileClick" href="javascript:void(0)">上传</a>
            <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" data-bind="click:closeImportClick" href="javascript:void(0)">关闭</a>
        </div>
    </form>
</body>
</html>