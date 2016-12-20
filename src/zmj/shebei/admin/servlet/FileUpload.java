package zmj.shebei.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FileUpload.do", urlPatterns = { "/FileUpload.do" })
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
		
		
		
		
		
		
		
		String info = "";
         try
         {
             //获取客户端上传的文件集合
             HttpFileCollection files = System.Web.HttpContext.Current.Request.Files;
             //判断是否存在文件
             if (files.Count > 0)
             {
                 //获取文件集合中的第一个文件(每次只上传一个文件)
                 HttpPostedFile file = files[0];
                 //定义文件存放的目标路径
                 string targetDir = System.Web.HttpContext.Current.Server.MapPath("~/FileUpLoad/Product");
                 //创建目标路径
                 ZFiles.CreateDirectory(targetDir);
                 //组合成文件的完整路径
                 string path = System.IO.Path.Combine(targetDir, System.IO.Path.GetFileName(file.FileName));
                 //保存上传的文件到指定路径中
                 file.SaveAs(path);
                 info = "上传成功";
             }
             else
             {
                 info = "上传失败";
             }
         }
         catch
         {
             info= "上传失败";
         }
         return info;
	}

}
