package web.util;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import web.user.dto.UserTb;

public class JsonParser {

	JSONParser jsonParser = new JSONParser();

	public UserTb changeJson(String string) throws Exception {

		HashMap<String, Object> map = new HashMap<>();
		JSONParser jsonParser = new JSONParser();
		UserTb user = new UserTb();

		JSONObject jsonObject = (JSONObject) jsonParser.parse(string);

		jsonObject = (JSONObject) jsonObject.get("response");

		map.put("userId", jsonObject.get("id"));
		map.put("userName", jsonObject.get("name"));
		map.put("email", jsonObject.get("name"));
		map.put("nick", jsonObject.get("nickname"));

		user.setId(map.get("userId").toString());
		user.setName(map.get("userName").toString());
		user.setEmail(map.get("email").toString());
		user.setNick(map.get("nick").toString());

		return user;
		
	}
	
}
