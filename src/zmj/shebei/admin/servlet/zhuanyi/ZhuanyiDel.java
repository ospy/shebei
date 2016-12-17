package zmj.shebei.admin.servlet.zhuanyi;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zmj.shebei.admin.database.ZhuanyiDAO;

@WebServlet(name = "deletezhuanyi.do", urlPatterns = { "/deletezhuanyi.do" })
public class ZhuanyiDel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ids = request.getParameter("ids");
		// 响应消息
		PrintWriter out = response.getWriter();
		out.print(ZhuanyiDAO.delZhuanyiByIDs(ids));
		out.close();
	}

}
