/*

# PHASE 3: ARTIST PERFORMANCE ANALYSIS

Objective:
Identify artists that drive the highest consumption and engagement.

Business Value:
Supports decisions related to artist partnerships, promotions, and playlist placement.

Analysis Covered:

1. Top Artists by Streams
2. Top Artists by Engagement
3. Highest Average Streams per Track

=========================================================
*/


/*

## Q13. Top Artists by Streams

Business Question:
Which artists contribute the most streams?

Why it Matters:
Highlights the biggest drivers of platform listening.
*/

SELECT TOP 10
    artist,
    SUM(stream) total_streams
FROM spotify
GROUP BY artist
ORDER BY total_streams DESC;

/*

## Q15. Top Artists by Engagement

Business Question:
Which artists generate the most audience interaction?

Why it Matters:
High engagement often indicates a loyal fan base.
*/

SELECT TOP 10
    artist,
    SUM(likes + comments) engagement
FROM spotify
GROUP BY artist
ORDER BY engagement DESC;

/*

## Q16. Artists with Highest Average Streams per Track

Business Question:
Which artists consistently perform well on a per-track basis?

Why it Matters:
Average performance provides a better measure of consistency than total streams alone.
*/

SELECT
    artist,
    ROUND(AVG(stream),0) avg_streams
FROM spotify
GROUP BY artist
HAVING COUNT(*) >= 3
ORDER BY avg_streams DESC;