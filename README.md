
# Frida
> A one-stop solution to all your climate action needs which predicts landslides, and flood events, and provides news summary, fundraising, and upcoming events alerts on climate change.

<p align="center">
    <img src="/images/Frida_Cover.png")
</p>

## Table of Content
* [General info](#general-info)
* [Technologies](#technologies)
* [Glimpse](#glimpse)
* [How to Run](#how-to-run)
* [Why Name Frida?](#why-name-frida)
* [Features](#features)
* [Contributors](#contributors)
    
## General info
Every year, heavy rainfall continues to affect most districts of Nepal causing floods, triggering landslides leading to a huge number of deaths of innocents and heavy damage in the property. According to Nepal Disaster Risk Reduction Portal(NDRR), over 39 landslides and 16 floods were reported just in the first week of July 2021. According to the report, a total of 38 people died and 51 were injured within that time. More than 1250 people had been evacuated, 5100 displaced and a total of 790 houses were destroyed. <br><br>
This is only the statistics for a week, and when we go throughout the whole monsoon season the damage is even harsher. Therefore, we created Frida, with the aim to tackle this problem and reduce the impact by half or even more. As monsoon rainfall mostly has a localized impact, search and rescue operations are often delayed because of harsh weather conditions, and considering the fact that rescuing after a disaster is not the best solution, we created Frida; a system that can predict flood and landslides events before they even happen. With advanced deep learning and data analytics tools at its heart, Frida uses past weather and calamities data to make predictions with 99.9% validation accuracy and 0.0012 validation loss.<br><br> The goal of Frida is not only to act as an alert system but be a one-stop solution for all climate action needs. Frida scrapes the web/google news to provide a summary of all international news from portals like The New York Times, The Washington Post, and much more related to climate change topics. On top of that, Frida also scrapes Nepali news portals like OnlineKhabar, and Setopati to bring the users local news on climate change. Frida also scrapes online events manager social media handle meetups to filter out any upcoming climate change-related events near the user and if the user is feeling generous, Frida would also scrape fundraising campaigns related to climate change. On top of that, Frida would be the last application the user would need to get weather updates with a personalized message surrounding the weather forecast sent daily to the user.


## Technologies
With the implementation of principles of machine learning and deep learning, to predict the landslides and floods nearby, and statistical analysis of weather-map data, Frida is an application fully powered by Firebase at the backend, presented in dart flutter and served in “.apk” format. Though the code and structuring in the backend may look complex, the app is designed such that users won’t have trouble accessing the features. UI is as simple and intuitive as possible.

   
<p align="left">
    <a href="https://pytorch.org/" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/pytorch-EE4C2C?style=for-the-badge&logo=PyTorch&logoColor=white" />
    </a>
    <a href="https://www.python.org" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue"
            alt="python" />
    </a>
    <a href="http://flutter.dev/" target="_blank" rel="noreferrer"> <img
            src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"
            alt="flutter" />
    </a>
    <a href=https://dart.dev/" target="_blank" rel="noreferrer"> <img
            src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="dart" />
    </a>                                                                                                        
    <a href="https://pandas.pydata.org/" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/pandas-150458?style=for-the-badge&logo=pandas&logoColor=white" alt="pandas"/>
    </a>
    <a href="https://www.figma.com/" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white"  alt="figma"/>
    </a>    
    <a href="https://fastapi.tiangolo.com/" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/Fastapi-009688?style=for-the-badge&logo=fastapi&logoColor=white"  alt="fastapi"/>
    </a>
    <a href="https://www.uvicorn.org/" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/uvicorn-499848?style=for-the-badge&logo=uvicorn&logoColor=white"  alt="uvicorn"/>
    </a>
    <a href="https://www.nltk.org//" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/nltk-595F69?style=for-the-badge&logo=nltk&logoColor=white"  alt="nltk"/>
    </a>
    <a href="https://newspaper.readthedocs.io/en/latest//" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/newspaper3k-4473C5?style=for-the-badge&logo=newspaper3kpython&logoColor=white"  alt="newspaper3k"/>
    </a>
    <a href="https://numpy.org/" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/numpy-013243?style=for-the-badge&logo=numpy&logoColor=white"  alt="numpy"/>
    </a>
    <a href="https://matplotlib.org/" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/matplotlib-EE4C2C?style=for-the-badge&logo=matPlotLib&logoColor=white"  alt="matplotlib"/>
    </a>
    <a href="https://www.crummy.com/software/BeautifulSoup/bs4/doc//" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/beautiful%20soup-3D3D3D?style=for-the-badge&logo=beautifulSoup4&logoColor=white"  alt="bs4"/>
    </a>
    <a href="https://www.sqlite.org/index.html" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/sqlite3-003B57?style=for-the-badge&logo=sqlite&logoColor=white"  alt="sqlite3"/>
    </a>
    <a href="https://scrapy.org/" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/scrapy-5FA839?style=for-the-badge&logo=scrapy&logoColor=white"  alt="scrapy"/>
    </a>
    <a href="https://firebase.google.com/" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=white"  alt="firebase"/>
    </a>
    <a href="https://openweathermap.org/api" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/openweathermap-003B57?style=for-the-badge&logo=openweathermap&logoColor=white"  alt="open weather app"/>
    </a>                                                                                                                  
    <a href="https://colab.research.google.com/" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/google%20colab-F9AB00?style=for-the-badge&logo=googlecolab&logoColor=white"  alt="google colab"/>
    </a>
</p>

                                                                                                                                              
## Glimpse
<p align="left">
    <img src="/images/screenshot/glimpse 1.jpg"  alt="screeshot" width="216" height="420"/>&nbsp;&nbsp;
    <img src="/images/screenshot/glimpse 2.jpg"  alt="screeshot" width="216" height="420"/>&nbsp;&nbsp;
    <img src="/images/screenshot/glimpse 3.jpg"  alt="screeshot" width="216" height="420"/>&nbsp;&nbsp;
    <img src="/images/screenshot/glimpse 4.jpg"  alt="screeshot" width="216" height="420"/>&nbsp;&nbsp;
    <img src="/images/screenshot/glimpse 5.jpg"  alt="screeshot" width="216" height="420"/>&nbsp;&nbsp;
    <img src="/images/screenshot/glimpse 6.jpg"  alt="screeshot" width="216" height="420"/>&nbsp;&nbsp;
    <img src="/images/screenshot/glimpse 7.jpg"  alt="screeshot" width="216" height="420"/>&nbsp;&nbsp; 
    
</p>
### Note: We Couldn't build as big app as we wanted due to limited space on free servers. Also, we were unable to deploy landslides detection model on app because  pytorch required 700 MB space which was not available to us. Still the model, its data generation and data analysics can be viewed on the jupyter notebook on the [landslide](/landslides) repo. time constraint was also a factor to built a dataset from ground up and train excellent model in it


                                                                                                                                              
## How to Run
You can simply get started by cloning this repository, and installing the dependencies.
```
git clone https://github.com/ashimdahal/FRIDA-TEAM_AIR-KU-hackfest.git
pip install -r requirements.py
```
You have to take a key to run through the application, signup to [OpenWeatherApp](https://home.openweathermap.org/users/sign_up) and get you access key.

To edit source code, go to the locations listed in [Git Ignore](/.gitignore) and add the key that was made earlier.
                                                                                                                                              
## Why Name Frida?
Frida is a 13 years Golden Labrador Retriever rescue dog in the Mexican Navy who spent her life helping rescue survivors worldwide in the wake of natural disasters. Frida has helped save the lives of many people during massive natural disasters, like the 2010 Haiti earthquake, and the 2012 Guatemala landslides. The pup became a household name in the aftermath of a deadly earthquake in Mexico in 2017 when was credited for finding over a dozen people alive over her storied career. <br><br>
As the main goal of the application is to alert people about the natural disaster like landslides and floods nearby and potentially save their life, we as a team decided to name the application on the salutation of such a hero who had dedicated her whole life to saving humans who were impacted in massive disasters.


## Features
Following are the features of Frida
* Personalized messages dictated by weather forecast sent on a daily basis
* Alerts the user about the Flood and Landslide disaster, using deep learning algorithms, that may take place nearby
* Latest English and Nepali news on climate action and changes along with its summary
* Notifies user about the events happening nearby and also allows to organize an event relating to climate action and environment
* Informs on various fundraiser activitities related to climate action

                                                                                                                                  
## Contributors
<div align="center">
<a href="https://github.com/ashimdahal" target="_blank" rel="noreferrer">
    <img src="/images/Ashim%20Dahal.png" width="161" height="185"/>
</a>
<a href="https://github.com/prabeshPP" target="_blank" rel="noreferrer">
    <img src="images/Prabesh%20Bista.png" width="161" height="185"/>
</a>
<span>
<a href="https://github.com/Anuj-Khadka" target="_blank" rel="noreferrer" >
    <img src="/images/Anuj Khadka.png" width="161" height="185"/>
</a>
<a href="https://github.com/kbshal" target="_blank" rel="noreferrer">
    <img src="/images/Bishal%20Kharal.png" width="161" height="185"/>
</a>                                                                  
<a href="https://github.com/dev-hari" target="_blank" rel="noreferrer">
    <img src="images/Hari%20Paudyal.png" width="161" height="185"/>
</a>  
    
</div>                                                                                                                         

                                                                 
---
                                                                 
                                                                 
## Special Thanks to Organizers:
<p align="left">
    <a href="https://ku.edu.np/" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/kathmandu%20university%20Computer%20Club-4C5176?style=for-the-badge&logo=KU&logoColor=white&labelcolor=AAAAAA" />
    </a>
    <a href="https://mlh.io/" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/major%20league%20hacking-265A8F?style=for-the-badge&logo=mlh&logoColor=white" />
    </a>   
    <a href="https://devfolio.co/" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/devfolio-356CF7?style=for-the-badge&logo=devfolio&logoColor=white" />
    </a>
    <a href="https://www.digitalocean.com/" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/digital%20oceal-0080FF?style=for-the-badge&logo=digitalOcean&logoColor=white" />
    </a>
    <a href="https://github.com/" target="_blank" rel="noreferrer">
        <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white" />
    </a>
</p>
                                                                                                             

## Repo Details
 <p align="left">
    <img src="https://img.shields.io/github/contributors/ashimdahal/FRIDA-TEAM_AIR-KU-hackfest?style=for-the-badge" />
    <img src="https://img.shields.io/github/last-commit/ashimdahal/FRIDA-TEAM_AIR-KU-hackfest?style=for-the-badge" />
    <img src="https://img.shields.io/github/forks/ashimdahal/FRIDA-TEAM_AIR-KU-hackfest?style=for-the-badge" />
    <img src="https://img.shields.io/github/issues/ashimdahal/FRIDA-TEAM_AIR-KU-hackfest?style=for-the-badge" />
    <img src="https://img.shields.io/github/issues-pr-closed/ashimdahal/FRIDA-TEAM_AIR-KU-hackfest?style=for-the-badge" />
    <img src="https://img.shields.io/github/commit-activity/w/ashimdahal/FRIDA-TEAM_AIR-KU-hackfest?style=for-the-badge" />                                                                                                               
</p>
    
    
                                                                                                            
                                                                                                            
                                                                                                                            
    
    
    
