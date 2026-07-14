/*

# PHASE 2: KPI EXPLORATION

Objective:
Establish key performance indicators that summarize overall platform activity.

Business Value:
These KPIs provide a high-level view of content consumption and audience engagement.

Analysis Covered:

1. Total Streams
2. Total Views
3. Total Likes
4. Total Comments
5. Engagement Rate
6. Stream-to-View Ratio

=========================================================
*/

/*

## Q9. Total Streams Generated

Business Question:
How many streams were generated across all tracks?

Why it Matters:
Streams are the primary measure of content consumption.
*/

SELECT
    SUM(stream) AS total_streams
FROM spotify;

/*

## Q10. Total Views, Likes and Comments

Business Question:
What is the overall audience interaction level?

Why it Matters:
Provides a baseline for engagement analysis.
*/

SELECT
    SUM(views) total_views,
    SUM(likes) total_likes,
    SUM(comments) total_comments
FROM spotify;

/*

## Q11. Average Engagement Rate

Business Question:
How actively does the audience engage with content?

Why it Matters:
Measures audience participation relative to content exposure.
*/

SELECT
    ROUND(
        SUM(likes + comments) * 100.0 /
        SUM(views),
        2
    ) AS engagement_rate
FROM spotify;

/*

## Q12. Stream-to-View Ratio

Business Question:
How effectively do views translate into listening activity?

Why it Matters:
Helps evaluate audience conversion behavior.
*/

SELECT
    ROUND(
        SUM(stream) * 100.0 /
        SUM(views),
        2
    ) AS stream_view_ratio
FROM spotify;
