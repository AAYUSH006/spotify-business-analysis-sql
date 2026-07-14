/*
=========================================================
PHASE 7: BUSINESS ANALYSIS & STRATEGIC RECOMMENDATIONS
=========================================================

Objective:
Answer high-impact business questions that can influence content strategy, marketing, and artist investment decisions.

Business Value:
Translate data into actionable recommendations.

=========================================================
*/

---Q27. Which artists have high engagement but low streams?
/*
Business Question:
Which artists have strong engagement but below-average streams?

Why it Matters:
May indicate artists with untapped growth potential.
*/

WITH artist_metrics AS (
    SELECT
        artist,
        SUM(stream) AS total_streams,
        SUM(likes + comments) AS engagement
    FROM spotify
    GROUP BY artist
)

SELECT *
FROM artist_metrics
WHERE total_streams <
      (SELECT AVG(total_streams) FROM artist_metrics)
AND engagement >
      (SELECT AVG(engagement) FROM artist_metrics)
ORDER BY engagement DESC;

---Q28. Which tracks have high views but low stream conversion?
/*
Business Question:
Which tracks receive high visibility but poor stream conversion?

Why it Matters:
Helps identify content that fails to retain listener interest.
*/

WITH track_metrics AS (
    SELECT
        track,
        artist,
        views,
        stream,
        ROUND(stream * 100.0 / views,2) AS conversion_rate
    FROM spotify
    WHERE views > 0
)

SELECT *
FROM track_metrics
WHERE views >
      (SELECT AVG(views) FROM spotify)
AND conversion_rate <
      (SELECT AVG(stream * 100.0 / views)
       FROM spotify
       WHERE views > 0)
ORDER BY views DESC;

--- Q29. What audio profile do top 10% streamed songs share?
/*
Business Question:
What audio characteristics do top-performing songs share?

Why it Matters:
Can help identify the blueprint of successful content.
*/

WITH ranked_tracks AS (
    SELECT *,
           NTILE(10) OVER(ORDER BY stream DESC) AS decile
    FROM spotify
)

SELECT
    ROUND(AVG(danceability),2) AS avg_danceability,
    ROUND(AVG(energy),2) AS avg_energy,
    ROUND(AVG(valence),2) AS avg_valence,
    ROUND(AVG(tempo),2) AS avg_tempo,
    ROUND(AVG(duration_min),2) AS avg_duration
FROM ranked_tracks
WHERE decile = 1;

---Q30. Which artists consistently deliver successful tracks?
/*
Business Question:
Which artists consistently deliver successful tracks?

Why it Matters:
Supports long-term artist investment decisions.
*/

WITH artist_stats AS (
    SELECT
        artist,
        COUNT(*) AS total_tracks,
        AVG(stream) AS avg_streams,
        STDEV(stream) AS stream_variation
    FROM spotify
    GROUP BY artist
)

SELECT *
FROM artist_stats
WHERE total_tracks >= 5
ORDER BY avg_streams DESC,
         stream_variation ASC;

---Q31. Which channels are best for acquiring listeners?
/*
Business Question:
Which channels are most effective for acquiring listeners?

Why it Matters:
Helps optimize marketing and distribution efforts.
*/
	
SELECT
    channel,
    SUM(views) AS total_views,
    SUM(stream) AS total_streams,
    ROUND(
        SUM(stream) * 100.0 /
        SUM(views),
        2
    ) AS conversion_rate
FROM spotify
WHERE views > 0
GROUP BY channel
ORDER BY conversion_rate DESC;

---Q32. Which album type should Spotify promote more aggressively?
/*
Business Question:
Which album type should receive greater promotional focus?

Why it Matters:
Supports content strategy and release planning.
*/

SELECT
    album_type,
    COUNT(*) AS tracks,
    ROUND(AVG(stream),0) AS avg_streams,
    ROUND(AVG(likes + comments),0) AS avg_engagement
FROM spotify
GROUP BY album_type
ORDER BY avg_streams DESC;