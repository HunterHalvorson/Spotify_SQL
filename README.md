# Spotify Data Analysis - SQL Project

A comprehensive SQL analysis project exploring Spotify track data using PostgreSQL. This project demonstrates exploratory data analysis (EDA) techniques and progressively complex SQL queries ranging from basic to advanced levels.

## 📊 Project Overview

This project analyzes a Spotify dataset containing information about tracks, artists, albums, and various audio features. The analysis includes track metrics like danceability, energy, streams, views, likes, and more.

## 🗄️ Database Schema

The project uses a single table `spotify` with the following structure:
```sql
- artist (VARCHAR)
- track (VARCHAR)
- album (VARCHAR)
- album_type (VARCHAR)
- danceability (FLOAT)
- energy (FLOAT)
- loudness (FLOAT)
- speechiness (FLOAT)
- acousticness (FLOAT)
- instrumentalness (FLOAT)
- liveness (FLOAT)
- valence (FLOAT)
- tempo (FLOAT)
- duration_min (FLOAT)
- title (VARCHAR)
- channel (VARCHAR)
- views (FLOAT)
- likes (BIGINT)
- comments (BIGINT)
- licensed (BOOLEAN)
- official_video (BOOLEAN)
- stream (BIGINT)
- energy_liveness (FLOAT)
- most_played_on (VARCHAR)
```

## 🛠️ Technology Used

- **Database**: PostgreSQL
- **SQL Tools**: pgAdmin 4
- **SQL Features**: 
  - Aggregate Functions
  - GROUP BY & ORDER BY
  - Window Functions (DENSE_RANK, PARTITION BY)
  - CTEs (Common Table Expressions)
  - Subqueries
  - CASE statements
  - COALESCE function

## 📈 Analysis Categories

### Exploratory Data Analysis (EDA)
- Total record count
- Distinct artists and albums
- Album type distribution
- Track duration statistics
- Data cleaning (removing invalid records)
- Channel and platform analysis

### Easy Level Queries (Q1-Q5)
1. Tracks with over 1 billion streams
2. Album-artist relationships
3. Total comments for licensed tracks
4. Single album type tracks
5. Track count per artist

### Medium Level Queries (Q6-Q10)
6. Average danceability by album
7. Top 5 highest energy tracks
8. Views and likes for official videos
9. Total views per album
10. Tracks streamed more on Spotify than YouTube

### Advanced Level Queries (Q11-Q13)
11. Top 3 most viewed tracks per artist (Window Functions)
12. Tracks with above-average liveness scores
13. Energy value differences per album (CTEs)

## 🚀 Getting Started

### Prerequisites
- PostgreSQL installed on your system
- pgAdmin 4
- Basic understanding of SQL

### Setup Instructions

1. **Open pgAdmin 4**
   - Launch pgAdmin and connect to your PostgreSQL server

2. **Create the Database**
   - Right-click on "Databases"
   - Select "Create" > "Database"
   - Name it `spotifyDB`
   - Click "Save"

3. **Create the Table**
   - Open the Query Tool (right-click on `spotifyDB` > "Query Tool")
   - Run the table creation script from `spotify_analysis.sql`

4. **Import the Dataset**
   - Right-click on the `spotify` table
   - Select "Import/Export Data"
   - Choose the `data/cleaned_dataset.csv` file
   - Configure import options:
     - Format: CSV
     - Header: Yes
     - Delimiter: `,`
     - Quote: `"`
     - Escape: `"`
   - Click "OK" to import

5. **Run Analysis Queries**
   - Open the Query Tool
   - Execute queries from `spotify_analysis.sql` to perform analysis

## 📝 Key Insights

The queries in this project help answer questions such as:
- Which tracks are most popular globally?
- How do audio features vary across albums?
- Which artists have the most content?
- What's the relationship between Spotify and YouTube streaming?
- Which tracks have the highest engagement metrics?

## 🔍 Notable Query Techniques

- **Window Functions**: Used for ranking tracks within artist partitions
- **CTEs**: Employed for calculating energy differentials
- **Conditional Aggregation**: CASE statements for platform-specific stream counts
- **COALESCE**: Handling NULL values in aggregations
- **Subqueries**: Finding tracks above average metrics

## 📂 Project Structure
```
.
├── data/
│   └── cleaned_dataset.csv     # Cleaned Spotify dataset
├── spotify_analysis.sql        # Main SQL file with all queries
└── README.md                   # Project documentation
```

## 📧 Contact

For questions or feedback about this project, please open an issue in the repository.

---

**Note**: This project is for educational purposes demonstrating SQL analysis capabilities on music streaming data.# Spotify_SQL
