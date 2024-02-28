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
### Data Append
Due to their sizes, the 12 files have been uploaded to Google BigQuery into the dataset, "tripdata_2022".
A new table is created and the data appended, using the following [SQL query](https://github.com/KemanGstl/GDAC-Capstone-Project1/blob/main/tripdata_combining.sql).
A total of 5,667,717 rows have been combined.

### Data Cleaning
#### Familiarization
Data exploration allows me to get familiarized with the data set as well as previewing future data cleaning. I will scan through each column to better understand what is available to me for future analysis.

Considerations:

- No duplicates have been shown.

- There is the three categories of bicycles:
  1. Electric bikes
  2. Classic/Thermic bikes
  3. Docked bikes

- After checking for missing values, the following columns will see some rows removed during cleaning.
  - start_station_name
  - start_station_id
  - end_station_name
  - end_station_id
  - end_lat
  - end_lng

- I consider that casual riders do not speedrun between docking stations or go for trekking weekends with Cyclistics bicycles, therefore it can be concluded that the length of rides is minimum 2 minutes & maximum 1440 minutes (one day). The total number of rides falling in that category will be removed during cleaning.

- I consider the two types of riders (members or casuals) and check the number of trips per type.

Here is the [SQL query](https://github.com/KemanGstl/GDAC-Capstone-Project1/blob/main/tripdata_exploration.sql) running these considerations.

#### Cleaning
A new table with clean data is built, based on the schema of the appended data and the previous considerations. The SQL query can be found [here](https://github.com/KemanGstl/GDAC-Capstone-Project1/blob/main/tripdata_cleaning.sql).
Two columns have been added, "day" & "month", that will help analyse how casual riders and members behaviours differ.
After cleaning, the total number of rows, or trips, reaches 4,069,558.

## Analyse & Share
The analysis is done using Tableau Desktop with the data source connected to Google BigQuery, where all the preparation, data appending and cleaning has been done.
For ease of information access and reading, a dashboard is available on Tableau Public, [here](https://public.tableau.com/views/CyclisticCaseStudy-GoogleDataAnalysisCertification/Dashboard2?:language=en-GB&:sid=&:display_count=n&:origin=viz_share_link).

Again, I am trying to understand how casual riders and members differ in their usage of Cyclistic services.

Casual riders are represented with the shade of teal. Members are represented with the yellow-green.

#### Total Number of Rides:
- Casual riders took a total of 1,682,044 rides.
- Members took a total of 2,897,514 rides.
Members used the service significantly more than casual riders, with approximately 1.72 times more rides.

#### Average Ride Duration in Minutes:
- Casual riders had an average ride duration of 24:42 minutes.
- Members had a significantly shorter average ride duration of 13:25 minutes.
Casual riders tend to have almost double the ride duration of members, indicating they may use the service for longer, more leisurely rides.

![image](https://github.com/KemanGstl/GDAC-Capstone-Project1/assets/146002850/dedf3fa7-e365-44d5-8573-a626667d5f80)
![image](https://github.com/KemanGstl/GDAC-Capstone-Project1/assets/146002850/dd7305c2-c14b-42b6-ab1a-6650002dad69)


We can see on the following pie chart that over the total number of trips, the classic "thermal" bike is the most used at almost 60%. Followed by the electric bike.
The docked bike (taken & dropped at a docking station), amounts to less than 5% of trips. Additionally, only casual riders use docked bicycles.

#### Total Rides per Type of Bike:
- Classic Bikes: Casual riders 853,401 rides; Members 1,573,312 rides; 59.63% of total rides.
- Docked Bikes: Casual riders 171,580 rides; 4.22% of total rides.
- Electric Bikes: Casual riders 657,063 rides; Members 814,202; 36.15% of total rides.
Members prefer classic bikes significantly more than casual riders. However, casual riders use docked and electric bikes in a higher proportion compared to members.

![image](https://github.com/KemanGstl/GDAC-Capstone-Project1/assets/146002850/cc98430b-911e-4eca-a815-97f7a7baaf61) 
![image](https://github.com/KemanGstl/GDAC-Capstone-Project1/assets/146002850/31fce0a1-c88b-4537-adb0-095630f9a54d)

#### Frequency of Rides per Day:
- The frequency of rides by casual riders varies less throughout the week compared to members, with the highest numbers during the weekend.
- Members show a consistent pattern of usage during weekdays, with a dip on the weekends.
This suggests that members might be using the service for commuting purposes, whereas casual riders might be more inclined to use it for recreational purposes on weekends.

![image](https://github.com/KemanGstl/GDAC-Capstone-Project1/assets/146002850/545991f1-6d9f-44c3-b001-425ddc97c4bb)

#### Frequency of Rides per Month:
- There is a general increase in the number of rides during the warmer months (May through September) for both casual riders and members.
- Casual riders show a sharper increase in the summer months, suggesting a seasonal preference, possibly for recreational use.
- Members’ usage appears to be more evenly distributed throughout the year, although still higher in the summer months, indicating a more consistent usage possibly related to commuting.

![image](https://github.com/KemanGstl/GDAC-Capstone-Project1/assets/146002850/e86a97c5-7174-454d-b0e7-6a76ff472103)

#### Start and End Station Maps:
- The maps of start and end stations show a high concentration of usage in the central areas of the city for both casual riders and members.
- The end station map for casual riders has more spread in the outskirts, which might suggest more exploratory and leisure rides that end in different locations from the start stations.
- The start and end stations for members are more concentrated, which might indicate a more routine and predictable pattern of use, such as commuting to and from work.

![image](https://github.com/KemanGstl/GDAC-Capstone-Project1/assets/146002850/b60fe85b-e995-4913-8f8f-0cd6fc855e77)

#### Summary
In summary, members tend to use the service more frequently but for shorter durations, indicating regular, possibly commuting use. Casual riders use the service less frequently but for longer periods, suggesting more recreational or leisurely usage. The preference for bike types also differs, with members preferring classic bikes and casual riders using docked and electric bikes more frequently. Seasonality affects both types of riders, with an uptick in rides during the warmer months, but casual riders show a much more pronounced increase, indicating a potential seasonal usage pattern. Finally, spatial usage patterns suggest that members might have more routine routes compared to casual riders, who show more variability in their start and end locations.

## Act
Based on the identified differences between casual and member riders from the Cyclistic case study, here are several marketing strategies that could be employed to convert casual riders into members:
1. Membership Benefits for Longer Rides: Since casual riders tend to have longer ride durations, membership plans offering discounts on longer rides or unlimited ride time packages could be attractive.
2. Seasonal Promotions: Casual riders show a sharp increase in usage during the warmer months. Offering seasonal discounts or special summer memberships could capitalize on this trend.
3. Flexible Membership Plans: Offer a range of membership plans with varying degrees of flexibility, such as weekend-only memberships or off-peak hour memberships, which may appeal to the less frequent usage pattern of casual riders.
4. Trial Memberships: Offer a one-time trial membership that allows casual riders to experience the full benefits of being a member for a short period, such as a week or a month.
5. Rewards Program: Introduce a rewards program where casual riders can accumulate points for every ride, which can be redeemed for membership discounts or other perks.
