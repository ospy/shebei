package zmj.shebei.utils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 依赖包：json-lib-2.4-jdk15.jar
 * 		commons-lang-2.6.jar
 * 		ezmorph-1.0.6.jar
 * 		commons-logging-1.2.jar
 * 		commons-collections-3.2.1.jar
 * 		commons-beanutils-1.9.2.jar
 * @author Administrator
 *
 */
public class ObjectToJson {

	public static void main(String[] args) {
//		TestObject []obj = {new TestObject(1,"zhangsan","1234",new Address("sichuang","chengdu")),
//				new TestObject(2,"李四","12345",new Address("sichuang","绵阳"))};
//		//System.out.println(getJsonFromObject(obj));
//		System.out.println(getJsonFromObjects(obj));
//		
//		JSONObject js = (JSONObject)JSONArray.fromObject(obj).get(1);
//		System.out.println(js.getJSONObject("add").getString("province"));
	}

	/**
	 * 对象转为json
	 * @param obj
	 * @return
	 */
	public static String getJsonFromObject(Object obj){
		return JSONObject.fromObject(obj).toString();
	}
	
	/**
	 * 对象数组转为json
	 * @param obj
	 * @return
	 */
	public static String getJsonFromObjects(Object []obj){
		return JSONArray.fromObject(obj).toString();
	}
}
