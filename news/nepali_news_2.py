import requests
from bs4 import BeautifulSoup
import time
from newspaper import Article
from anytranslate import *

def news():
	url = "https://www.onlinekhabar.com/?search_keyword=climate&fbclid=IwAR3iFqwtj-DVIkd7GHxWqa9eSAHxMkv-ozK2Y8BLCQQK2kXhD5a7yfpPgZE"

	# getting html content
	r = requests.get(url)
	HTMLcontent = r.content

	# creating html parser
	soup = BeautifulSoup(HTMLcontent, "html.parser")
	# print(soup.prettify())

	divs = soup.find_all("div", class_="ok-news-post ok-post-ltr")

	news = []

	for div in divs:
		news_link = div.find("a")['href']
		news_title = div.find("div", class_="ok-post-content-wrap").h2.text		
		news_info = div.find("div", class_="ok-title-info").p.text
		
		news_dict = {
			"title": news_title,
			"link": news_link,
			"detail": news_info
			  }

		news.append(news_dict)
        
	return news

if __name__ == "__main__":
	while True:
		news()
		time_hr = 60*24			
		break				