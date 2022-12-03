SELECT c.cancao AS cancao, COUNT(r.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.reproducoes AS r
ON c.cancoes_id = r.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao LIMIT 2;