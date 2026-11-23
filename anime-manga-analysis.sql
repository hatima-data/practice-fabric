SELECT*from manga_cleaned;

select*from anime_cleaned;

select 
    Title,
    count(*)
    from manga_cleaned
    GROUP BY Title;

SELECT
    Type,
    count(Title) as total_mangas,
    round(avg(Score), 2) as avg_score,
    Sum(Members) as Total_members
    from manga_cleaned
    group by Type
    order by avg_score desc;

SELECT
    top 10
    Members,
    Title
    from manga_cleaned
    order by Members desc;

SELECT 
    Type,
    count(*) as count_type,
    round(avg(Members), 2) as avg_members
    from anime_cleaned
    group by Type
    order by avg_members desc;

SELECT
    Type,
    count(*) as count_type 
    from manga_cleaned
    where Score>8.5
    group by Type;

SELECT
    Type,
    count(*) as count_type 
    from anime_cleaned
    where Score>8.5
    group by Type;

select
        case
            when Score>=8 then 'High'
            when Score>= 7 and Score<8 then 'Medium'
            else 'Low'
            end as Score_Category,
            count(*) as Manga_count 
        from manga_cleaned 
        group by
                case
                    when Score>=8 then 'High'
                    when Score>= 7 and Score<8 then 'Medium'
                    else 'Low'
                end 
            order by Manga_count;

select
    Type,
    count(*) as total_mangas,
    round(avg(Score),2) as avg_score
    from manga_cleaned
    group by Type
    having count(*)>50
    order by avg_score;

select
    Type,
    count(*) as total_anime,
    round(avg(Score),2) as avg_score
    from anime_cleaned
    group by Type
    having count(*)>50
    order by avg_score;

with ranked_manga as (
    select 
        Type,
        Title,
        Score,
        row_number()over(partition by Type order by Score desc,Members desc) as rn
        from manga_cleaned
)
select Type,Title,Score         
from ranked_manga
where rn<3
order by Type,rn;

WITH TypeStats AS (
    SELECT 
        Type,
        ROUND(AVG(Score), 2) AS Type_Avg_Score
    FROM manga_cleaned
    GROUP BY Type
),
OverallStats AS (
    SELECT AVG(Score) AS Overall_Avg_Score
    FROM manga_cleaned
)
SELECT 
    t.Type,
    t.Type_Avg_Score,
    ROUND(o.Overall_Avg_Score, 2) AS Overall_Avg
FROM TypeStats t
CROSS JOIN OverallStats o
WHERE t.Type_Avg_Score > o.Overall_Avg_Score
ORDER BY t.Type_Avg_Score DESC;

select 
    m.Title,
    round(m.Score,2) as Manga_Score,
    round(a.Score,2) as Anime_Score,
    round(m.Score-a.Score, 2) as Score_Diff,
    case
        when m.Score > a.Score then 'Manga Higher'
        when a.Score > m.Score then 'Anime Higher'
        else 'Equal'
    end as Higher_Rating
from manga_cleaned m 
inner join anime_cleaned a 
    on m.Title=a.Title
order by ABS (m.Score-a.Score) desc;

select 
    Members,
    Score
    from manga_cleaned
    where Members>50000 and Score<7;


select 
    Type,
    count(*)
    from manga_cleaned
    group by Type;

select 
    Type,
    count(*)
    from anime_cleaned
    group by Type;

select 
    m.Title,
    a.Title,
    m.Score
    from manga_cleaned m
    left join 
    anime_cleaned a
    on m.Title = a.Title 
    where a.Title is null 
    and m.Score >=8.5;

Select
    top 5
    Title,
    Type,
    Members
    from anime_cleaned
    order by Members desc;


Select
    top 5
    Title,
    Type,
    Members
    from manga_cleaned
    order by Members desc;

select
    Type,
    min(Score) as min_score_manga,
    max(Score) as max_score_manga
    from manga_cleaned
    group by Type;

select
    Type,
    min(Score) as min_score_anime,
    max(Score) as max_score_anime
    from anime_cleaned
    group by Type;

Select 
    Type,
    count(*) as High_Score_Count
    from manga_cleaned
    where Score>=9
    group by Type;

select
    Title,
    Score
    from manga_cleaned
    where Title like '%Love%' or Title like '%Hero%';


select 
    Type,
    sum(Members) as total_members_anime,
    round(avg(Members),0) as avg_members_anime
    from anime_cleaned
    group by  Type
    order by total_members_anime desc;

select 
    Type,
    sum(Members) as total_members_manga,
    round(avg(Members),0) as avg_members_manga
    from manga_cleaned
    group by  Type
    order by total_members_manga desc;

select
    top 1
    Title,
    Score
    from manga_cleaned
    where Score>0
    order by Score desc;

select
    top 1
    Title,
    Score
    from manga_cleaned
    where Score>0
    order by Score asc;   

select
    top 1
    Title,
    Score
    from anime_cleaned
    where Score>0
    order by Score desc;

select
    top 1
    Title,
    Score
    from anime_cleaned
    where Score>0
    order by Score asc;

select
    case 
        when Episodes = '1' then 'Single Episode'
        when Episodes = '?' then 'Ongoing/Unkown'
        else 'Multi-Episode Series'
    end as Format_Type,
    count(*) as Anime_Count,
    round(avg(Score),2) as Avg_Score,
    round(avg(Members),0) as Avg_Members
    from anime_cleaned
    where Score>0
    group by 
        case 
            when Episodes='1' then 'Single Episode'
            when Episodes='?' then 'Ongoing/Unkown'
            else 'Multi-Episode Series'
        end
    order by Avg_Score Desc;




SELECT 
    CASE 
        WHEN Aired LIKE '%199%' THEN '1990s Era'
        WHEN Aired LIKE '%202%' THEN '2020s Era'
        ELSE 'Other Years'
    END AS Release_Era,
    COUNT(*) AS Anime_Count,
    ROUND(AVG(Score), 2) AS Avg_Score,
    ROUND(AVG(Members), 0) AS Avg_Members
FROM anime_cleaned
WHERE Score > 0
GROUP BY 
    CASE 
        WHEN Aired LIKE '%199%' THEN '1990s Era'
        WHEN Aired LIKE '%202%' THEN '2020s Era'
        ELSE 'Other Years'
    END
ORDER BY Avg_Score DESC;


SELECT TOP 10
    Title,
    Type,
    Score,
    Members,
    Rank
FROM manga_cleaned
WHERE Score >= 8.2
  AND Members < 15000
ORDER BY Score DESC, Members DESC;

SELECT TOP 10
    Title,
    Type,
    Score,
    Members,
    Rank
FROM anime_cleaned
WHERE Score >= 8.2
  AND Members < 15000
ORDER BY Score DESC, Members DESC;
