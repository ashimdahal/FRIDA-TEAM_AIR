from asyncio import events
from fastapi import FastAPI
from fastapi.responses import PlainTextResponse
from fundraiser.gofund import funds
from news.create_table import getnews
from flood_detection.flooddetection import flood_info
from landslides.create_table import getlandslides
# import torch
from landslides.predict import LogisticRegression
from pathlib import Path

app=FastAPI(description="KUHackfest")

@app.get('/fund')
async def fund():
    funds_result=funds()
    return funds_result

@app.get('/news')
async def news():
    news=getnews()
    return news

@app.get('/flood')
async def flooddetection():
    flooddata=flood_info()
    return flooddata

@app.get('/events')
async def getevents():
    events={"Event name":"Protect the Nature by American Socieyty for change","Event name":"Protect Green life"}
    return events


@app.get('/landslides')
async def landslides():
    news=getlandslides()
    return news
