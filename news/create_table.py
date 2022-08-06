import sqlite3
import nepali_news,nepali_news_2

def getnews():

    con = sqlite3.connect('news.db')
    cur = con.cursor()
    # english_news
    # sql = '''CREATE TABLE nepali_news (id INTEGER NOT NULL PRIMARY KEY
    # , title TEXT NOT NULL , link TINYTEXT NOT NULL , summary TEXT NOT NULL);'''
    delete = '''DELETE FROM english_news
    WHERE id>40;'''
    sql = '''SELECT * FROM english_news'''

    final_news_output=[]
    for item in (cur.execute(sql).fetchall()):
        newsformat={
        "id":None,
        "title":None,
        "link":None,
        "breif":None,
    }
        newsformat['id']=item[0]
        newsformat['title']=item[1]
        newsformat['link']=item[2]
        newsformat['breif']=item[3]
        final_news_output.append(newsformat)

    print(final_news_output)
    
    nepalisql = '''SELECT * FROM nepali_news'''

    final_news_output=[]
    for item in (cur.execute(nepalisql).fetchall()):
        newsformat={
        "id":None,
        "title":None,
        "link":None,
        "breif":None,
    }
        newsformat['id']=item[0]
        newsformat['title']=item[1]
        newsformat['link']=item[2]
        newsformat['breif']=item[3]
        final_news_output.append(newsformat)

    print(final_news_output)   
    return final_news_output

