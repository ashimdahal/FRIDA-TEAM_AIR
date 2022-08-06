import requests, json

key = open('key.txt','r').read()
url = "http://api.openweathermap.org/data/2.5/weather?appid="
# kathmandu or any other nepali xity hanera try garum hai ta kta ho
city = "&q=Kathmandu"

def get_weather(key,url,city):
    response = requests.get(url+key+city+'&units=metric')
    return response.json()

class RangeDict(dict):
    def __getitem__(self, item):

        if not (isinstance(item, range) or isinstance(item,str)): 
            for key in self:
                if item in key:
                    return self[key]
            raise KeyError(item)
        else:
            return super().__getitem__(item) 
 
weather_dict = RangeDict(
    {
        # message for thunderstorm
        range(200,233):'Be careful! A thunderstorm is on its way; would be a perfect day to roll up  in a blanket and sip some hot tea.',
        # message for drizzle(light and heavy differentiator use gareko xina esma)
        range(300,321):'Rain vs Drizzle? It boils down to the size of wather droplets but water is water; a great time to carry an umbrella would be now.',
        # message for rain(esma ni light and heavy rain is not differentiated)
        range(500,533): 'Oh no! The dark and wet clouds seem to have formed around you. An umbrella and a raincoat would be handy today.',
        # message for snow
        range(600,623):'Ready to play with a snowman? well, be ready because it\'s about to snow.',
        # message for clouds
        range(801,805):'Today, you\'ll be covered with love, care and clouds; no signs of rain though in the forcast but would be a good idea to grab an umbrella.',

        '800':'Today the weather is as clear as your heart and soul; wishing you a great day ahead.',

        # not relavent for nepal I guess.
        '701'	:'Mist',	
        '711'	:'Smoke',	
        '721'	:'Haze',	
        '731'	:'Dust',	
        '741'	:'Fog',	
        '751'	:'Sand',	
        '761'	:'Dust',	
        '762'	:'Ash',	
        '771'	:'Squall',	
        '781'	:'ALERT!! A tronado is comming your way',
    }
)
def personalized_message(get_weather,weather_dict):
    w_id = get_weather(key,url,city)['weather'][0]['id']
    if w_id == 800 or w_id in range(701,782):
        w_id = str(w_id)
    message = weather_dict[w_id]
    return message

if __name__=='__main__':
    print(personalized_message(get_weather,weather_dict))
