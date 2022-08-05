from requests_html import HTMLSession
from newspaper import Article
import sqlite3

con = sqlite3.connect('news.db')
cur = con.cursor()

session = HTMLSession()

#use session to get the page
r = session.get('https://news.google.com/topics/CAAqBwgKMKeh0wEw-sE1?hl=en-US&gl=US&ceid=US%3Aen')

#render the html, sleep=1 to give it a second to finish before moving on. scrolldown= how many times to page down on the browser, to get more results. 5 was a good number here
r.html.render(sleep=1, scrolldown=1,timeout=20)

#find all the articles by using inspect element and create blank list
articles = r.html.find('article')
newslist = []
def main():
#loop through each article to find the title and link. try and except as repeated articles from other sources have different h tags.
    for item in articles:
        try:
            newsitem = item.find('h3', first=True)
            title = newsitem.text
            link = 'https://news.google.com'+list(newsitem.links)[0][1:]
            article = Article(link)
            article.download()
            article.parse()
            article.nlp()
            newsarticle = [ 
                title,
                link,
                article.summary
            ]
            newslist.append(newsarticle)
        except Exception as e:
            pass

    sql = '''INSERT INTO `english_news`
            ( `title`, `link`, `summary`) 
            VALUES (?, ?, ?)'''
    cur.executemany(sql,newslist)
    con.commit()
    con.close()
if __name__=='__main__':
    main()