package zmj.shebei.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import zmj.shebei.admin.database.DBPool;
import zmj.shebei.admin.database.DatabaseTools;

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
}
