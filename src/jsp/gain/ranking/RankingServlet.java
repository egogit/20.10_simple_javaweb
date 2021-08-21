package jsp.gain.ranking;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


public class RankingServlet {
	
	public static RankingServlet instance;
	
	public RankingServlet() {
		
	}
	
	public static RankingServlet getInstance() {
		if (instance == null)
			instance = new RankingServlet();
		return instance;
		
	}
	
	
	public static String[] appRank() {
		
		String[] rank = new String[45];
		
		try {
			
			int position =0;
			Document html = Jsoup.connect("https://store.steampowered.com/genre/Free%20to%20Play/#p=0&tab=TopSellers").get();
			
			Elements imgurl = html.select("#TopSellersRows img");
			Elements title = html.select("#TopSellersRows div.tab_item_name");
			Elements price = html.select("#TopSellersRows div.discount_final_price");
			
			for (Element el : imgurl)
			{
				rank[position]= el.getElementsByAttribute("src").attr("src");
				position +=3;
			}
			
			position =1;
			
			for (Element el : title)
			{
				rank[position] = el.text();
				position +=3;
			}
			
			position =2;
			for (Element el : price)
			{
				rank[position] =  el.text();
				position +=3;
			}
			
			
		} catch (IOException e) {
			e.printStackTrace();
			
		}
		
		return rank;
	}
	

}
