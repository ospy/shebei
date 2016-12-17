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

@WebServlet(name = "addZhuanyi.do", urlPatterns = { "/addZhuanyi.do" })
public class ZhuanyiAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String sbid = request.getParameter("sbid");
		String oldkeshi = request.getParameter("hiddenoldkeshi");
		String newkeshi = request.getParameter("newkeshi");
		String pizhunren = request.getParameter("pizhunren");
		String diaobodate = request.getParameter("diaobodate");
		String beizhu = request.getParameter("zybeizhu");
		String newdidian = request.getParameter("newdidian");
		String olddidian = request.getParameter("hiddenolddidian");
		Zhuanyi zhuanyi = new Zhuanyi();
		zhuanyi.setSbid(Integer.parseInt(sbid));;
		zhuanyi.setBeizhu(beizhu);
		zhuanyi.setPizhunren(pizhunren);
		zhuanyi.setNewdidian(newdidian);
		zhuanyi.setNewkeshi(Integer.parseInt(newkeshi));
		zhuanyi.setDiaobodate(Date.valueOf(diaobodate));
		zhuanyi.setOldkeshi(Integer.parseInt(oldkeshi));
		zhuanyi.setOlddidian(olddidian);
		// 响应消息
		PrintWriter out = response.getWriter();
		out.print(ZhuanyiDAO.addZhuanyi(zhuanyi));
		out.close();
	}

}
