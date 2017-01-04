package zmj.shebei.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zmj.shebei.admin.dao.AdminDAO;


@WebServlet(name = "CheckLogin.do", urlPatterns = { "/CheckLogin.do" })
public class CheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("manager");
		String password = request.getParameter("password");
		
		// 响应消息
				PrintWriter out = response.getWriter();
				out.print(AdminDAO.getAdminByNameAndPwd(username, password));
				out.close();
	}

}
