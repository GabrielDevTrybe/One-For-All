SELECT 
	us.nome AS usuario,
IF(YEAR(MAX(rep.data_de_reproducao)) >= '2021', 'Usuário ativo','Usuário inativo') AS status_usuario
FROM SpotifyClone.reproducoes AS rep
INNER JOIN SpotifyClone.usuarios AS us
ON usuarios_id = user_id
GROUP BY us.nome
ORDER BY us.nome;