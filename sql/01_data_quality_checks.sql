/*
PHASE 1: DATA UNDERSTANDING & DATA QUALITY CHECKS

Objective:
Understand the structure, completeness, and quality of the Spotify dataset before performing any business analysis.

Business Value:
Data quality checks help ensure that all downstream analysis and recommendations are based on reliable and accurate data.

Analysis Covered:

Dataset size
Unique entities
Duplicate records
Missing values
Album type distribution

=========================================================
*/


/*
Q1. How many records are present?

Business Question:
How many observations are available for analysis?

Why it Matters:
Provides an understanding of dataset size and analytical scope.
*/

SELECT COUNT(*) AS total_records
FROM spotify;

/*
Q2. How many unique artists, albums, and tracks exist?

Business Question:
How diverse is the music catalog represented in the dataset?

Why it Matters:
Helps understand catalog coverage and artist representation.
*/

SELECT
    COUNT(DISTINCT artist) AS artists,
    COUNT(DISTINCT album) AS albums,
    COUNT(DISTINCT track) AS tracks
FROM spotify;

/*

## Q3. Are there any duplicate records?

Business Question:
Are the same artist-track combinations appearing multiple times?

Why it Matters:
Duplicate records can distort KPIs and analytical findings.
*/

SELECT
    artist,
    track,
    COUNT(*) AS duplicate_count
FROM spotify
GROUP BY artist, track
HAVING COUNT(*) > 1;

/*

## Q4. Are there missing values in key fields?

Business Question:
Are critical fields such as artist, track, streams, or views incomplete?

Why it Matters:
Missing values can impact analysis accuracy and reporting.
*/

SELECT
    SUM(CASE WHEN artist IS NULL THEN 1 ELSE 0 END) AS artist_nulls,
    SUM(CASE WHEN track IS NULL THEN 1 ELSE 0 END) AS track_nulls,
    SUM(CASE WHEN stream IS NULL THEN 1 ELSE 0 END) AS stream_nulls,
    SUM(CASE WHEN views IS NULL THEN 1 ELSE 0 END) AS views_nulls
FROM spotify;

/*

## Q5. What is the distribution of tracks by album type?

Business Question:
How is the catalog divided between albums, singles, and compilations?

Why it Matters:
Provides context for later content strategy analysis.
*/

SELECT
    album_type,
    COUNT(*) AS total_tracks
FROM spotify
GROUP BY album_type;