import requests
from bs4 import BeautifulSoup
import time


def news():
    # getting url of the news website
	url = "https://www.setopati.com/search?from=&search_text=%E0%A4%9C%E0%A4%B2%E0%A4%B5%E0%A4%BE%E0%A4%AF%E0%A5%81"

	# getting html content
	r = requests.get(url)
	HTMLcontent = r.content

	# creating html parser(creating soup)
	soup = BeautifulSoup(HTMLcontent, "html.parser")

	divs = soup.find_all("div", class_="items col-md-4")

    # list to store news details
	news = []

	for index, div in enumerate(divs):
		news_link = div.find("a")
		# news_title = news_link.find("span", class_="main-title")
		if index <= 20:
		    news_dict = {
                "title": news_link['title'], 
                "link": news_link['href']
                }
		    news.append(news_dict)


# repeat after certain period of time 
if __name__ == "__main__":
	while True:
		news()
		time_hr = 60*24							#hour to minute
		time.sleep(60 * time_hr)				#minute to seconds