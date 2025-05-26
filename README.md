# Movie Recommendation Data Cleaning Project

## Overview

This project focuses on applying data cleaning concepts to a real movie recommendation dataset.  
The goal is to create a comprehensive pipeline from data cleaning, to analysis, and finally to building a dashboard and generating insights.

Currently, the project is at the **data cleaning stage**. The cleaned data will be used later for analysis and building a recommendation dashboard.

---

## Dataset Source

- The dataset is sourced from **Kaggle**: [Movie Recommendation System Dataset](https://www.kaggle.com/datasets/parasharmanas/movie-recommendation-system)  
- It is based on the **MovieLens** dataset, widely used in recommender system research.  
- The dataset contains movie metadata (`Movies` table) and user ratings (`Ratings` table).  
- It is real data reflecting actual movie ratings and metadata.

---

## Challenges in the Raw Data

- Duplicate movie entries (same movie appearing multiple times)  
- Multiple genres combined in a single column separated by `|`  
- Titles containing unwanted leading characters and spaces (like `"` or `$`)  
- Year of release embedded inside the title string  
- Need for normalization of genre information to separate tables for better analysis

---

## Data Cleaning Steps

The cleaning process is divided into the following main phases:

| Step Number | Description                                  | File Name                  |
|-------------|----------------------------------------------|----------------------------|
| 00          | Create the original tables and relationships | `00_Create_Tables.sql`      |
| 01          | Remove duplicate movie records and clean ratings | `01_Remove_Duplicates.sql`  |
| 02          | Clean movie titles by trimming spaces and removing unwanted characters | `02_Clean_Titles_and_Text.sql` |
| 03          | Extract release year from the movie title into a separate column | `03_Extract_Release_Year.sql` |
| 04          | Normalize genres: create separate genre table and linking table | `04_Normalize_Genres.sql`   |

---

## Tools and Environment

- SQL Server used for data storage and cleaning.  
- All cleaning steps performed with SQL queries.  
- Future plans include analysis and dashboard creation.

---

## Results After Cleaning

- Data structure improved from 2 tables to 4 tables (movies, ratings, genres, movie_genres)  
- Duplicate records removed ensuring clean and consistent data  
- Text cleaned to standardize movie titles  
- Year of release extracted for better filtering and analysis  
- Genre information normalized for accurate querying and reporting  
- Data is now ready for analysis and building recommendation dashboards

---

## Dataset Download

The dataset used in this project is publicly available and can be downloaded from Kaggle at the following link:  
[Movie Recommendation System Dataset on Kaggle](https://www.kaggle.com/datasets/parasharmanas/movie-recommendation-system)

**Please follow these steps to prepare the data:**

1. Download the dataset files from the Kaggle page.  
2. Extract the dataset files to a local folder accessible by your SQL Server.  
3. Use the original CSV files (or data files) as the source to load the `Movies` and `Ratings` tables.  
4. Run the provided SQL scripts in order (starting from `00_Create_Tables.sql`) to create tables and clean the data step by step.

**Note:** This project does **not** include the raw dataset files to keep the project size manageable and to respect data sharing policies.

---

## How to Use the SQL Scripts

To use the cleaning scripts provided in this project, follow these steps:

1. **Prepare your SQL environment:**  
   Make sure you have access to a SQL Server instance where you can create and manage databases.

2. **Create the database and tables:**  
   Start by running `00_Create_Tables.sql` to create the basic `Movies` and `Ratings` tables with their relationships.

3. **Load the raw data:**  
   Import the raw data from the original dataset files (CSV or others) into the `Movies` and `Ratings` tables.

4. **Run the cleaning scripts in order:**  
   Execute the scripts step by step in the following order to clean and organize the data:  
   - `01_Remove_Duplicates.sql`  
   - `02_Clean_Titles_and_Text.sql`  
   - `03_Extract_Release_Year.sql`  
   - `04_Normalize_Genres.sql`

5. **Verify the results after each step:**  
   Each script contains SELECT queries that help you inspect data before and after cleaning.  
   Use these to confirm the changes and understand the impact.

6. **Use the cleaned data for analysis or dashboard building:**  
   After finishing the cleaning steps, the data will be ready for further analysis or building recommendation dashboards.

---

## General Advice on Data Cleaning

> Data cleaning and organization is a crucial first step in any data project. Clean, well-structured data improves the accuracy of your analysis and the quality of insights you can generate. It helps prevent errors, ensures consistency, and makes downstream tasks like visualization or modeling much easier and more reliable.

---

## Usage and Contribution

- The cleaning scripts are provided for learning and reuse.  
- Users may use the cleaned dataset and scripts for their own analysis and projects.  
- **Important:** Please credit the original author of this cleaning pipeline if you use these scripts or cleaned data.  
- Direct copying and claiming the cleaning work as your own is **not allowed**.

---

## Future Work

- Perform detailed data analysis and visualization.  
- Build a recommendation dashboard based on cleaned data.  
- Possibly extend to building a recommendation system.
