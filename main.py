from asyncio import events
from pyexpat import model
from fastapi import FastAPI
from fastapi.responses import PlainTextResponse
from fundraiser.gofund import funds
from news.create_table import getnews
#from flood_detection.flooddetection import flood_info
from landslides.predict import get_weather
import torch

app=FastAPI(description="KUHackfest")

@app.get('/fund',response_class=PlainTextResponse)
async def fund():
    funds_result=funds()
    return funds_result

@app.get('/news',response_class=PlainTextResponse)
async def news():
    news=getnews()
    return news

@app.get('/flood',response_class=PlainTextResponse)
async def flooddetection():
    flooddata=flooddetection()
    return flooddata

@app.get('/events', response_class=PlainTextResponse)
async def getevents():
    events=None


@app.get('/lanslides')
async def landslides(q:str):
    key = open('landslides/key.txt','r').read()
    url = "http://api.openweathermap.org/data/2.5/weather?appid="
    # kathmandu or any other nepali xity hanera try garum hai ta kta ho
    city = q
    inp = torch.tensor(get_weather(key,url,city)).unsqueeze(0)
    get_weather(key,url,city)
    inp = torch.tensor(get_weather(key,url,city)).unsqueeze(0)
    value=model(inp).item()
    message={f"landslide_probability in {q}":value}
    return message
