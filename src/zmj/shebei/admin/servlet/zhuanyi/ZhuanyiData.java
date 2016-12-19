package zmj.shebei.admin.servlet.zhuanyi;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zmj.shebei.admin.database.ZhuanyiDAO;

@WebServlet(name = "zhuanyi_data.do", urlPatterns = { "/zhuanyi_data.do" })
public class ZhuanyiData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String sid = request.getParameter("id");
		int id = 50000;
		if (sid != null) {
			id = Integer.parseInt(request.getParameter("id"));
		}
		String sort = request.getParameter("sort");
		String order = request.getParameter("order");
		// 响应消息
		PrintWriter out = response.getWriter();
		out.print(ZhuanyiDAO.getZhuanyiBySbid(id, sort, order));
		out.close();
	}

}
