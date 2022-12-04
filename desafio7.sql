SELECT 
ar.nome  AS artista,
alb.nome AS album,
COUNT(seg.artist_id) AS seguidores
FROM SpotifyClone.artistas AS ar
INNER JOIN SpotifyClone.albuns AS alb
ON ar.artistas_id =alb.artista_id
INNER JOIN SpotifyClone.seguidores AS seg
ON ar.artistas_id = seg.artist_id
GROUP BY alb.nome, ar.artistas_id
ORDER BY seguidores DESC, artista, album;