# 📚 Data Dictionary

This document describes each column available in the Spotify Streaming Dataset used for this SQL business analysis project.

| Column | Data Type | Description |
|---------|-----------|-------------|
| **Artist** | Text | Name of the artist who performed the track. |
| **Track** | Text | Name of the song. |
| **Album** | Text | Album to which the track belongs. |
| **Album_type** | Text | Release type of the track (e.g., Album, Single, Compilation). |
| **Danceability** | Decimal | Measures how suitable a track is for dancing (0–1). Higher values indicate more danceable songs. |
| **Energy** | Decimal | Represents the intensity and activity level of the song (0–1). Higher values indicate more energetic tracks. |
| **Loudness** | Decimal | Overall loudness of the track measured in decibels (dB). |
| **Speechiness** | Decimal | Detects the presence of spoken words in a track. Higher values indicate more speech-like content. |
| **Acousticness** | Decimal | Confidence measure (0–1) of whether the track is acoustic. |
| **Instrumentalness** | Decimal | Predicts the likelihood that a track contains no vocals (0–1). |
| **Liveness** | Decimal | Indicates the probability that the track was performed live. |
| **Valence** | Decimal | Describes the musical positivity of a track (0–1). Higher values indicate happier songs. |
| **Tempo** | Decimal | Estimated tempo of the track in Beats Per Minute (BPM). |
| **Duration_min** | Decimal | Duration of the track in minutes. |
| **Title** | Text | Title of the uploaded video on the content platform. |
| **Channel** | Text | Name of the YouTube channel where the track is published. |
| **Views** | Big Integer | Total number of video views. |
| **Likes** | Big Integer | Total number of likes received by the video. |
| **Comments** | Big Integer | Total number of user comments on the video. |
| **Licensed** | Boolean | Indicates whether the content is officially licensed (1 = Yes, 0 = No). |
| **official_video** | Boolean | Indicates whether the uploaded content is the official music video (1 = Yes, 0 = No). |
| **Stream** | Big Integer | Total number of Spotify streams for the track. |
| **EnergyLiveness** | Decimal | Derived metric combining Energy and Liveness, useful for comparative analysis. |
| **most_playedon** | Text | Platform where the track is most frequently played (e.g., Spotify, YouTube). |

---

## 📌 Dataset Summary

| Property | Value |
|----------|-------|
| **Domain** | Music Streaming Analytics |
| **Dataset Type** | Structured CSV |
| **Primary Entity** | Track |
| **Number of Columns** | 24 |
| **Analysis Tool** | SQL Server |
| **Project Focus** | Business Intelligence & Data Analytics |

---

## 📖 Notes

- Audio features such as **Danceability**, **Energy**, **Valence**, and **Acousticness** are provided by Spotify's audio analysis.
- Engagement metrics (**Views, Likes, Comments**) are sourced from YouTube.
- **Stream** represents Spotify listening activity.
- This dataset combines **streaming**, **engagement**, and **audio feature** data to enable end-to-end business analysis.
