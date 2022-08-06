
import aiohttp
import asyncio
import datetime
import json
import requests
from datetime import timedelta

flood_places={
    "Chamelia at Karkale Gaun":21571,
    "Tamolriver at Mulghat":3614,
    "Surnaya Gad at Gajur Gaon":3656,
    "Mahakali at Parigaon":1234,
    "Khutiya khola at Mudibhar":19194,
    "Rara Daha at Sen":21356,
    "Humla Karnali at Lalighat":2392,
    "Karnali at Asaraghat":1329,
    "Lohare Khola at Tallo ":20627,
    "Seti River at Chainpur":21365,
    "Budiganga at Chitreghat":1248,
    "West Seti at Dipayal":802,
    "Sano Bheri at Hurikot":12382,
    "Sano Bheri at Simlighat":2267,
    "Saru Gad at Jajarkot":21342,
    "Bheri at Jamu":2289,
    "Rapti River at Kusum":5697,
    "Karnali at Chisapani":691,
    "Andhi Khola at Borlang pool":19964,
    "Daaram Khola at Wamitaksar":2641,
    "Trishuli River at Kali Khola":19583,
    "Kali Gandaki at Kalipul Beni":20005
}

_base_url="https://hydrology.gov.np/gss/api/observation?series_id={}&date_from={}&date_to={}"
def flood_info():
    final_output={}
    for _river_loc in flood_places:
        counter,water_level,res=0,0,None
        url=_base_url.format(_river_loc,str((datetime.datetime.now() - timedelta(days=1)).date()),str(datetime.date.today()))
        print(url)
        res=requests.get(url)
        print(res.text)
        res=json.loads(res.text)
        for event in res['data']:
            water_level+=int(event['value'])
            counter+=1
        if water_level>5: # in meters
            final_output[_river_loc]={"water level":water_level,"message":"Stay alert high chance of flood"}
        if water_level<5:
            final_output[_river_loc]={"water level":water_level,"message":"Water level is nominal"}
    #print(final_output)
    #return final_output
        


flood_info()
