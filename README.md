# Google Data Analytics Case Study: Cyclistic bike-share analysis

from the [capstone project](https://www.coursera.org/learn/google-data-analytics-capstone).
I will be performing multiple real-tasks of a junior data analyst at the fictional company, Cyclistic.

## Company & Scenario

Cyclistic, launched in 2016, operates a bike-share program in Chicago with over 5,800 bicycles and 692 stations. Initially targeting a broad customer base with various pricing plans, the company distinguishes between casual riders (using single-ride or full-day passes) and members (with annual memberships). Financial analysis revealed that members are more profitable than casual riders. The marketing head, Moreno, aims to grow the business by converting casual riders into members. To achieve this, Moreno’s team plans to analyze historical bike trip data to understand the differences between the two user groups and tailor their marketing strategies accordingly.

Three questions will guide the future marketing program:
1. How do annual members and casual riders use Cyclistic bikes diferently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

I am tasked to answer the first question: How do annual members and casual riders use Cyclistic bikes differently?
In order to answer the question, I will be following the data analysis process: Ask, Prepare, Process, Analyse, Share & Act.

## Ask

I am trying to analyse the behavior of casual riders (single-ride or full-day passes) and members (annual membership). What distinguishes both types (behaviors, preferences, patterns...).
These insights will help targeting the marketing campain to convert casual riders into members.

Busines task: Build an efficient marketing strategy to convert casuals into members.

My task: Analyse available data to understand how casual riders and members differ in their usage of Cyclistic services.

## Prepare

The Cyclistic trip data is available [here](https://divvy-tripdata.s3.amazonaws.com/index.html) and was made available by Motivate International Inc. under this [licence](https://divvybikes.com/data-license-agreement).

I will be working with the datasets for each month of 2022, from January to December.
A total of 12 files are picked from the data source, with the following name format "yyyymm-divy-tripdata". The name format will change during upload as BigQuery does not allow dataset/table names to start with number, the new format is the following: "tripdata_yyyymm".
Each file contains the following column names:
- ride_id
- rideable_type
- started_at
- ended_at
- start_station_name
- start_station_id
- end_station_name
- end_station_id
- start_lat
- start_lng
- end_lat
- end_lng
- member_casual

## Process
### Data combination
Due to their sizes, the 12 files have been uploaded to Google BigQuery into the dataset, "tripdata_2022".
A new table is created and the data appended, using the following [SQL query](https://github.com/KemanGstl/GDAC-Capstone-Project1/blob/main/tripdata_combining.sql).
A total of 5,667,717 rows have been combined.

### Data Exploration
Data exploration allows me to get familiarized with the data set as well as previewing future data cleaning. I will scan through each column to better understand what is available to me for future analysis.

Considerations:

No duplicates have been shown.

There is three categories of bicycles:
1. Electric bikes
2. Classic/Thermic bikes
3. Docked bikes

After checking for missing values, the following columns will see some rows removed during cleaning.
- start_station_name
- start_station_id
- end_station_name
- end_station_id
- end_lat
- end_lng

I consider that casual riders do not speedrun between docking stations or go for trekking weekends with Cyclistics bicycles, therefore it can be concluded that the length of rides is minimum 2 minutes & maximum 1440 minutes (one day). The total number of rides falling in that category will be removed during cleaning.

I consider the two types of riders (members or casuals) and check the number of trips per type.

Here is the [SQL query](https://github.com/KemanGstl/GDAC-Capstone-Project1/blob/main/tripdata_exploration.sql) running these considerations.



