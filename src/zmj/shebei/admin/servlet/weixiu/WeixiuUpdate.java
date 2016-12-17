package zmj.shebei.admin.servlet.weixiu;

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


@WebServlet(name = "updateWeixiu.do", urlPatterns = { "/updateWeixiu.do" })
public class WeixiuUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String weixiuid = request.getParameter("weixiuid");
		String wxzhuangtai_edit = request.getParameter("wxzhuangtai_edit");
		String wxleixing_edit = request.getParameter("wxleixing_edit");
		String wxkeshi_edit = request.getParameter("wxkeshi_edit");
		String wxjine_edit = request.getParameter("wxjine_edit");
		String wxyuanyin_edit = request.getParameter("wxyuanyin_edit");
		String bxren_edit = request.getParameter("bxren_edit");
		String bxdate_edit = request.getParameter("bxdate_edit");
		String wxneirong_edit = request.getParameter("wxneirong_edit");
		String wxren_edit = request.getParameter("wxren_edit");
		String wxdate_edit = request.getParameter("wxdate_edit");
		String yanshoujilu_edit = request.getParameter("yanshoujilu_edit");
		String ysren_edit = request.getParameter("ysren_edit");
		String ysdate_edit = request.getParameter("ysdate_edit");
		String beizhu_edit = request.getParameter("beizhu_edit");
		
		double wxje = 0 ;
		if(wxjine_edit != null && !wxjine_edit.equals("")){
			wxje = Double.valueOf(wxjine_edit);
		}
		if(wxdate_edit.equals("")){
			wxdate_edit ="0000-00-00 00:00:00";
		}
		if(ysdate_edit.equals("")){
			ysdate_edit ="0000-00-00 00:00:00";
		}
		
		String sql = "update weixiu set wxzhuangtai='"+wxzhuangtai_edit
					+"',wxleixing='"+ wxleixing_edit
					+"',wxkeshi='"+ wxkeshi_edit
					+"',wxjine="+ wxje
					+",wxyuanyin='"+ wxyuanyin_edit
					+"',bxren='"+ bxren_edit
					+"',bxdate='"+ bxdate_edit
					+"',wxneirong='"+ wxneirong_edit
					+"',wxren='"+ wxren_edit
					+"',wxdate='"+ wxdate_edit
					+"',yanshoujilu='"+ yanshoujilu_edit
					+"',ysren='"+ ysren_edit
					+"',ysdate='"+ ysdate_edit
					+"',beizhu='"+ beizhu_edit+"' "
				+ "where id ="+weixiuid;
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
