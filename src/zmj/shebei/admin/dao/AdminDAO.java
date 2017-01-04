package zmj.shebei.admin.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import zmj.shebei.admin.database.DBPool;
import zmj.shebei.admin.database.DatabaseTools;
import zmj.shebei.admin.database.RsToJsons;
import zmj.shebei.utils.SHA1;

public class AdminDAO {
	public static int getAdminByNameAndPwd(String name,String password){
		int result=0;
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = DBPool.getInstance().getConnection();
		String sql = "select id from admin where user='"+name+"' and password ='"+SHA1.getSHA1(password)+"' limit 1";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				result=1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseTools.closeResultset(rs);
			DatabaseTools.closeStatement(stmt);
			DatabaseTools.closeConnection(conn);
		}
		return result;
	}
}
