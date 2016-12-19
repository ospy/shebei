package zmj.shebei.admin.servlet.zhuanyi;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zmj.shebei.admin.bean.Zhuanyi;
import zmj.shebei.admin.database.ZhuanyiDAO;

@WebServlet(name = "updatezhuanyi.do", urlPatterns = { "/updatezhuanyi.do" })
public class ZhuanyiUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String id = request.getParameter("zhuanyiid");
		String newkeshi = request.getParameter("newkeshi_edit");
		String pizhunren = request.getParameter("pizhunren_edit");
		String diaobodate = request.getParameter("diaobodate_edit");
		String beizhu = request.getParameter("zybeizhu_edit");
		String newdidian = request.getParameter("newdidian_edit");
		Zhuanyi zhuanyi = new Zhuanyi();
		zhuanyi.setId(Integer.parseInt(id));
		zhuanyi.setBeizhu(beizhu);
		zhuanyi.setPizhunren(pizhunren);
		zhuanyi.setNewdidian(newdidian);
		zhuanyi.setNewkeshi(Integer.parseInt(newkeshi));
		zhuanyi.setDiaobodate(Date.valueOf(diaobodate));
		
		// 响应消息
		PrintWriter out = response.getWriter();
		out.print(ZhuanyiDAO.updateZhuanyi(zhuanyi));
		out.close();
	}

}
