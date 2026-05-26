CREATE EXTENSION IF NOT EXISTS HSTORE;
-- Criando a tabela (livraia) com as características dos livros
CREATE TABLE IF NOT EXISTS Livraria (
 ISBN BIGINT PRIMARY KEY,
 Detalhes HSTORE NOT NULL
);
-- NOTA: O tipo INT do PostgreSQL não aceita números muito grandes, o que é o caso de uma ISBN de um livro. O tipo de dado possui, como valor máximo, o número 2147483647 (ou "2³¹-1"). Qualquer número maior que esse lança uma exceção (erro) com a mensagem "integer out of range". Para contornar esse problema, o dado ISBN será do tipo BIGINT, que vai até o número 9223372036854775807 (ou "2⁶³-1").


-- Inserindo os livros com as características na ordem
-- A partir do ponto que um dado é do tipo JSON ou HStore, com muitos valores dentro, que começa a quebrar as formas normais de um banco de dados. Se a "1FN" (primeira forma normal) é quebrada, todas as outras são quebradas.
-- Os dados em JSON serão inseridos com uma quebra de linha após a vírgula, exatamente para serem renderizados, ao selecionar (ler), como na expressão "jsonb_pretty()" do JSONB.
INSERT INTO Livraria VALUES
(6555522267,
 '"Título"=>"1984",
 "Autor"=>"George Orwell",
 "Páginas"=>"334",
 "Nacional"=>"Não"'
),
(8594318596,
 '"Título"=>"A Arte da Guerra",
 "Autor"=>"Sun Tzu",
 "Páginas"=>"160",
 "Nacional"=>"Não"'
),
(8594318782,
 '"Título"=>"A Metamorfose",
 "Autor"=>"Franz Kafka",
 "Páginas"=>"96",
 "Nacional"=>"Não"'
),
(8579624169,
 '"Título"=>"Ainda Estou Aqui",
 "Autor"=>"Marcelo Paiva",
 "Páginas"=>"296",
 "Nacional"=>"Sim"'
),
(8535930485,
 '"Título"=>"Assim Falou Zaratustra",
 "Autor"=>"Friedrich Nietzsche",
 "Páginas"=>"360",
 "Nacional"=>"Não"'
),
(8535904174,
 '"Título"=>"Budapeste",
 "Autor"=>"Chico Buarque",
 "Páginas"=>"176",
 "Nacional"=>"Sim"'
),
(8535911693,
 '"Título"=>"Capitães da Areia",
 "Autor"=>"Jorge Amado",
 "Páginas"=>"283",
 "Nacional"=>"Sim"'
),
(8542213742,
 '"Título"=>"Cidade de Deus",
 "Autor"=>"Paulo Lins",
 "Páginas"=>"400",
 "Nacional"=>"Sim"'
),
(8535915389,
 '"Título"=>"Ciranda de Pedra",
 "Autor"=>"Lygia Fagundes",
 "Páginas"=>"224",
 "Nacional"=>"Sim"'
),
(6555520809,
 '"Título"=>"Crime e Castigo",
 "Autor"=>"Fyodor Dostoyévsky",
 "Páginas"=>"240",
 "Nacional"=>"Não"'
),
(9788538583,
 '"Título"=>"Dicionário Aurélio",
 "Autor"=>"Aurélio Buarque",
 "Páginas"=>"2272",
 "Nacional"=>"Sim"'
),
(8573029633,
 '"Título"=>"Dicionário Houaiss",
 "Autor"=>"Antônio Houaiss",
 "Páginas"=>"1986",
 "Nacional"=>"Sim"'
),
(8578887239,
 '"Título"=>"Dom Casmurro",
 "Autor"=>"Machado de Assis",
 "Páginas"=>"208",
 "Nacional"=>"Sim"'
),
(8535923438,
 '"Título"=>"Eu sou Malala",
 "Autor"=>"Malala Yousafzai",
 "Páginas"=>"360",
 "Nacional"=>"Não"'
),
(8535933581,
 '"Título"=>"Ideias para adiar o fim do mundo",
 "Autor"=>"Ailton Krenak",
 "Páginas"=>"104",
 "Nacional"=>"Sim"'
),
(6555320249,
 '"Título"=>"Laços de Família",
 "Autor"=>"Clarice Lispector",
 "Páginas"=>"144",
 "Nacional"=>"Sim"'
),
(6580722029,
 '"Título"=>"O Pica-Pau Amarelo",
 "Autor"=>"Monteiro Lobato",
 "Páginas"=>"144",
 "Nacional"=>"Sim"'
),
(8580578892,
 '"Título"=>"O universo numa casca de noz",
 "Autor"=>"Stephen Hawking",
 "Páginas"=>"224",
 "Nacional"=>"Não"'
),
(8534705259,
 '"Título"=>"Olhos de Água",
 "Autor"=>"Conceição Evaristo",
 "Páginas"=>"116",
 "Nacional"=>"Sim"'
),
(6550970431,
 '"Título"=>"Orgulho e Preconceito",
 "Autor"=>"Jane Austen",
 "Páginas"=>"288",
 "Nacional"=>"Não"'
),
(8526022253,
 '"Título"=>"O Povo Brasileiro: A formação e o sentido do Brasil",
 "Autor"=>"Darcy Ribeiro",
 "Páginas"=>"368",
 "Nacional"=>"Sim"'
),
(8577533360,
 '"Título"=>"Pedagogia do Oprimido",
 "Autor"=>"Paulo Freire",
 "Páginas"=>"245",
 "Nacional"=>"Sim"'
),
(8535925481,
 '"Título"=>"Raízes do Brasil",
 "Autor"=>"Sérgio Buarque",
 "Páginas"=>"256",
 "Nacional"=>"Sim"'
),
(8582850409,
 '"Título"=>"Romeu e Julieta",
 "Autor"=>"William Shakespeare",
 "Páginas"=>"248",
 "Nacional"=>"Não"'
),
(8535933921,
 '"Título"=>"Sapiens: Uma breve história da humanidade",
 "Autor"=>"Yuval Harari",
 "Páginas"=>"472",
 "Nacional"=>"Não"'
),
(8501114782,
 '"Título"=>"Vidas Secas",
 "Autor"=>"Graciliano Ramos",
 "Páginas"=>"176",
 "Nacional"=>"Sim"'
);

-- O código abaixo consultará os dados na tabela (livros). Por padrão, a consulta é ordenada na ordem de tempo que os dados foram inseridos.
SELECT * FROM Livraria;
-- Pelo dado ser do tipo HStore, o código acima irá renderizar os dados de uma forma bem feia. Para ficar mais bonita e organizada, será usado um código mais avançado.
WITH Valores AS (SELECT
 ISBN,
 Detalhes->'Título' AS Título,
 Detalhes->'Autor' AS Autor,
 Detalhes->'Páginas' AS Páginas,
 Detalhes->'Nacional' AS Nacional
FROM Livraria)
SELECT * FROM Valores;
-- Para evitar muita repetição, o código acima, com os comandos WITH e AS, é uma técnica chamada Common Table Expressions. Uma nova "tabela", derivada da Livraria, será criada. Esse será o código, com os valores exibidos de forma mais bonita. Além da formatação, o termo "AS (nome da coluna)" ao lado dos campos garante que as colunas não serão chamadas pelo termo placeholder "?column?".
SELECT * FROM Valores ORDER BY Título; -- Consulta os livros em ordem alfabética, de 0 a 9 e, depois, A a Z
SELECT * FROM Valores ORDER BY Páginas;
-- A consulta acima é, teoricamente, por ordem número de páginas de forma crescente. Mas a "ordem" não é do menor ao maior número. O número 1986 está entre 176 e 208, o número 1986 está entre 176 e 208 e o número 96 é o último da lista. Os valores como número de páginas foram considerados como do tipo texto (ordem alfabética), não como número inteiro.
-- Para remediar esse problema, deve-se colocar o "Páginas" entre parênteses e colocar o termo "::numeric", ou "::int" que também serve. Isso serve para mostrar que a coluna Páginas é um valor numérico, não um do tipo texto, como na consulta abaixo.
SELECT * FROM Valores ORDER BY (Páginas)::INT;

-- O Common Table Expressions será atualizado.
WITH Valores AS (SELECT
 ISBN,
 CONCAT(Detalhes->'Título',' (',Detalhes->'Autor',')') AS Livro, -- Título e autor na mesma coluna
 Detalhes->'Páginas' AS Páginas,
 Detalhes->'Nacional' AS Nacional
FROM Livraria)
SELECT * FROM Valores WHERE (Páginas)::numeric > 1000; -- Consulta os livros com mais de 1000 páginas (ambos os Dicionários)
SELECT * FROM Valores WHERE Livro LIKE 'C%'; -- Consulta os livros que começam com a letra C
SELECT * FROM Valores WHERE NOT
(Livro LIKE 'A %' OR Livro LIKE 'O %') -- Títulos que NÃO começam com artigo definido
SELECT * FROM Valores WHERE Livro LIKE '%Buarque%'; -- Três livros escritos por membros da mesma família, ou árvore genealógica
SELECT COUNT(*) FROM Livraria; -- Consulta quantas entradas (livros) há na tabela (livraria)
SELECT ('Hello, world!') AS Test;
-- Por mais inacreditável que seja, é possível renderizar a string de teste "Hello, world!" no console de saída. Novamente, o "AS Test" existe no código para a coluna não ser chamada pelo termo placeholder "?column?".

-- As consultas abaixo são relativas aos livros se são brasileiros ou não. O código possui um associador.
-- O uso associador ("l", mostrado abaixo) para consultar uma tabela é útil para comandos complexos (ex.: JOIN, UNION, INTERSECT, LEFT, INNER, RIGHT, etc.), reduzindo o número de vezes que a tabela é referida. Não necessitando escrever o nome da tabela, só uma letra. Como aqui há apenas uma tabela, o associador aqui é apenas acessório.
SELECT v.* FROM Valores v WHERE Nacional='Sim'; -- Consulta apenas livros brasileiros
SELECT v.* FROM Valores v WHERE Nacional='Não';-- Consulta apenas livros estrangeiros
SELECT v.* FROM Valores v ORDER BY Nacional DESC;
-- A consulta acima, com o "ORDER BY", é feita numa ordem priorizando brasileiros. Porém, por mais que priorize, a consulta é retornada com os livros em ordem embaralhada dentro dos conjuntos de Sim e Não do "Detalhes->>'Nacional'", não na ordem alfabética como acontece em SQLite.

-- A consulta abaixo terá os novos dados acima dos respectivos livros. A consulta renderizada estará no arquivos de saída (consoles das IDEs como .txt, .xls, .xml, .csv e JSON).
WITH Valores AS (SELECT
 ISBN,
 CONCAT(Detalhes->'Título',' (',Detalhes->'Autor',')') AS Livro, -- Título e autor na mesma coluna
 Detalhes->'Páginas' AS Páginas,
 Detalhes->'Nacional' AS Nacional
FROM Livraria)
SELECT v.* FROM Valores v ORDER BY Nacional DESC;


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
