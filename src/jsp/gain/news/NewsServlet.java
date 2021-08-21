package jsp.gain.news;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;


import jsp.util.URLConn;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Random;



public class NewsServlet {
	
	public static NewsServlet instance;
	
	
	public NewsServlet() {
		
	}
	
	public static NewsServlet getInstance() {
		if (instance ==null)
			instance = new NewsServlet();
		return instance;
	}
	
	
	
	
	public static long[] appPick(int picknum) {
		
		try {
		String address ="https://api.steampowered.com/ISteamApps/GetAppList/v2/?";
		URLConn conn = new URLConn(address);
		
		String json = conn.json;
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject) parser.parse(json);
		JSONObject channel = (JSONObject) obj.get("applist");
		JSONArray item = (JSONArray) channel.get("apps");
		
		int itemnum = item.size();
		
		Random rand = new Random();

		int pick = 0;
		long[] appidpick = new long[itemnum];
		
		for (int i=0; i<picknum; i++) {
			
			pick = rand.nextInt(itemnum);
			JSONObject tmp = (JSONObject) item.get(pick);
			appidpick[i] = (long) tmp.get("appid"); 
		}
		return appidpick;
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String[] newsjson(long appid) {
		
		try {
			
			while(true){
				
			String address = "https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?&appid=" +appid;
			URLConn conn = new URLConn(address);
			
			String[] jsoninfo = new String[5];
			
			String json = conn.json;
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(json);
			JSONObject channel = (JSONObject) obj.get("appnews");
			long count = (long) channel.get("count");
				if (count != 0)
				{
					long micromildate;
					JSONArray item = (JSONArray) channel.get("newsitems");
					JSONObject tmp = (JSONObject) item.get(0);
					jsoninfo[0] = Long.toString(appid);
					jsoninfo[1] = (String) tmp.get("title");
					jsoninfo[2] = (String) tmp.get ("url");
					jsoninfo[3] = (String) tmp.get ("author");
					micromildate = (long) tmp.get ("date");
					
					micromildate *=1000;
					DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					jsoninfo[4] = (String) df.format(micromildate);
					
					return jsoninfo;
				}
				else
				{
					long[] num = new long[1];
					num = appPick(1);
					appid = num[0];
				}
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	
	public static String[] gamenewsjson() {
		
		try {
			int picknum = 10;
			
			long[] gameid = new long[picknum];
			String[] newsinfo = new String[50];
			String[] tmp = new String[5];
			
			
			gameid = appPick(picknum);
			
			int position=0;
			
			for (int i=0;i<picknum;i++) {
				
				tmp = newsjson(gameid[i]);
				for (int j=0;j<5;j++)
				{
					newsinfo[position] = tmp[j];
					position ++;
				}

			}
			 return newsinfo;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
		
	}
	

	
}
