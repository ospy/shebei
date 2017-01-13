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
<script type="text/javascript">
$.getJSON("../GetImageJsonTest", function(data){
	 $.each(data, function(i,item){
		    $("<img width='200px' height='200px'/>").attr("src", "../upload/"+item.filename).appendTo("#images");
		    if ( i == 3 ) return false;
		 // alert(item);
		  });
		},"json");
</script>
</head>
<body>
<div id="images"></div>
</body>
</html>