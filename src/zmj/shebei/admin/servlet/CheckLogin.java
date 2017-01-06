package zmj.shebei.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		int result = AdminDAO.getAdminByNameAndPwd(username, password);
		if(result==1){
			HttpSession session = request.getSession (true); 
			session.setAttribute("username", username);
		}
		// 响应消息
				PrintWriter out = response.getWriter();
				out.print(result);
				out.close();
	}

}
