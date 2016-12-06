package zmj.shebei.admin.database;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

public class RsToJsons {

	public static String resultSetToJson(ResultSet rs) throws SQLException,
			JSONException
	{
		// json����
		JSONArray array = new JSONArray();
		// ��ȡ����
		ResultSetMetaData metaData = rs.getMetaData();
		int columnCount = metaData.getColumnCount();
		
		// ����ResultSet�е�ÿ������
		while (rs.next()) {
			JSONObject jsonObj = new JSONObject();
			// ����ÿһ��
			for (int i = 1; i <= columnCount; i++) {
				String columnName = metaData.getColumnLabel(i);
				String value = rs.getString(columnName);
				jsonObj.put(columnName, value);
			}
			array.add(jsonObj);
		}
		return array.toString();
	}
}
