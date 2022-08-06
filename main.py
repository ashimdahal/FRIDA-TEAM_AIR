from fastapi import FastAPI
from fastapi.responses import PlainTextResponse
from fundraiser import gofund
from news import create_table,nepali_news,nepali_news_2
from flood_detection import flooddetection

app=FastAPI(description="KUHackfest")

@app.get('/fund',response_class=PlainTextResponse)
async def fund():
    funds_result=gofund()
    return funds_result

@app.get('/news',response_class=PlainTextResponse)
async def news():
    news=create_table()
    return news

@app.get('/flood',response_class=PlainTextResponse)
async def flooddetection():
    flooddata=flooddetection()
    return flooddata