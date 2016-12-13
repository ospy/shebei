package zmj.shebei.admin.servlet.shebei;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zmj.shebei.admin.database.DBPool;

@WebServlet(name = "addShebei.do", urlPatterns = { "/addShebei.do" })
public class ShebeiAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String sbcode = request.getParameter("sbcode");
		 String sbname = request.getParameter("sbname");
		 String groupdl = request.getParameter("groupdl");
		 String groupxl = request.getParameter("groupxl");
		 String sykeshi = request.getParameter("sykeshi");
		 String xhtype = request.getParameter("xhtype");
		 String pinpai = request.getParameter("pinpai");
		 String chandi = request.getParameter("chandi");
		 String peizhi = request.getParameter("peizhi");
		 String jishuguige = request.getParameter("jishuguige");
		 String buydate = request.getParameter("buydate");
		 String useyears = request.getParameter("useyears");
		 String begindate = request.getParameter("begindate");
		 String sbleixing = request.getParameter("sbleixing");
		 String ccbianhao = request.getParameter("ccbianhao");
		 String bjiliang = request.getParameter("bjiliang");
		 String chuchangdate = request.getParameter("chuchangdate");
		 String sscj = request.getParameter("sscj");
		 String shuliang = request.getParameter("shuliang");
		 String danwei = request.getParameter("danwei");
		 String danjia = request.getParameter("danjia");
		 String beizhu = request.getParameter("beizhu");
		 String syzhuangtai = request.getParameter("syzhuangtai");
		 String didian = request.getParameter("didian");
		 String glfenlei = request.getParameter("glfenlei");
		 String glfenleibm = request.getParameter("glfenleibm");
		 String glfenleimc = request.getParameter("glfenleimc");
		 String jingxiaoshang = request.getParameter("jingxiaoshang");
		 String sbdengji = request.getParameter("sbdengji");
		 String shangbaoyb = request.getParameter("shangbaoyb");
		 String shangbaowjw = request.getParameter("shangbaowjw");
		 
		 if(begindate.equals("")){
			 begindate = "0000-00-00";
		 }
		 if(chuchangdate.equals("")){
			 chuchangdate = "0000-00-00";
		 }
		 if(buydate.equals("")){
			 buydate = "0000-00-00";
		 }
		 
		String sql = "insert into shebei(sbcode,  sbname,  groupdl,  groupxl,  sykeshi,  xhtype,  pinpai,"
				+ "  chandi,  peizhi,  jishuguige,  buydate,  useyears,  begindate,  sbleixing,  "
				+ "ccbianhao,  bjiliang,  chuchangdate,  sscj,  shuliang,  danwei,  danjia,  beizhu,"
				+ "  syzhuangtai,  didian,  glfenlei,  glfenleibm,  glfenleimc,  jingxiaoshang,  sbdengji ,shangbaoyb ,shangbaowjw) "
				+ "values('"+sbcode+"','"+sbname+"','"+groupdl+"','"+groupxl+"','"+sykeshi+"','"+xhtype
				+"','"+pinpai+"','"+chandi+"','"+peizhi+"','"+jishuguige+"','"+buydate+"','"+useyears
				+"','"+begindate+"','"+sbleixing+"','"+ccbianhao+"','"+bjiliang+"','"+chuchangdate+"','"+sscj
				+"','"+shuliang+"','"+danwei+"','"+danjia+"','"+beizhu+"','"+syzhuangtai+"','"+didian
				+"','"+glfenlei+"','"+glfenleibm+"','"+glfenleimc+"','"+jingxiaoshang+"','"+sbdengji+"','"+shangbaoyb+"','"+shangbaowjw+"')";
		System.out.println(sql);
		Connection conn = DBPool.getInstance().getConnection();
		Statement stmt = null;
		int result = 0;
		try {
			stmt = conn.createStatement();
			 result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		out.print(result);
		out.close();
	}

}
