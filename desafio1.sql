DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.planos(
      planos_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	  nome_do_plano VARCHAR(20) NOT NULL,
      valor DECIMAL(3,2) NOT NULL
  ) engine = InnoDB;

  
  CREATE TABLE SpotifyClone.usuarios(
      usuarios_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
      nome VARCHAR(120) NOT NULL,
      idade INT,
      data_assinatura DATE NOT NULL,
      plano_id INT,
      FOREIGN KEY(plano_id) REFERENCES SpotifyClone.planos(planos_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artistas(
      artistas_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	  nome VARCHAR(120)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.seguidores(
      seguidor_id INT,
      artist_id INT,
      PRIMARY KEY(seguidor_id, artist_id),
      FOREIGN KEY(seguidor_id) REFERENCES SpotifyClone.usuarios(usuarios_id),
      FOREIGN KEY(artist_id) REFERENCES SpotifyClone.artistas(artistas_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.albuns(
      albuns_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	  nome VARCHAR(120) NOT NULL,
      ano_de_lancamento YEAR NOT NULL,
      artista_id INT,
      FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(artistas_id)
  ) engine = InnoDB;

 
  CREATE TABLE SpotifyClone.cancoes(
      cancoes_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	  cancao VARCHAR(120),
      duracao INT,
      album_id INT,
      FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns(albuns_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.reproducoes(
      user_id INT NOT NULL,
      cancao_id INT NOT NULL,
	  data_de_reproducao DATETIME,
      PRIMARY KEY (user_id, cancao_id),
      FOREIGN KEY (user_id) REFERENCES SpotifyClone.usuarios(usuarios_id),
      FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes(cancoes_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.planos (nome_do_plano, valor)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('pessoal', 6.99),
    ('universitário', 5.99);

  INSERT INTO SpotifyClone.usuarios (nome, idade, plano_id, data_assinatura)
   VALUES
     ('Barbara Liskov', 82, 1, '2019-10-20' ),
     ('Robert Cecil Martin', 58, 1, '2017-01-06' ),
     ('Ada Lovelace', 37, 2, '2017-12-30' ), 
     ('Martin Fowler', 46, 2, '2017-01-17' ),
     ('Sandi Metz', 58, 2, '2018-04-29' ),
     ('Paulo Freire', 19, 4, '2018-02-14' ),
     ('Bell Hooks', 26, 4, '2018-01-05' ), 	
     ('Christopher Alexander', 85, 3, '2019-06-05' ),
     ('Judith Butler', 45, 3, '2020-05-13' ),
     ('Jorge Amado', 58, 3, '2017-02-17' );


 INSERT INTO SpotifyClone.artistas (nome)
       VALUES
       ('Beyoncé'),
       ('Queen'),
       ('Elis Regina'),
       ('Baco Exu do Blues'),
       ('Blind Guardian'),
       ('Nina Simone');


  INSERT INTO SpotifyClone.albuns (nome, artista_id, ano_de_lancamento)
   VALUES
     ('Renaissance', 1, '2022'),
     ('Jazz', 2, '1978'),
     ('Hot Space', 2, '1982'),
     ('Falso Brilhante', 3, '1998'),
     ('Vento de Maio', 3, '2001'),
     ('QVVJFA?', 4, '2003'),
     ('Somewhere Far Beyond', 5, '2007'),
     ('Feeling Good', '6', '2012');


INSERT INTO SpotifyClone.cancoes (cancao,duracao,album_id)
    VALUES
      ('BREAK MY SOUL', 279,1),
      ('VIRGO’S GROOVE', 369,1),
      ('ALIEN SUPERSTAR', 116,1),
      ('Don’t Stop Me Now',203,2),
      ('Under Pressure',152 ,3),
	  ('Como Nossos Pais',105 ,4),
      ('O Medo de Amar é o Medo de Ser Livre',207 ,5),
      ('Samba em Paris', 267,6),
      ('The Bard’s Song', 244,7),
      ('Feeling Good', 100, 8);


INSERT INTO SpotifyClone.seguidores (seguidor_id, artist_id)
   VALUES
     (1, 1),
     (1, 2),
     (1, 3),
     (2, 1),
     (2, 3),
     (3, 2),
     (4, 4),
     (5, 5),
     (5, 6),
     (6, 6),
     (6, 1),
     (7, 6),
     (9, 3),
     (10, 2);

INSERT INTO SpotifyClone.reproducoes (user_id, cancao_id, data_de_reproducao)
   VALUES
     (1, 8,'2022-02-28 10:45:55'),
     (1, 2,'2020-05-02 05:30:35'),
     (1, 10,'2020-03-06 11:22:33'),
     (2, 10,'2022-08-05 08:05:17'),
     (2, 7,'2020-01-02 07:40:33'),
     (3, 10,'2020-11-13 16:55:13'),
     (3, 2,'2020-12-05 18:38:30'),
     (4,8 ,'2021-08-15 17:10:10'),
     (5,8 ,'2022-01-09 01:44:33'),
     (5,5 ,'2020-08-06 15:23:43'),
     (6,7 ,'2017-01-24 00:31:17'),
     (6,1 ,'2017-10-12 12:35:20'),
     (7,4 ,'2011-12-15 22:30:49'),
     (8,4 ,'2012-03-17 14:56:41'),
     (9,9 ,'2022-02-24 21:14:22'),
     (10,3 ,'2015-12-13 08:30:22');