/*
=========================================================
PHASE 6: ADVANCED SQL ANALYSIS
=========================================================

Objective:
Demonstrate advanced SQL techniques including window functions, ranking, and market-share calculations.

Business Value:
Provides deeper insights beyond basic aggregation analysis.

=========================================================
*/

---Q24. Top 3 Tracks Per Artist
/*
Business Question:
What are the top performing tracks for each artist?

Why it Matters:
Helps identify each artist's strongest content.
*/

WITH ranked_tracks AS
(
    SELECT
        artist,
        track,
        stream,
        ROW_NUMBER() OVER(
            PARTITION BY artist
            ORDER BY stream DESC
        ) rn
    FROM spotify
)
SELECT *
FROM ranked_tracks
WHERE rn <= 3;

--- Q25. Artist Market Share
/*
Business Question:
How much of total platform streams does each artist contribute?

Why it Matters:
Measures artist contribution and market concentration.
*/

WITH artist_streams AS
(
    SELECT
        artist,
        SUM(stream) streams
    FROM spotify
    GROUP BY artist
)
SELECT
    artist,
    streams,
    ROUND(
        streams*100.0/
        SUM(streams) OVER(),
        2
    ) market_share
FROM artist_streams
ORDER BY streams DESC;