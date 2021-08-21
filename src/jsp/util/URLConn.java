package jsp.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import java.net.HttpURLConnection;
import java.net.URL;


public class URLConn {

	public String json;
	
	public URLConn(String address) throws Exception {
		
		BufferedReader br;
		URL url;
		HttpURLConnection conn;
		String protocol = "GET";
		
		url = new URL(address);
		conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod(protocol);
		br = new BufferedReader( new InputStreamReader(conn.getInputStream()));
		
		json = br.readLine();
		
	}

}

