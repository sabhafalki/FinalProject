# FinalProject_Team7
### Toronto Raptors Analysis
#### 2018-2019 NBA Champion
## Project Goal
The goal of this project is to analyze Raptors performance during their participation in the 2018 -2019 NBA Championship. The goal is to analyze their performance based on various parameters (i.e. Shots, Passes, Fouls, Turnover, etc.). We will also perform Machine Learning on this data. We hope to explore various ML models that predict the game outcome based on a variety of factors. We will use accuracy as the measure to determine which ML model would work best.

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

### Week 2 ML: Building the ML Code

The ML analysis that was completed can be found in the notebook below:

[Raptors_Resampling_ML.ipynb](https://github.com/awalindeep/FinalProject_Team7/blob/Claudia-Martin/Machine%20Learning%20Analysis/Raptors_Resampling_ML.ipynb)

The following steps were followed in to complete the ML analysis:

1) Preliminiary data preprocessing

   During this stage two datasets were joined. Team match data for the regular and playoff season was avaliable; this data was loaded into Jupyter notebook and was the concatenated togather as they had identical column headers.

   To prepare the data for the ML algorithms columns that were not going to be used were dropped, the target column was converted to an integer datatype and any null data was also dropped.

   - From the Columns in the figure above Four columns were excluded: DATE, TEAM, MATCHUP, and Score (+/-). These columns included data that we believed would not be helpful to include in the ML algorithms. The DATE column gave us the date for each game which would be different for each data point and different between seasons. The TEAM column was redundant and stated that each data point was for a Raptor's game. The MATCHUP column told us the team the Raptors were playing against. Finally, the +/- column gave a metric of how much the Raptors won or lost by; we felt this had no predictive value.
   - It is possible that both the DATE and MATCHUP columns could provide some predicitve value if we look at performance for say a particular month or against a particular team however we belive this would require more data from other seasons as having only one seasons data limits the usability of this data within a ML model.

   - The target column for this analysis was the W/L column; this told us if the Raptors had won or lost that game. We hope to see which model could most accuratly predict if the Raptors would win or loose a game. This column was initially an object datatype. This was converted into an integer where W = 0 and L = 1.

   - Finally, The data was then checked for null values; any null values were dropped.

2) Preliminary Feature Selection

   As stated above the desired columns/features had already been retained and the target column had been selected.

   The features were created:

   ![Features Created.PNG](https://github.com/awalindeep/FinalProject_Team7/blob/Claudia-Martin/Resources/Images/Features%20Created.PNG)

   The target was selected:

   ![Target Selected.PNG](https://github.com/awalindeep/FinalProject_Team7/blob/Claudia-Martin/Resources/Images/Target%20Selected.PNG)

3) Splitting the Data to training and testing sets

   The sklearn.model_selection train_test_split was then used to split the data. The default test and train size was used meaning the test size was set to 0.25 and the train size then automatically complemented that.

4) Model Choice

   For this analysis we wanted to evaluate different models to see which would be the most accurate at predicting Wins vs Losses. The benefit of this is that we hope to be able to extract the most accurate model by looking at many models as opposed to only trying one and hoping that it was the best one. The limitation of this is that since we are considering accuracy as the measure of which model is best, it is possible we miss considereing the precision and sensitivity (recall) of each model, and how this may better represent whether the model is good or not.

   With the current analysis the best ML algorithm based on accuracy is the Easy Ensemble AdaBoost Classifier with a balanced accuracy score of 86.7%. 

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

[schema.sql](https://github.com/awalindeep/FinalProject_Team7/blob/ffd828f26fdce12b23cbcd8a2eaaf32eec0c889f/Resources/raptors_schema.sql)

The csv's were then imported into the respective tables and the below image outlines the records in the relevant tables

![Data_ingestion](https://github.com/awalindeep/FinalProject_Team7/blob/ffd828f26fdce12b23cbcd8a2eaaf32eec0c889f/Resources/Raptors_DB_Data%20Ingestion.png)

## Project Dashboard
The Toronto Raptors 2018-2019 NBA Championship visualization is done by using Tableau to create Dashboards. We are also using Tableau Prep Builder tool to design,prepare data easy and intuitives. To create a Data Visualization, have to go through a process which includes Select questions, Execute independent research, Craft Tableau story and Create a written analysis. Finally, publishing the storyboard in Tableau website with the visual representation of the Questions we want to answer. The Tableau storyboard is published which can be viewed by the Team, Coach and so on. The link to the website is added below.


## Conclusion ##
To conclude, the 2018-2019 NBA Champion Toronto Raptors data represents different measures that help us to perdict and analyze player's and team's performance based on  various parmeters(i.e. Shots, Passes, Fouls, Turnover, etc.). The following are the outcomes results of this analysis:
- The match's played in home have more win's then Away, weather it is Regular or Playoff.
- Either it is Home/Away, Kawhi Leonard is the best player to score more points to win the Champship.
- Pascal Siakam is the player with high Field Goal percentage, with high rate of wins in this season. 

## Resources
[![click](https://github.com/awalindeep/FinalProject_Team7/blob/Awalin-buttar/Resources/click.png)](https://github.com/awalindeep/FinalProject_Team7/tree/AwalinGHMAIN/Resources)

## Presentation
[![click](https://github.com/awalindeep/FinalProject_Team7/blob/Awalin-buttar/Resources/click.png)](https://docs.google.com/presentation/d/1Zr4hH1fCiVoQane84CiFByj1gcuTspphzM_FtJ9em2I/edit#slide=id.p)

## Storyboard
Player's Storyboard <br>
[![click](https://github.com/awalindeep/FinalProject_Team7/blob/Awalin-buttar/Resources/click.png)](https://public.tableau.com/app/profile/falki.sabha/viz/PlayerDashboard_16651306173910/Story1) <br><br>
Team Storyboard <br>
[![click](https://github.com/awalindeep/FinalProject_Team7/blob/Awalin-buttar/Resources/click.png)](https://public.tableau.com/app/profile/falki.sabha/viz/RaptorsTeam/RaptorsTeam)
