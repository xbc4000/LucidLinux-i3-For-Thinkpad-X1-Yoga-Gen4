#!/bin/python

# -*- coding: utf-8 -

# Procedure
# Go to https://openweathermap.org/city
# Create an account on this website
# Create an api key (free)
# Enter your api key
# Enter your city
# Check the url 
# there will be a city code at the end


import requests

CITY = "5920470"
API_KEY = "756edce7e9d4c385ef9499a53492678c"
UNITS = "Metric"
#UNIT_KEY = "C"
UNIT_KEY = "F"
LANG = "en"
#LANG = "nl"
#LANG = "hu"

REQ = requests.get("http://api.openweathermap.org/data/2.5/weather?id={}&lang={}&appid={}&units={}".format(CITY, LANG,  API_KEY, UNITS))
try:
    # HTTP CODE = OK
    if REQ.status_code == 200:
        CURRENT = REQ.json()["weather"][0]["description"].capitalize()
        TEMP = int(float(REQ.json()["main"]["temp"]))
        print("{}, {} °{}".format(CURRENT, TEMP, UNIT_KEY))
    else:
        print("Error: BAD HTTP STATUS CODE " + str(REQ.status_code))
except (ValueError, IOError):
    print("Error: Unable print the data")
