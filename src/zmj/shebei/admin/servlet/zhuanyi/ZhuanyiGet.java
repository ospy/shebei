package zmj.shebei.admin.servlet.zhuanyi;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zmj.shebei.admin.database.ZhuanyiDAO;
@WebServlet(name = "getzhuanyi.do", urlPatterns = { "/getzhuanyi.do" })
public class ZhuanyiGet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		
		// 响应消息
				PrintWriter out = response.getWriter();
				out.print(ZhuanyiDAO.getZhuanyiByID(id));
				out.close();
	}

}
