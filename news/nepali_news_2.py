import requests
from bs4 import BeautifulSoup
import sqlite3

con = sqlite3.connect('news.db')
cur = con.cursor()

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
		
        news_dict = [
			news_title,
			news_link,
			news_info
			]
        news.append(news_dict)

    sql = '''INSERT INTO `nepali_news`
            ( `title`, `link`, `summary`) 
            VALUES (?, ?, ?)'''
    cur.executemany(sql,news)
    con.commit()
    con.close()
    return news

if __name__ == "__main__":
	print(news())		