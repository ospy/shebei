package zmj.test;

import org.junit.Test;

import zmj.shebei.utils.SHA1;

public class TestClass {

	public static void main(String[] args) {
		

	}

	@Test
	public void len(){
		System.out.println("d1d22b80757f6f0339d2018fc62f76f4".length());
		System.out.println("40bd001563085fc35165329ea1ff5c5ecbdbbeef".length());
		System.out.println(SHA1.getSHA1("123"));
	}
}
