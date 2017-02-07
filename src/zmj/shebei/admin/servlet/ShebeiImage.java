package zmj.shebei.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zmj.shebei.admin.dao.ImageDAO;

@WebServlet(name = "ShebeiImage.do", urlPatterns = { "/ShebeiImage.do" })
public class ShebeiImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		switch (method) {
		case "getImage":
			getShebeiImage(request, response);
			break;
		case "del":
			delImage(request, response);
		default:
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void getShebeiImage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		String sbid = request.getParameter("sbid");
		PrintWriter out = response.getWriter();
		out.print(ImageDAO.getAllImageStr(sbid));
		out.close();
	}

	protected void delImage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String imageid = request.getParameter("imageid");
	}
}
