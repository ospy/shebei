package zmj.shebei.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA1 {

	public static void main(String[] args) {
		//40BD001563085FC35165329EA1FF5C5ECBDBBEEF
		System.out.println(getSHA1("123456"));
		System.out.println(getSHA1("123").length());
	}

	/**
	 * SHA1签名生成
	 * @param content
	 * @return
	 */
	public static String getSHA1(String content) {
		String sha1="";
			MessageDigest md;
			StringBuffer hexstr = new StringBuffer();
			try {
				md = MessageDigest.getInstance("SHA-1");
				md.update(content.getBytes());
				byte[] digest = md.digest();

				String shaHex = "";
				for (int i = 0; i < digest.length; i++) {
					shaHex = Integer.toHexString(digest[i] & 0xFF);
					if (shaHex.length() < 2) {
						hexstr.append(0);
					}
					hexstr.append(shaHex);
				}
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			sha1 =hexstr.toString();
			return sha1;
	}

}
