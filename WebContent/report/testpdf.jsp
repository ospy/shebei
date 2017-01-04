<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="zmj.shebei.admin.database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//报表编译之后生成的.jasper文件的存放位置 
		File reportFile = new File(
				this.getServletContext().getRealPath("report/report1.jasper"));
		//String url="jdbc:mysql://localhost:3306/db";
		//Class.forName("com.mysql.jdbc.Driver");
		Map parameters = new HashMap();
		Connection conn = DBPool.getInstance().getConnection();
		parameters.put("SQLSTR", "select * from admin");
		byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);
		response.setContentType("application/pdf");
		response.setContentLength(bytes.length);
		ServletOutputStream outStream = response.getOutputStream();
		outStream.write(bytes, 0, bytes.length);
		outStream.flush();
		outStream.close();
		out.clear();
		out = pageContext.pushBody();
	%>
</body>
</html>