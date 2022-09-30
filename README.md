# FinalProject_Team7
### Toronto Raptors Analysis
#### 2018-2019 NBA Champion
## Project Goal
The goal of this project is to analyze Raptors performance during their participation in the 2018 -2019 NBA Championship. The goal is to analyze their performance based on various parameters (i.e. ). We will also perform Machine Learning on this data. We hope to explore various ML models that predict the game outcome based on a variety of factors. We will use accuracy as the measure to determine which ML model would work best.

This analysis will also aid coaches, sponsors and players, in better understanding their teams performance based on variables outlined in the analysis.

## Questions we want to answer
In order for our analysis to be fruitful, we will focus on the following key questions:
 1. Win-Loss Percentage based on Away/Home (Team)
 2. Minutes Played vs Overall Score (Player)
 3. Attempts vs Made Shots Overall (Player or Team)
 4. Number of Assists vs Points Made Overall (Team)
 5. Number of Turnover vs Points Made Overall (Team)
 6. Overal Parameters vs Team Outcome - Key Parameters (i.e. Shots, Passes, Fouls, Turnover, etc.)

## Group communication protocols
- Regular communication through Slack Channel. This includes sharing information that we find online, code & arranging meetings.
- Overall tasks checklist. We basically split the task amongst ourselves and define deadlines for certain tasks. 

[Team's checklist/tracker](https://docs.google.com/spreadsheets/d/1rn7Is3dSXuilpRUV3Z6b2k_wwF7vTUsTR0i6NS5GKXs/edit#gid=0)

#### Team Responsibilities
- Triangle role - Claudia Martin - Machine learning
- X role - Falki Sabha - Presentation/Dashboard
- Square Role - Awalin Buttar - Github/Dashboard
- Circle Role - Gopinath Vasanthakumar - Database

## Getting started
  
## Exploratory Data

## Machine Learning
Using the Raptors 2018-2019 Championship season data set we hope to  explore different machine learning models. The models we hope to use include oversampling, undersampling and combination sampling algorithms. Additionally we hope to use Ensemble learners; in using these we hope to extract feature importance. Overall the algorithms we will use are:
- RandomOverSampler
- SMOTE
- ClusterCentroids
- SMOTEENN
- BalancedRandomForestClassifier
- EasyEnsembleClassifier

### Primary ML Goal:
We hope to evaluate the performance of each model and make recomendations based on which model is the most accurate at predicting game outcome.

### Basic Data Cleaning and Input/Output Selection
The columns present in the dataset that we will be using are featured in the figure below:

![columns in raptors_regulars.PNG](https://github.com/awalindeep/FinalProject_Team7/blob/Claudia-Martin/Resources/Images/columns%20in%20raptors_regulars.PNG)

From these columns we will exclude the TEAM, MATCHUP, and Score (+/-). The X features will be the remaining columns excluding that which will be our target. Our target coulmn will be y = "W/L", this represents the outcome of the match.

After the appropriate data cleaning (joining the regular season and playoff data, removing null and missing data, and dropping the appropriate columns) we will use the above describe X and y to split the data into training and testing data sets. Using these data sets the models listed above will be evaluated.

## Database
As outlined in the project goal, the team intends to use the 2018-2019 NBA Champion Toronto Raptors dataset available in Kaggle. Though the data size is small and can be handled as flat files for the analysis, the team formalized a data structure which could be scalable to accommodate any future data through a star schema with dimension tables around players and matchup teams and fact tables around game metrics at game and player level. Refer the below ERD for understanding of the data structure.
![ERD](https://github.com/awalindeep/FinalProject_Team7/blob/ffd828f26fdce12b23cbcd8a2eaaf32eec0c889f/Resources/Raptor_ERD_updated.png)

This data structure is considered to be a scalable model, with 
DIMENSION
- Players
- Teams 
- Regulars
- PlayOffs 

FACT
- RegularPlayers
- PlayoffsPlayers

A basic sanity cleansing activity was performed and certain vlookup functions were performed to establish new columns to have the schema outlined in the ERD. The team decide to ingest the cleaned data for the analysis into SQL database rather than handling them as flat files. We intend to move the data into a PostgreSQL database and create tables as per the ERD for further analysis. 

The csv files were cleansed for basic sanity and some formatting changes to the columns, the database and tables were created as per the sql file below inline with the ERD.
![schema.sql](https://github.com/awalindeep/FinalProject_Team7/blob/ffd828f26fdce12b23cbcd8a2eaaf32eec0c889f/Resources/raptors_schema.sql)

The csv's were then imported into the respective tables and the below image outlines the records in the relevant tables
![Data_ingestion](https://github.com/awalindeep/FinalProject_Team7/blob/ffd828f26fdce12b23cbcd8a2eaaf32eec0c889f/Resources/Raptors_DB_Data%20Ingestion.png)

## Project dashboard


## Conclusion


## Resources
[![click](https://github.com/awalindeep/FinalProject_Team7/blob/Awalin-buttar/Resources/click.png)](https://github.com/awalindeep/FinalProject_Team7/tree/AwalinGHMAIN/Resources)

## Presentation
[![click](https://github.com/awalindeep/FinalProject_Team7/blob/Awalin-buttar/Resources/click.png)](https://docs.google.com/presentation/d/1Zr4hH1fCiVoQane84CiFByj1gcuTspphzM_FtJ9em2I/edit#slide=id.p)
