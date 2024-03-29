
SELECT * FROM Proamb.Usuarios
SELECT * FROM Proamb.Posts
SELECT * FROM Proamb.Comentarios

CREATE TABLE Proamb.Usuarios(
	Id INT IDENTITY PRIMARY KEY, --talvez deixar o id unique, pois o .net só consegue procurar por primary key
	Nome VARCHAR(255) NOT NULL,
	Email VARCHAR(100) NOT NULL UNIQUE,  --depois mudar, pois a combinação do email+senha deve ser UNIQUE
	Senha VARCHAR(100) NOT NULL,
	Username VARCHAR(20) NOT NULL UNIQUE, --ou o username pode ser UNIQUE, não sei, depois a gente fala sobre isso
	Foto TEXT,
	Biografia TEXT,
	Cep VARCHAR(9) NOT NULL 
)

INSERT INTO Proamb.Usuarios (Nome, Email, Senha, Username, Foto,
Biografia, Cep)
VALUES ('Jo�o Pedro Cassiano de Brito', 'cassiannoow@gmail.com',
'c3bfe49b7281e2e9ec75e910fecd3857', 'Jottape', 'https://i.pinimg.com/236x/6a/fb/e7/6afbe78b59e7f0294f3c73903291a6f0.jpg',
'Salve, eu sou o jottape atualmente cursando PD no cotuca.', '13181-492')
INSERT INTO Proamb.Usuarios (Nome, Email, Senha, Username, Foto,
Biografia, Cep)
VALUES ('Maria Eduarda De Jesus Padovan', 'Padovs@gmail.com',
'a801727724b5a1d36d3bbc5e81c96623', 'Padovan', 'https://pm1.narvii.com/7021/8f2ca50f74aeab0df4e7d46e5003319be13a642dr1-1215-717v2_uhq.jpg',
'Ooi, eu sou a Padovan atualmente cursando PD no cotuca.', '11608-545')
INSERT INTO Proamb.Usuarios (Nome, Email, Senha, Username, Foto,
Biografia, Cep)
VALUES ('Hugo Gomes Soares', 'Hugito@gmail.com',
'c12203ab7dc403c914ad77e37a54a6d6', 'Miojo', 'https://acnhcdn.com/latest/NpcBromide/NpcNmlDog18.png',
'Olá, eu sou o hugo! Prazer em te ver aqui. To escrevendo qualquer coisa só pra preencher espaço. Lindo, não?', '13058-442')

INSERT INTO Proamb.Usuarios (Nome, Email, Senha, Username, Foto,
Biografia, Cep)
VALUES ('Beatriz Juliato Coutinho', 'BiaC@gmail.com',
'81e27d2cd1a768f646deef2c0233a69a', 'Bia C', 'https://i.pinimg.com/originals/e9/ce/74/e9ce74429e4ae643f61634a68ff67d3d.jpg',
'Oi eu sou a bia! Não sei oq escrever é isso! Até mais, tchau!', '13271-653')

INSERT INTO Proamb.Usuarios (Nome, Email, Senha, Username, Foto,
Biografia, Cep)
VALUES ('Maria Eduarda De Jesus Padovan', 'Padovs@gmail.com',
'a801727724b5a1d36d3bbc5e81c96623', 'Padovan', 'https://pm1.narvii.com/7021/8f2ca50f74aeab0df4e7d46e5003319be13a642dr1-1215-717v2_uhq.jpg',
'Ooi, eu sou a Padovan atualmente cursando PD no cotuca.', '11608-545')

INSERT INTO Proamb.Usuarios (Nome, Email, Senha, Username, Foto,
Biografia, Cep)
VALUES ('Maria Eduarda De Jesus Padovan', 'Padovs@gmail.com',
'a801727724b5a1d36d3bbc5e81c96623', 'Padovan', 'https://pm1.narvii.com/7021/8f2ca50f74aeab0df4e7d46e5003319be13a642dr1-1215-717v2_uhq.jpg',
'Ooi, eu sou a Padovan atualmente cursando PD no cotuca.', '11608-545')


CREATE TABLE Proamb.Posts(
	Id INT IDENTITY PRIMARY KEY,
	IdUsuario INT NOT NULL,
	Imagem TEXT,
	Conteudo TEXT,
	FOREIGN KEY (IdUsuario) REFERENCES Proamb.Usuarios(Id)
)

INSERT INTO Posts (IdUsuario, Imagem, Conteudo)
VALUES (1, 'https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/2021/06/9684_FC669FCC551EEE52-1.jpg?w=876&h=484&crop=1',
'A MACONHA - Cannabis sativa � uma planta herb�cea da fam�lia das Canabi�ceas, amplamente cultivada em muitas partes do mundo')
INSERT INTO Posts (IdUsuario, Imagem, Conteudo)
VALUES (2, 'https://eizkd332mb3.exactdn.com/wp-content/uploads/2022/09/GP1SZPHR_.jpg?strip=all&lossy=1&ssl=1',
'QUEIMADAS NA AMAZONIA - As queimadas na amazonia tem se tornado cada vez mais constantes')

CREATE TABLE Proamb.Comentarios(
	Id INT IDENTITY PRIMARY KEY,
	IdUsuario INT NOT NULL,
	IdPost INT NOT NULL,
	Conteudo TEXT,
	FOREIGN KEY (IdUsuario) REFERENCES Proamb.Usuarios(Id),
	FOREIGN KEY (IdPost) REFERENCES Proamb.Posts(Id)
)

INSERT INTO Proamb.Comentarios (IdPost, IdUsuario, Conteudo)
VALUES (1, 2, 'Caramba eu n�o sabia que maconha era usada em alguns medicamentos.')
INSERT INTO Proamb.Comentarios (IdPost, IdUsuario, Conteudo)
VALUES (2, 1, 'Culpa do capitalismo')
INSERT INTO Proamb.Comentarios (IdPost, IdUsuario, Conteudo)
VALUES (2, 2, 'Culpa do Celio')

update Proamb.usuarios
set foto='https://ruined.dev/_next/image?url=https%3A%2F%2Fddragon.leagueoflegends.com%2Fcdn%2Fimg%2Fchampion%2Ftiles%2FNeeko_0.jpg&w=640&q=75'
where id=2