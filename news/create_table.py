import sqlite3

con = sqlite3.connect('news.db')
cur = con.cursor()
# english_news
# sql = '''CREATE TABLE nepali_news (id INTEGER NOT NULL PRIMARY KEY
# , title TEXT NOT NULL , link TINYTEXT NOT NULL , summary TEXT NOT NULL);'''
delete = '''DELETE FROM english_news
WHERE id>40;'''
sql = '''SELECT * FROM english_news'''
print(cur.execute(sql).fetchall())
# con.commit()