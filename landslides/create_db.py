import sqlite3
con = sqlite3.connect('landslides.db')
cur = con.cursor()
# sql = '''CREATE TABLE landslides (id INTEGER NOT NULL PRIMARY KEY
# , district TEXT NOT NULL , prob REAL NOT NULL);'''
# sql = ''' select * from landslides'''
# print(cur.execute(sql).fetchall())

def getlandslides():

    con = sqlite3.connect('landslides.db')
    cur = con.cursor()
    # english_news
    # sql = '''CREATE TABLE nepali_news (id INTEGER NOT NULL PRIMARY KEY
    # , title TEXT NOT NULL , link TINYTEXT NOT NULL , summary TEXT NOT NULL);'''
    delete = '''DELETE FROM english_news
    WHERE id>40;'''
    sql = '''SELECT * FROM landslides'''

    final_news_output=[]
    for item in (cur.execute(sql).fetchall()):
        newsformat={
        "id":None,
        "probs":None,
        "district":None,
      
    }
        newsformat['id']=item[0]
        newsformat['district']=item[1]
        newsformat['probs']=item[2]

        final_news_output.append(newsformat)
    return final_news_output