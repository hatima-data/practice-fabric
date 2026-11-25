# Anime and Manga Analysis (Microsoft Fabric + Power BI)

Analysis of anime and manga data from MyAnimeList using a Microsoft Fabric Lakehouse, SQL, PySpark and Power BI.

## Data

- MAL-anime.csv: 12,774 anime
- MAL-manga.csv: 17,811 manga

## What I did

- Loaded the CSV files into a Fabric Lakehouse as tables
- Cleaned the data in a PySpark notebook and saved it as manga_cleaned and anime_cleaned tables
- Wrote SQL queries in the SQL analytics endpoint (grouping, filtering, sorting)
- Built a Power BI dashboard on top of the Lakehouse tables

## Key Findings

- Manga is rated higher on average than anime: 6.99 vs 6.48.
- The most popular anime by members are Shingeki no Kyojin (3.8M), Death Note (3.7M) and Fullmetal Alchemist: Brotherhood (3.2M).
- Among anime types, TV has the highest average score (6.8) and ONA the lowest (6.0).
- Among manga types, Novel has the highest average score (7.9) and One-shot the lowest (6.5).

Average scores differ only a little between types, and the dashboard does not show how many titles each type has, so small types can be less reliable.

## Files

- MAL-anime.csv, MAL-manga.csv: data
- practice-notebook.ipynb: PySpark notebook
- anime-manga-analysis.sql: SQL queries
- anime-manga-dashboard.pbix: Power BI dashboard

## Tools

Microsoft Fabric (Lakehouse), PySpark, SQL, Power BI

## Author

Hatima Muratova | Junior Data Analyst, open to remote work
[LinkedIn](https://linkedin.com/in/hatima-muratova-ba5399408) | [GitHub](https://github.com/hatima-data)

<img width="1317" height="732" alt="Anime   Manga dashboard" src="https://github.com/user-attachments/assets/47359c8f-a62a-4c11-96c2-32f6a84a781f" />
