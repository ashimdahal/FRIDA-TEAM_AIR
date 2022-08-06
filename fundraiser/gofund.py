import requests
from bs4 import BeautifulSoup
import time


def funds():
    # link of the fundraiser source
    url = "https://www.gofundme.com/mvc.php?route=homepage_norma/search&term=climate%20change"
    
    # getting html content
    r = requests.get(url)
    HTMLcontent = r.content
    
    # creating html parser(creating soup)
    soup = BeautifulSoup(HTMLcontent, "html.parser")
    
    divs = soup.find_all("div", class_="cell grid-item small-6 medium-4 js-fund-tile")
    
    # list to collect details of a fund 
    funds=[]
    
    for div in divs:
        fund_link = div.find("a")['href']
        fund_location = div.find("div", class_="fund-item fund-location truncate-single-line").span.text
        fund_title = div.find("div", class_="fund-title truncate-single-line show-for-medium").text
        fund_info = div.find("div", class_='fund-item fund-description clamp mb')
        last_donation = div.find("div", class_="fund-item fund-activity truncate-single-line text-small").text
        fund_raise = div.find("div", class_="fund-item truncate-single-line").div.text
        fund_split = fund_raise.split()
        fund_reached = fund_split[0]
        fund_goal = fund_split[-1]
    
        # details extracted from the source
        fund_dict = {
            'Title': fund_title,
            'Link': fund_link,
            'Location': fund_location,
            'Detail': fund_info,
            'Last_Donation': last_donation.strip(),
            'Fund_Goal': fund_goal,
            'Fund_Reached': fund_reached
        }    

        # adding details dictionary to the list 
        funds.append(fund_dict)
        final_send=[]
       
        for i in funds:
            template={
            "Title":None,
            "Link":None,
            "Location":None,
            "Fund_Goal":None,
            "Last_Donation":None,
            "Fund_Reached":None
        }
            template['Title']=(i['Title'])
            template['Link']=(i['Link'])
            template['Location']=(i['Location'])
            template['Fund_Goal']=(i['Fund_Goal'])
            template['Last_Donation']=(i['Last_Donation'])
            template['Fund_Reached']=(i['Fund_Reached'])

            final_send.append(template)
        
    return final_send

