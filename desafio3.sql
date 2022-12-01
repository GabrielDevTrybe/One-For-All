SELECT 
u.nome AS 'usuario',
 COUNT(r.user_id) AS 'qt_de_musicas_ouvidas',
 ROUND(SUM(c.duracao)/60, 2) AS 'total_minutos'
FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.reproducoes AS r
ON u.usuarios_id=r.user_id
INNER JOIN SpotifyClone.cancoes as c
ON c.cancoes_id=r.cancao_id
GROUP BY u.nome
ORDER BY u.nome;
;