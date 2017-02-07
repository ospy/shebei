package zmj.shebei.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.hadoop.hive.ql.parse.HiveParser.statement_return;

import zmj.shebei.admin.database.DBPool;
import zmj.shebei.admin.database.DatabaseTools;
import zmj.shebei.admin.database.RsToJsons;

public class ImageDAO {
	public static int saveImage(int sbid,String filename){
		Connection conn = DBPool.getInstance().getConnection();
		PreparedStatement pstmt = null;
		String sql="insert into image(sbid,filename) values(?,?)";
		int result=0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sbid);
			pstmt.setString(2, filename);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DatabaseTools.closeStatement(pstmt);
			DatabaseTools.closeConnection(conn);
		}
		return result;
	}
	
	public static String getAllImageStr(String sbid){
		Connection conn = DBPool.getInstance().getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql="select *from image where sbid="+sbid;

		StringBuffer sb  = new StringBuffer();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				sb.append("<a href=\"upload/");
				sb.append(rs.getString("filename")+"\" target=\"_blank\">");
				sb.append("<img src=\"upload/");
				sb.append(rs.getString("filename"));
				sb.append("\" width=\"130px\" height=\"130px\"></a>&nbsp&nbsp");				
				sb.append("<a href=\"DelImage.do?imageid=");
				sb.append(rs.getInt("id"));
				sb.append("\" class=\"easyui-linkbutton\" iconCls=\"icon-del\" plain=\"true\" >删除</a> &nbsp&nbsp");				
			}
//			sb.append("<script type=\"text/javascript\">"
//					+ "$('#images').viewer();"
//					+ "</script>");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseTools.closeResultset(rs);
			DatabaseTools.closeStatement(stmt);
			DatabaseTools.closeConnection(conn);
		}
		return sb.toString();
	}
	
}
