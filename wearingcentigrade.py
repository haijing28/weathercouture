import pywapi
from flask import Flask, jsonify, render_template, request

snowing = 0 
raining = 1
sunny = 2
cloudy = 3
thundering = 4
fair = 5

app = Flask(__name__)

def find_weather(zipcode):
   weather = pywapi.get_weather_from_yahoo(zipcode)
   text = weather['condition']['text']
   temp = int(weather['condition']['temp'])
   if 'Snow' in text:
       return snowing, temp
   if 'Sunny' in text:
       return sunny, temp
   if 'Cloudy' in text:
       return cloudy, temp
   if 'Thunder' in text:
       return thundering, temp
   if 'Rain' in text:
       return raining, temp
   if 'Showers' in text:
       return raining, temp
   if 'Fair' in text:
       return fair, temp

@app.route("/<zipcode>")
def get_weather(zipcode):
   result = find_weather(zipcode)
   return ','.join(map(str, result))

if __name__ == '__main__':
   app.debug = True
   app.run(host='0.0.0.0', port = 80)