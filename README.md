## Resumo
Este repositório meu, para fins de estudo, testa o que eu possuo de conhecimento sobre bancos de dados, particularmente como fazer consultas e gerenciar os mesmos.


## Conteúdo
1. [Resumo](#resumo)
2. [Bancos de dados (SQL)](#bancos-de-dados-sql)
   1. [Manipulação](#manipulação)
3. [Alguns problemas nos bancos de dados...](#alguns-problemas-nos-bancos-de-dados)
   1. [_SQL Injection_](#sql-injection)
   2. [_JSON_ e _HStore_ quebram a 1FN dos bancos de dados](#json-e-hstore-quebram-a-1fn-dos-bancos-de-dados)
4. [Banco de dados e orientação a objetos de uma biblioteca (livros)](#banco-de-dados-e-orientação-a-objetos-de-uma-biblioteca-livros)
5. [Requisitos funcionais e não-funcionais](#requisitos-funcionais-e-não-funcionais)
   1. [Funcionais](#funcionais)
   2. [Não-funcionais](#não-funcionais)
 


## Bancos de dados (SQL)
Para introduzir, eu devo descrever, com as minhas próprias palavras, o que é, em sentido estrito, um sistema de gerenciamento de banco de dados (__SGBD__).

Basicamente é uma área que estuda repor, organizar, manipular uma quantidade imensa de coisas (conhecimento) de um certo conjunto (informação) com características próprias (dados), incluindo um código numérico de identificador (chave primária) obrigatório.

Esses conjuntos são muito grandes, podendo ser a quantidade, em números, de:

* Funcionários em uma empresa (identificando pelo __número de matrícula__);
* Produtos distintos vendáveis em uma loja e a quantia disponível no estoque (identificando pelo __código de barras__);
* Candidatos a cargos políticos, todos filiados a um partido, registrados em uma urna eletrônica em época de eleição (identificando pelo __número de voto__)
* Livros disponíveis em uma livraria ou biblioteca (identificando pelo __número do ISBN__).

Sendo os conjuntos acima uma representação da realidade, existe basicamente um _big data_ com _megabytes_ ou _gigabytes_ de informação presente dentro de uma tabela, ou um banco de dados em geral, e isso considerando apenas valores em texto. O tamanho pode aumentar para uma casa maior que a dos _terabytes_ se forem considerados áudios, imagens, vídeos e programas executáveis.

### Manipulação
Para facilitar a manipulação e indexação desses dados, que são de quantidade muito grande em uma tabela, foi inventada uma linguagem chamada _Structured Query Language,_ (Linguagem Estruturada de Consulta), popularmente conhecida como __SQL.__

Esta linguagem é de alto nível (próxima aos idiomas humanos) e, assim como a grande maioria das outras de programação, baseada na língua inglesa, reservando várias palavras e termos da dita língua (`CREATE, ALTER, DROP, INSERT, ADD, IF NOT EXISTS, UPDATE, SET, DELETE, SELECT, JOIN, CONCAT, ORDER BY, ASC, DESC, FROM, WHERE, LIKE, TABLE, COLUMN, PRIMARY KEY, FOREIGN KEY, TEXT, INT, VARCHAR, FLOAT, SERIAL, BOOLEAN, BEGIN TRANSCATION, COMMIT, ROLLBACK`, etc.) para convertê-las em pulsos eletrônicos respondíveis para o _hardware_ do computador e fazer operações em um banco de dados, podendo ser em uma tabela inteira ou uma entrada específica inserida dentro da mesma.

Para saber se a palavra é reservada em um código, como nas mostradas no _blockcode_ acima, ela é destacada dependendo do editor de texto que é utilizado para os códigos SQL. No caso do editor de texto padrão do Ubuntu, é marcada em __negrito__ e na cor bege. No OneCompiler, é marcada na cor magenta.

Os comandos para a manipulação devem seguir os pilares do padrão __ACID:__
* __*Atomicidade:*__ Ou os comandos são totalmente feitos ou, caso haja uma exceção ou invalidez, não são feitos. Não há "meio-termo" ou progressão parcial. Caso uma inserção de valores seja feita em uma linha de tabela, se houver um erro ou exceção (ex.: atribuição de um valor _text_ a uma célula _int_), nenhum dado será inserido. O código terá que ser corrigido.
* __*Consistência:*__ Os dados devem ser consistentes com base em um comando. Pense em um saldo de __R$1000__ num banco, em que dois Pix de __+R$500__ recebidos e __-R$200__ feitos, respectivamente na ordem. Se não houvesse exclusão mútua nesses Pix, haveria uma condição de corrida (inconsistência), pois, como os __-R$200__ veio depois, o saldo final seria __R$800__, ignorando o recibo de __+R$500__ que veio antes. Ou __R$1500__, se a ordem dos Pix fosse invertida. Para remediar o problema, as duas operações de Pix terão um semáforo _mutex_, aí sim terá consistência, tendo o saldo de __R$1300__ esperado.
* __*Isolamento:*__ Basicamente a exclusão mútua de um acesso a uma célula (dado) por um comando, isso para evitar condições de corrida.
* __*Durabilidade:*__ Se uma operação for feita, os dados após a operação se mantém na forma que estão, mesmo com eventos após ameaças humanas ou externas.

Da SQL básica, foram surgindo variantes da mesma a fim de melhor adaptação e solução para problemas específicos, como _SQLite, PostgreSQL, MySQL, Microsoft SQL Server, NoSQL (MongoDB, Cassandra, etc.), PL/SQL, etc._ Também relativo ao SQL, surgiram softwares de bancos de dados facilitados para amadores como o _Microsoft Access_ e premissas idênticas de "pacotes Office" alternativos (_LibreOffice Base, OpenOffice Base,_ etc.).


## Alguns problemas nos bancos de dados...
### _SQL Injection_
Como todas as tecnologias e sistemas de informação, há preocupações com a segurança. Deve-se prestar atenção na confidencialidade (em que apenas pessoas autorizadas podem acessar), na integridade (em que nenhum dado foi alterado) e na disponibilidade (em que o conteúdo deve estar acessível e estável "24/7").

Para o exemplo específico dos SGBD, há um ataque chamado _SQL Injection,_ em que uma pessoa mal-intencionada pode explorar vulnerabilidades (ex.: coleta nos milissegundos de tempo de resposta, concatenação com dados não-sigilosos, etc.) em um banco de dados de qualquer coisa (website, loja, empresa, etc.) e coletar informações sensíveis e confidenciais (ex.: senhas) para cometer crimes com as mesmas. Tipo, usar informações e vendê-las na deep web, usar senhas para invadir a conta bancária de alguém e roubar dinheiro ou vazar extrato na internet, substituir uma conta em rede social de alguém por algo para promover transações em criptomoedas, entre outras coisas.

### _JSON_ e _HStore_ quebram a 1FN dos bancos de dados
Nos dados e códigos em PostgreSQL, as colunas em formato JSON e HStore quebram a primeira forma normal (1FN) de um banco de dados. Por mais que sejam declarados como _NoSQL_ ("not only SQL"), ainda sim há uma estranheza.

As formas normais são declaradas da seguinte forma:
* __1FN:__ Cada célula não pode ter mais de um valor. Em uma tabela contendo jogos em uma loja, por exemplo, um jogo não pode ter mais de uma publisher. Deve ser criada uma tabela secundária, com uma chave estrangeira referindo ao ID do jogo, relativa ao jogo com diferentes publishers, dependendo da plataforma, do formato de mídia ou da região.
* __2FN:__ As tabelas não podem ter mais de uma chave primária. Em uma tabela contendo CPFs e matrículas de pessoas, exemplificando com funcionários de uma empresa. A coluna que exige um valor de "matrícula" (int), essa como chave primária, deve estar em uma tabela secundária separada, com o CPF sendo a chave estrangeira.

## Banco de dados e orientação a objetos de uma biblioteca (livros)
Sendo um repositório próprio meu, eu decidi criar este repositório usando, como base, os livros existentes em uma biblioteca, usando o ISBN dos mesmos como chave primária.

Minha escolha por esse tipo de assunto, até para lidar com uma _int PK_ obrigatória, não é porque "eu gosto de ler livros", e sim porque é um tipo de assunto que balanceia entre o que é bastante compreensível entre o "grande público", os "intelectuais" e algo que eu deliberadamente entendo. Os livros que foram selecionados foram os que eu escolhi aleatoriamente com base em minha percepção de quais seriam "os mais prestigiados".

Foram selecionados mais para exemplificar, não significando que eu li, ou sei de alguma coisa sobre, os mesmos. As informações e os metadados desses livros foram extraídos principalmente das páginas de venda oficiais dos mesmos na loja da Amazon.

Algo que eu percebi ao pesquisar sobre esses livros na Amazon é que existem variantes dos mesmos que mudam o ISBN, a capa, o número de páginas, a editora e o peso. Esse problema vale até mesmo para livros nacionais (brasileiros). Essas variações provavelmente são "reprints", múltiplas traduções de um mesmo livro estrangeiro ou correções com base no Novo Acordo Ortográfico de 2016 para livros brasileiros, não sabendo dizer qual seria o "mais correto" (original) para os livros.


## Requisitos funcionais e não-funcionais
Esta é uma parte que se trata dos requisitos funcionais e não-funcionais desse repositório.

### Funcionais
O repositório deve mostrar várias formas de gerenciar, consultar ou manipular, dados em uma tabela, ou dados e/ou tabelas em banco de dados em geral.

No caso do repositório de uma tabela SQL com uma lista de livros para uma biblioteca ou livraria, foram colocados alguns livros com as características: código ISBN, título, autor, páginas e um indicador se é nacional (brasileiro) ou não (estrangeiro). Os tipos de dado para essas características são, respectivamente: inteiro chave primária, texto, texto, inteiro e booleano. A partir daí, serão feitas consultas personalizadas com base nas propriedades de cada linguagem SQL.

Os códigos SQL seguem o método _CRUD_ (_Create Read Update Delete_) na ordem:
```
CREATE TABLE Tabela (...); INSERT INTO Tabela VALUES (...);
SELECT * FROM Tabela;
ALTER TABELA Tabela; UPDATE Tabela SET ... WHERE ...;
DELETE FROM Tabela; DROP TABLE Tabela;
```

Para mais informações sobre os procedimentos nos códigos em cada linguagem de programação, leia os comentários (parte dos códigos para o compilador __não__ ler) nos respectivos arquivos.

### Não-funcionais
O repositório foi feito com  _SQLite, PostgreSQL_ com _JSON, PostgreSQL_ com _HStore, MongoDB_ e, esse não sendo um banco de dados SQL e sim uma programação orientada a objetos, _Python._ Foram usados o terminal do Linux (mais especificamente o do Ubuntu 24.04 "Noble Numbat") e as IDEs dos websites [OneCompiler](https://onecompiler.com) e [SQLite Online](https://sqliteonline.com) para ler, executar e compilar os códigos.
