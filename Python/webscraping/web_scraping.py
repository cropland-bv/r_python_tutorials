
import requests
from bs4 import BeautifulSoup


# make api request to get html content
page = requests.get("https://nl.wikipedia.org/wiki/World_Happiness_Report")
page.status_code

# create a beautifulsoup object
soup = BeautifulSoup(page.content, 'html.parser')

# print the html content in a prettified format
print(soup.prettify())

# find all instances of the table tag
tables = soup.find_all("table")

# split up happiness reports
happiness_report_2020 = tables[0]
happiness_report_2019 = tables[1]

# write results to html files
with open("happiness_2020.html", "w") as file:
    file.write(str(happiness_report_2020))

with open("happiness_2019.html", "w") as file:
    file.write(str(happiness_report_2019))

