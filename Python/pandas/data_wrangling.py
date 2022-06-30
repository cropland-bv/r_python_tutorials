
import pandas as pd


# read html files to data frames
happiness_report_2020 = pd.read_html("happiness_2020.html", encoding="utf-8")[0]
happiness_report_2019 = pd.read_html("happiness_2019.html", encoding="utf-8")[0]

# create year column
happiness_report_2020["Jaar"] = 2020
happiness_report_2019["Jaar"] = 2019

# rename columns
happiness_report_2020.columns = ["Positie", "Land", "Punten", "Jaar"]
happiness_report_2019.columns = ["Positie", "Land", "Punten", "Jaar"]

# concatenate the two dataframes
happiness_reports = pd.concat([happiness_report_2020, happiness_report_2019])

# Best position for Belgium
happiness_reports[happiness_reports['Land'] == "België"].agg({'Positie' : ['min']})

# Average score for Finland
happiness_reports[happiness_reports['Land'] == "Finland"].agg({'Punten': ['mean']})

# write dataframe to CSV
happiness_reports.to_csv('happiness_reports.csv')
