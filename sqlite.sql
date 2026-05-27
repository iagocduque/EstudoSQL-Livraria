-- Criando a tabela (biblioteca) com as características dos livros
-- Diferente do PostgreSQL com JSON ou HStore, a tabela abaixo, feita com SQLite, respeita a primeira forma normal (1FN) em um banco de dados.
CREATE TABLE Livraria (
 ISBN INT PRIMARY KEY,
 Titulo TEXT NOT NULL,
 Autor TEXT,
 Paginas INT
);
-- Inserindo os livros com as características
-- NOTA: Os dados devem ser inseridos na respectiva ordem explícita na criação da tabela. Se os dados forem inseridos em outra ordem, não na respectiva, ou terá um erro na criação da variável (pois os tipos não condizem) ou os dados incorretos serão exibidos.
INSERT INTO Livraria VALUES
(6555522267, '1984', 'George Orwell', 334),
(8594318596, 'A Arte da Guerra', 'Sun Tzu', 160),
(8594318782, 'A Metamorfose', 'Franz Kafka', 96),
(8579624169, 'Ainda Estou Aqui', 'Marcelo Paiva', 296),
(8535930485, 'Assim Falou Zaratustra', 'Friedrich Nietzsche', 360),
(8535904174, 'Budapeste', 'Chico Buarque', 176),
(8535911693, 'Capitães da Areia', 'Jorge Amado', 283),
(8542213742, 'Cidade de Deus', 'Paulo Lins', 400),
(8535915389, 'Ciranda de Pedra', 'Lygia Fagundes', 224),
(6555520809, 'Crime e Castigo', 'Fyodor Dostoyévsky', 240),
(9788538583, 'Dicionário Aurélio', 'Aurélio Buarque', 2272),
(8573029633, 'Dicionário Houaiss', 'Antônio Houaiss', 1986),
(8578887239, 'Dom Casmurro', 'Machado de Assis', 208),
(8535923438, 'Eu sou Malala', 'Malala Yousafzai', 360),
(8535933581, 'Ideias para adiar o fim do mundo', 'Ailton Krenak', 104),
(6555320249, 'Laços de Família', 'Clarice Lispector', 144),
(6580722029, 'O Pica-Pau Amarelo', 'Monteiro Lobato', 144),
(8580578892, 'O universo numa casca de noz', 'Stephen Hawking', 224),
(8534705259, 'Olhos de Água', 'Conceição Evaristo', 116),
(6550970431, 'Orgulho e Preconceito', 'Jane Austen', 288),
(8526022253, 'O Povo Brasileiro: A formação e o sentido Brasil', 'Darcy Ribeiro', 368),
(8577533360, 'Pedagogia do Oprimido', 'Paulo Freire', 245),
(8535925481, 'Raízes do Brasil', 'Sérgio Buarque', 256),
(8582850409, 'Romeu e Julieta', 'William Shakespeare', 248),
(8535933921, 'Sapiens: Uma breve história da humanidade','Yuval Harari', 472),
(8501114782, 'Vidas Secas', 'Graciliano Ramos', 176);


-- Consultando os dados na tabela (livros)
-- Por padrão, a consulta é ordenada pelo número da chave primária de forma crescente (do menor ao maior número).
SELECT * FROM Livraria;
-- Caso queira consultar de uma maneira específica, será necessário colocar uma condição depois do comando.
SELECT * FROM Livraria ORDER BY Titulo; -- Consulta os livros em ordem alfabética, de A a Z
SELECT * FROM Livraria ORDER BY Paginas; -- Consulta os livros por número de páginas, em ordem crescente por padrão
SELECT * FROM Livraria WHERE Titulo LIKE "C%"; -- Consulta os livros que começam com a letra C
SELECT * FROM Livraria WHERE NOT
 (Titulo LIKE "A %" OR Titulo LIKE "O %"); -- Títulos que NÃO começam com artigo definido
SELECT * FROM Livraria WHERE Titulo LIKE "%Buarque"; -- Três livros escritos por membros da mesma família, ou árvore genealógica
SELECT COUNT(*) FROM Livraria; -- Consulta quantas entradas (livros) há na tabela (livraria)
SELECT ('Hello, world!');
-- Por mais inacreditável que seja, é possível renderizar a string de teste "Hello, world!" no console de saída.


-- Inserção de nova coluna na tabela, esta para saber se é nacional ou não
ALTER TABLE Livraria
ADD COLUMN Nacional BOOLEAN; -- Adiciona uma nova coluna no final da tabela
-- Marcação de livros de escritores brasileiros. Os valores ISBN abaixo se referem aos livros que NÃO são brasileiros.
UPDATE Livraria SET Nacional=1;
UPDATE Livraria SET Nacional=0 WHERE ISBN=6555522267
OR ISBN=8594318596 OR ISBN=8594318782 OR ISBN=8535923438
OR ISBN=6550970431 OR ISBN=8535930485 OR ISBN=6555520809
OR ISBN=8582850409 OR ISBN=8580578892 OR ISBN=8535933921;
-- NOTA: Recomenda-se colocar o WHERE para as chaves primárias (no caso, os códigos ISBN). Colocando para outros valores, depende da IDE que é usada. Enquanto no SQLite do OneCompiler.com funciona normalmente, no SQLiteOnline.com, o código NÃO funciona com outros valores além da chave primária. Para funcionar com todas as variantes do SQLite presentes na internet, ou em terminais existentes off-line, usa-se a chave primária.

-- Consultando os livros em ordem priorizando os brasileiros, código com associador
-- O uso associador ("l", mostrado abaixo) para consultar uma tabela é útil para comandos complexos (ex.: JOIN, UNION, INTERSECT, LEFT, INNER, RIGHT, etc.), reduzindo o número de vezes que a tabela é referida. Não necessitando escrever o nome da tabela, só uma letra. Como aqui há apenas uma tabela, o associador aqui é apenas acessório.
SELECT l.* FROM Livraria l ORDER BY Nacional DESC;
SELECT l.* FROM Livraria l WHERE Nacional=1; -- Consulta apenas livros brasileiros
SELECT l.* FROM Livraria l WHERE Nacional=0; -- Consulta apenas livros estrangeiros


-- Remoção de uma coluna na tabela
ALTER TABLE Livraria
DROP COLUMN Autor;
-- Inserção de duas novas colunas na tabela, nome e sobrenome dos autores
ALTER TABLE Livraria ADD COLUMN Nome TEXT;
ALTER TABLE Livraria ADD COLUMN Sobrenome TEXT;
-- Atualização de nomes e sobrenomes dos escritores dos respectivos livros
UPDATE Livraria SET Sobrenome="Orwell", Nome="George" WHERE ISBN=6555522267;
UPDATE Livraria SET Sobrenome="Sun", Nome="Tzu" WHERE ISBN=8594318596;
UPDATE Livraria SET Sobrenome="Kafka", Nome="Franz" WHERE ISBN=8594318782;
UPDATE Livraria SET Sobrenome="Paiva", Nome="Marcelo" WHERE ISBN=8579624169;
UPDATE Livraria SET Sobrenome="Nietzsche", Nome="Friedrich" WHERE ISBN=8535930485;
UPDATE Livraria SET Sobrenome="Buarque", Nome="Chico" WHERE ISBN=8535904174;
UPDATE Livraria SET Sobrenome="Amado", Nome="Jorge" WHERE ISBN=8535911693;
UPDATE Livraria SET Sobrenome="Lins", Nome="Paulo" WHERE ISBN=8542213742;
UPDATE Livraria SET Sobrenome="Fagundes", Nome="Lygia" WHERE ISBN=8535915389;
UPDATE Livraria SET Sobrenome="Dostoyévsky", Nome="Fyodor" WHERE ISBN=6555520809;
UPDATE Livraria SET Sobrenome="Buarque", Nome="Aurélio" WHERE ISBN=9788538583;
UPDATE Livraria SET Sobrenome="Houaiss", Nome="Antônio" WHERE ISBN=8573029633;
UPDATE Livraria SET Sobrenome="Assis", Nome="Machado" WHERE ISBN=8578887239;
UPDATE Livraria SET Sobrenome="Yousafzai", Nome="Malala" WHERE ISBN=8535923438;
UPDATE Livraria SET Sobrenome="Krenak", Nome="Ailton" WHERE ISBN=8535933581;
UPDATE Livraria SET Sobrenome="Lispector", Nome="Clarice" WHERE ISBN=6555320249;
UPDATE Livraria SET Sobrenome="Lobato", Nome="Monteiro" WHERE ISBN=6580722029;
UPDATE Livraria SET Sobrenome="Hawking", Nome="Stephen" WHERE ISBN=8580578892;
UPDATE Livraria SET Sobrenome="Evaristo", Nome="Conceição" WHERE ISBN=8534705259;
UPDATE Livraria SET Sobrenome="Austen", Nome="Jane" WHERE ISBN=6550970431;
UPDATE Livraria SET Sobrenome="Ribeiro", Nome="Darcy" WHERE ISBN=8526022253;
UPDATE Livraria SET Sobrenome="Freire", Nome="Paulo" WHERE ISBN=8577533360;
UPDATE Livraria SET Sobrenome="Buarque", Nome="Sérgio" WHERE ISBN=8535925481;
UPDATE Livraria SET Sobrenome="Shakespeare", Nome="William" WHERE ISBN=8582850409;
UPDATE Livraria SET Sobrenome="Harari", Nome="Yuval" WHERE ISBN=8535933921;
UPDATE Livraria SET Sobrenome="Ramos", Nome="Graciliano" WHERE ISBN=8501114782;
-- Os dados acima colocados nas novas colunas irão formar o nome do autor de uma forma muito comum em livros, que é no formato "SOBRENOME, Nome". O formato "sobrenome nome" (nessa ordem) é padrão nos idiomas da Ásia Oriental e no húngaro.
-- Consultando os autores no formato SOBRENOME, Nome
SELECT CONCAT(UPPER(Sobrenome),', ',Nome) AS Autor FROM Livraria;
-- O comando abaixo irá consultar os dados dos respectivos livros de uma forma personalizada. A consulta renderizada estará no arquivos de saída (consoles das IDEs como .txt, .xls, .xml, .csv e JSON).
SELECT ISBN, Titulo,
CONCAT(UPPER(Sobrenome),', ',Nome) AS Autor,
Paginas, Nacional FROM Livraria
ORDER BY Nacional DESC;


-- Para garantir ainda mais a estrutura ACID (Atomicidade, Consistência, Isolamento e Durabilidade) de um banco dados, existe um "campo" chamado BEGIN TRANSCATION. Em que qualquer alteração feita na tabela e nos dados pode ser desfeita com um ROLLBACK ou confirmada por definitivo com um COMMIT.
-- Todos os comandos fora do campo BEGIN TRANSACTION, se válidos, são COMMIT imediatos, sem a possibilidade de desfazer. Se o comando for inválido, ou houver exceção imprevista, haverá um ROLLBACK.
BEGIN TRANSACTION;
-- Os comandos abaixo deletam os dados inseridos e descarta a tabela inteira. 
 DELETE FROM Livraria; -- AVISO: ISTO IRÁ APAGAR TODOS OS DADOS DA TABELA! USE COM CUIDADO.
 DROP TABLE Livraria; -- IRÁ DESCARTAR A TABELA INTEIRA.
ROLLBACK; -- Se o descarte da tabela e a expurgação de dados foi um erro, o ROLLBACK irá reverter o banco de dados como era antes de uma invocação "BEGIN TRANSACTION". 

-- Ou, caso queira por definitivo expurgar e descartar tudo, faça um COMMIT.
BEGIN TRANSACTION;
 DELETE FROM Livraria;
 DROP TABLE Livraria;
COMMIT;
