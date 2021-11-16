package web.util;

import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


public class MessageService {

	public static void sendMessage(String toNumber, String randomNumber) {

		String api_key = "NCSSMZMQ04HYSD1R";
		String api_secret = "OMGAPHLA1HB0NLSDCQYND8B2T4XUN9YT";
		Message coolsms = new Message(api_key, api_secret);

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", toNumber);
		params.put("from", "01038569061");
		params.put("type", "SMS");
		params.put("text", "[ReadWithMe] 인증번호 "+randomNumber+" 를 입력하세요.");
		params.put("app_version", "test app 1.2");

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

	public static String makeRandom(int len, int dupCd) {
		Random rand = new Random();
        String numStr = "";        
        
        for(int i=0;i<len;i++) {
            
            String ran = Integer.toString(rand.nextInt(10));
            
            if(dupCd==1) {
                numStr += ran;
            }else if(dupCd==2) {
                if(!numStr.contains(ran)) {
                    numStr += ran;
                }else {
                    i-=1;
                }
            }
        }
        return numStr;
	}
	
}
