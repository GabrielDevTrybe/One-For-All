SELECT
	a.nome AS artista,
    alb.nome AS album
FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.albuns AS alb
ON a.artistas_id = alb.artista_id
WHERE a.nome LIKE '%Elis Regina%';