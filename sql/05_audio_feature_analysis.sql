/*
=========================================================
PHASE 5: AUDIO FEATURE ANALYSIS
=========================================================

Objective:
Analyze whether audio characteristics influence song success.

Business Value:
Can help identify patterns shared by successful songs.

=========================================================
*/

---Q21. Does Danceability Impact Streams?
/*
Business Question:
Does danceability impact stream performance?

Why it Matters:
Understanding listener preferences can support content strategy.
*/

SELECT
    CASE
        WHEN danceability >= 0.8 THEN 'High'
        WHEN danceability >= 0.5 THEN 'Medium'
        ELSE 'Low'
    END AS danceability_group,
    ROUND(AVG(stream),0) avg_streams
FROM spotify
GROUP BY CASE
        WHEN danceability >= 0.8 THEN 'High'
        WHEN danceability >= 0.5 THEN 'Medium'
        ELSE 'Low'
    END;

--- Q22. Does Energy Impact Streams?
/*
Business Question:
Does energy level influence stream performance?

Why it Matters:
Helps identify characteristics of high-performing songs.
*/

SELECT
    CASE
        WHEN energy >= 0.8 THEN 'High'
        WHEN energy >= 0.5 THEN 'Medium'
        ELSE 'Medium'
    END energy_group,
    ROUND(AVG(stream),0) avg_streams
FROM spotify
GROUP BY CASE
        WHEN energy >= 0.8 THEN 'High'
        WHEN energy >= 0.5 THEN 'Medium'
        ELSE 'Medium'
		END;

--- Q23. Ideal Song Duration For Maximum Streams
/*
Business Question:
What song duration performs best?

Why it Matters:
Can reveal the optimal track length for audience engagement.
*/

SELECT
    CASE
        WHEN duration_min < 3 THEN 'Under 3 Min'
        WHEN duration_min <= 4 THEN '3-4 Min'
        WHEN duration_min <= 5 THEN '4-5 Min'
        ELSE '5+ Min'
    END duration_bucket,
    ROUND(AVG(stream),0) avg_streams
FROM spotify
GROUP BY CASE
        WHEN duration_min < 3 THEN 'Under 3 Min'
        WHEN duration_min <= 4 THEN '3-4 Min'
        WHEN duration_min <= 5 THEN '4-5 Min'
        ELSE '5+ Min'
    END;