from asyncio import events
from fastapi import FastAPI
from fastapi.responses import PlainTextResponse
from fundraiser.gofund import funds
from news.create_table import getnews
#from flood_detection.flooddetection import flood_info
from landslides.predict import get_weather
import torch
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

@app.get('/flood',response_class=PlainTextResponse)
async def flooddetection():
    flooddata=flooddetection()
    return flooddata

@app.get('/events', response_class=PlainTextResponse)
async def getevents():
    events=None


@app.get('/landslides')
async def landslides(city:str):
    key = open('landslides/key.txt','r').read()
    url = f"http://api.openweathermap.org/data/2.5/weather?appid={key}"+f"&q=bhaktapur&unit=metrics"
    model = LogisticRegression()
    model.load_state_dict(torch.load(Path(__file__).resolve().parent /'landslides/model.pt',map_location=torch.device('cpu')))
    inp = torch.tensor(get_weather(key,url,city)).unsqueeze(0)
    get_weather(key,url,city)
    inp = torch.tensor(get_weather(key,url,city)).unsqueeze(0)
    value=model(inp).item()
    message={f"landslide_probability in bhaktapur ":value}
    return message
