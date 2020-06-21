package database;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class Cracker {
	
	public static String hexToString(byte[] bytes) {
		System.out.println("A");
		return bytes.toString();
	}
	
	public static byte[] hexToArray(String hex) {
		System.out.println("B");
		byte[] result = new byte[hex.length()/2];
		for (int i=0; i<hex.length(); i+=2) {
			result[i/2] = (byte) Integer.parseInt(hex.substring(i, i+2), 16);
		}	
		System.out.println("SSSEWEWE");
		return result;
	}
		
	
	public static byte[] HashFunction(byte[] line) throws NoSuchAlgorithmException {
		System.out.println("C");
		MessageDigest dm=MessageDigest.getInstance("SHA");
		byte[] res=dm.digest(line);
		dm.update(res);
		return res;	
	}

}
