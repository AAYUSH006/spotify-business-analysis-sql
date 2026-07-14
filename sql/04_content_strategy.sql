/*

# PHASE 4: CONTENT STRATEGY ANALYSIS

Objective:
Understand how content format and distribution strategy impact performance.

Business Value:
Insights can guide future content production and promotional decisions.

=========================================================
*/

---Q17. Do Singles Perform Better Than Albums?
/*
Business Question:
Do singles outperform albums in terms of average streams and views?

Why it Matters:
Helps determine which release format generates better audience response.
*/

SELECT
    album_type,
    ROUND(AVG(stream),0) avg_streams,
    ROUND(AVG(views),0) avg_views
FROM spotify
GROUP BY album_type;

---Q18. Do Official Videos Generate More Streams?
/*
Business Question:
Do official videos generate more streams and views?

Why it Matters:
Measures the impact of video content on audience engagement.
*/

SELECT
    official_video,
    ROUND(AVG(stream),0) avg_streams,
    ROUND(AVG(views),0) avg_views
FROM spotify
GROUP BY official_video;

--- Q20. Which Channels Convert Views Into Streams Best?  (Turning viewers into spotify listners)
/*
Business Question:
Which channels are most effective at converting views into streams?

Why it Matters:
Identifies high-performing distribution channels.
*/

SELECT
    channel,
    ROUND(
        SUM(stream)*100.0/
        NULLIF(SUM(views), 0),
        2
    ) AS conversion_rate
FROM spotify
GROUP BY channel
ORDER BY conversion_rate DESC;