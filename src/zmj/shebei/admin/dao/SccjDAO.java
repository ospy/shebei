package zmj.shebei.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import zmj.shebei.admin.bean.SccjBean;
import zmj.shebei.admin.database.DBPool;
import zmj.shebei.admin.database.DatabaseTools;

public class SccjDAO {
	public static String getAll(String sql) {
		String result =DatabaseTools.getAll(sql);
		return result;
	}
	
	public static int addSccj(SccjBean sccj){
		String sql = "insert into sccj(CBM,cjname,CPYM,CGB,CDWDZ,CDWYB,CLXR,CDH,BENABLE,CZLG,CDAH,CQQ,CEmail,CCZ,CSJCJ) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Connection conn = DBPool.getInstance().getConnection();
		PreparedStatement pstmt = null;
		int result=0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sccj.getCBM());
			pstmt.setString(2, sccj.getCjname());
			pstmt.setString(3, sccj.getCPYM());
			pstmt.setString(4, sccj.getCGB());
			pstmt.setString(5, sccj.getCDWDZ());
			pstmt.setString(6, sccj.getCDWYB());
			pstmt.setString(7, sccj.getCLXR());
			pstmt.setString(8, sccj.getCDH());
			pstmt.setInt(9, sccj.getBENABLE());
			pstmt.setString(10, sccj.getCZLG());
			pstmt.setString(11, sccj.getCDAH());
			pstmt.setString(12, sccj.getCQQ());
			pstmt.setString(13, sccj.getCEmail());
			pstmt.setString(14, sccj.getCCZ());
			pstmt.setString(15, sccj.getCSJCJ());
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
