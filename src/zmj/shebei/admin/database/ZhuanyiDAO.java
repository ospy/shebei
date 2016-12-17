package zmj.shebei.admin.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;









import zmj.shebei.admin.bean.Zhuanyi;

public class ZhuanyiDAO {

	public static void main(String[] args) {
		
	}
	//添加转移
	public static int addZhuanyi(Zhuanyi zhuanyi){
		int result = 0;
		String sql = "insert into zhuanyi(sbid,oldkeshi,newkeshi,pizhunren,diaobodate,beizhu,newdidian,olddidian) values(?,?,?,?,?,?,?,?)";
		Connection conn = DBPool.getInstance().getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, zhuanyi.getSbid());
			pstmt.setInt(2, zhuanyi.getOldkeshi());
			pstmt.setInt(3, zhuanyi.getNewkeshi());
			pstmt.setString(4, zhuanyi.getPizhunren());
			pstmt.setDate(5, zhuanyi.getDiaobodate());
			pstmt.setString(6, zhuanyi.getBeizhu());
			pstmt.setString(7, zhuanyi.getNewdidian());
			pstmt.setString(8, zhuanyi.getOlddidian());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DatabaseTools.closeStatement(pstmt);
			DatabaseTools.closeConnection(conn);
		}
		return result;
	}
	
	//检索所有转移
	public static String getAllZhuanyi(){
		return null;
	}
	//根据设备id查找转移
	public static String getZhuanyiBySbid(int sbid,String sort,String order){
		String sql = "select a.*,sbcode,sbname, b.didian,c.keshiname as oldkeshiname,d.keshiname from zhuanyi a,shebei b,keshi c,keshi d where a.sbid=b.id and a.oldkeshi= c.id and a.newkeshi = d.id and sbid="+ sbid +" order by " + sort + " " + order ;
		Connection conn = DBPool.getInstance().getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String responseContent = "";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			responseContent = RsToJsons.resultSetToJson(rs);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseTools.closeResultset(rs);
			DatabaseTools.closeStatement(stmt);
			DatabaseTools.closeConnection(conn);
		}
		return responseContent;
	}
	
	
	//根据设备id查找转移
		public static String getZhuanyiByID(String id){
			String sql = "select * from zhuanyi where id="+ id ;
			Connection conn = DBPool.getInstance().getConnection();
			Statement stmt = null;
			ResultSet rs = null;
			String responseContent = "";
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				responseContent = RsToJsons.resultSetToJson(rs);

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DatabaseTools.closeResultset(rs);
				DatabaseTools.closeStatement(stmt);
				DatabaseTools.closeConnection(conn);
			}
			return responseContent;
		}
	
		//删除转移
	public static int delZhuanyiByIDs(String ids){
		String sql = "delete from zhuanyi where id in("+ids+")";
		Connection conn = DBPool.getInstance().getConnection();
		Statement stmt = null;
		int result = 0;
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseTools.closeStatement(stmt);
			DatabaseTools.closeConnection(conn);
		}
		return result;
	}
	
	
	public static int updateZhuanyi(Zhuanyi zhuanyi){
		Connection conn = DBPool.getInstance().getConnection();
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update zhuanyi set newkeshi=?,newdidian=?,pizhunren=?,diaobodate=?,beizhu=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, zhuanyi.getNewkeshi());
			pstmt.setString(2, zhuanyi.getNewdidian());
			pstmt.setString(3, zhuanyi.getPizhunren());
			pstmt.setDate(4, zhuanyi.getDiaobodate());
			pstmt.setString(5, zhuanyi.getBeizhu());
			pstmt.setInt(6, zhuanyi.getId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseTools.closeStatement(pstmt);
			DatabaseTools.closeConnection(conn);
		}
		return result;
	}
	
}
