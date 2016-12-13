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
import zmj.shebei.admin.database.DatabaseTools;

@WebServlet(name = "updateShebei.do", urlPatterns = { "/updateShebei.do" })
public class ShebeiUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String shebeiid = request.getParameter("shebeiid");
		String sbcode_edit = request.getParameter("sbcode_edit");
		 String sbname_edit = request.getParameter("sbname_edit");
		 String groupdl_edit = request.getParameter("groupdl_edit");
		 String groupxl_edit = request.getParameter("groupxl_edit");
		 String sykeshi_edit = request.getParameter("sykeshi_edit");
		 String xhtype_edit = request.getParameter("xhtype_edit");
		 String pinpai_edit = request.getParameter("pinpai_edit");
		 String chandi_edit = request.getParameter("chandi_edit");
		 String peizhi_edit = request.getParameter("peizhi_edit");
		 String jishuguige_edit = request.getParameter("jishuguige_edit");
		 String buydate_edit = request.getParameter("buydate_edit");
		 String useyears_edit = request.getParameter("useyears_edit");
		 String begindate_edit = request.getParameter("begindate_edit");
		 String sbleixing_edit = request.getParameter("sbleixing_edit");
		 String ccbianhao_edit = request.getParameter("ccbianhao_edit");
		 String bjiliang_edit = request.getParameter("bjiliang_edit");
		 String chuchangdate_edit = request.getParameter("chuchangdate_edit");
		 String sscj_edit = request.getParameter("sscj_edit");
		 String shuliang_edit = request.getParameter("shuliang_edit");
		 String danwei_edit = request.getParameter("danwei_edit");
		 String danjia_edit = request.getParameter("danjia_edit");
		 String beizhu_edit = request.getParameter("beizhu_edit");
		 String syzhuangtai_edit = request.getParameter("syzhuangtai_edit");
		 String didian_edit = request.getParameter("didian_edit");
		 String glfenlei_edit = request.getParameter("glfenlei_edit");
		 String glfenleibm_edit = request.getParameter("glfenleibm_edit");
		 String glfenleimc_edit = request.getParameter("glfenleimc_edit");
		 String jingxiaoshang_edit = request.getParameter("jingxiaoshang_edit");
		 String sbdengji_edit = request.getParameter("sbdengji_edit");
		 String shangbaoyb_edit = request.getParameter("shangbaoyb_edit");
		 String shangbaowjw_edit = request.getParameter("shangbaowjw_edit");
		
		double danjia = 0 ;
		if(danjia_edit != null && !danjia_edit.equals("")){
			danjia = Double.valueOf(danjia_edit);
		}
		if(buydate_edit.equals("")){
			buydate_edit ="0000-00-00";
		}
		if(begindate_edit.equals("")){
			begindate_edit ="0000-00-00";
		}
		if(chuchangdate_edit.equals("")){
			chuchangdate_edit ="0000-00-00";
		}
		
		String sql = "update shebei set sbcode='"+ sbcode_edit
					 +"',sbname='"+ sbname_edit
					 +"',groupdl='"+ groupdl_edit
					 +"',groupxl='"+ groupxl_edit
					 +"',sykeshi='"+ sykeshi_edit
					 +"',xhtype='"+ xhtype_edit
					 +"',pinpai='"+ pinpai_edit
					 +"',chandi='"+ chandi_edit
					 +"',peizhi='"+ peizhi_edit
					 +"',jishuguige='"+ jishuguige_edit
					 +"',buydate='"+ buydate_edit
					 +"',useyears='"+ useyears_edit
					 +"',begindate='"+ begindate_edit
					 +"',sbleixing='"+ sbleixing_edit
					 +"',ccbianhao='"+ ccbianhao_edit
					 +"',bjiliang='"+ bjiliang_edit
					 +"',chuchangdate='"+ chuchangdate_edit
					 +"',sscj='"+ sscj_edit
					 +"',shuliang='"+ shuliang_edit
					 +"',danwei='"+ danwei_edit
					 +"',danjia="+ danjia
					 +",beizhu='"+ beizhu_edit
					 +"',syzhuangtai='"+ syzhuangtai_edit
					 +"',didian='"+ didian_edit
					 +"',glfenlei='"+ glfenlei_edit
					 +"',glfenleibm='"+ glfenleibm_edit
					 +"',glfenleimc='"+ glfenleimc_edit
					 +"',jingxiaoshang='"+ jingxiaoshang_edit
					 +"',shangbaoyb='"+ shangbaoyb_edit
					 +"',shangbaowjw='"+ shangbaowjw_edit
					 +"',sbdengji='"+ sbdengji_edit+"' "
					 + "where id ="+shebeiid;
		Connection conn = DBPool.getInstance().getConnection();
		Statement stmt = null;
		int result = 0;
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseTools.closeStatement(stmt);
			DatabaseTools.closeConnection(conn);
		}
		// 响应消息
		PrintWriter out = response.getWriter();
		out.print(result);
		out.close();
	}

}
