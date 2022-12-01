SELECT 
COUNT(DISTINCT a.artistas_id) AS 'artistas', 
COUNT(DISTINCT c.cancoes_id) AS 'cancoes', 
COUNT(DISTINCT alb.albuns_id) AS 'albuns'
FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.albuns AS alb
INNER JOIN SpotifyClone.cancoes AS c;