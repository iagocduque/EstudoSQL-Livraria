// Criando a coleção (livraria)
db.createCollection("Livraria");


// Inserindo os livros e suas características
// A partir do ponto que um dado é do tipo MongoDB, com muitos valores dentro, que começa a quebrar as formas normais de um banco de dados. Se a "1FN" (primeira forma normal) é quebrada, todas as outras são quebradas.
db.Livraria.insertMany([
 { ISBN:6555522267, título:"1984", autor:"George Orwell", páginas:334 },
 { ISBN:8594318596, título:"A Arte da Guerra", autor:"Sun Tzu", páginas:160 },
 { ISBN:8594318782, título:"A Metamorfose", autor:"Franz Kafka", páginas:96 },
 { ISBN:8579624169, título:"Ainda Estou Aqui", autor:"Marcelo Rubens Paiva", páginas:296 },
 { ISBN:8535930485, título:"Assim Falou Zaratustra", autor:"Friedrich Nietzsche", páginas:360 },
 { ISBN:8535904174, título:"Budapeste", autor:"Chico Buarque", páginas:176 },
 { ISBN:8535911693, título:"Capitães da Areia", autor:"Jorge Amado", páginas:283 },
 { ISBN:8542213742, título:"Cidade de Deus", autor:"Paulo Lins", páginas:400 },
 { ISBN:8535915389, título:"Ciranda de Pedra", autor:"Lygia Telles Fagundes", páginas:224 },
 { ISBN:6598002192, título:"Constituição de 1988", autor:"Brasil", páginas:303 },
 { ISBN:6555520809, título:"Crime e Castigo", autor:"Fyodor Dostoyévsky", páginas:240 },
 { ISBN:9788538583, título:"Dicionário Aurélio", autor:"Aurélio Buarque", páginas:2272 },
 { ISBN:8573029633, título:"Dicionário Houaiss", autor:"Antônio Houaiss", páginas:1986 },
 { ISBN:8578887239, título:"Dom Casmurro", autor:"Machado de Assis", páginas:208 },
 { ISBN:8535923438, título:"Eu sou Malala", autor:"Malala Yousafzai", páginas:360 },
 { ISBN:8535933581, título:"Ideias para adiar o fim do mundo", autor:"Ailton Krenak", páginas:104 },
 { ISBN:6555320249, título:"Laços de Família", autor:"Clarice Lispector", páginas:144 },
 { ISBN:6580722029, título:"O Pica-Pau Amarelo", autor:"Monteiro Lobato", páginas:144 },
 { ISBN:8580578892, título:"O universo numa casca de noz", autor:"Stephen Hawking", páginas:224 },
 { ISBN:8534705259, título:"Olhos de Água", autor:"Conceição Evaristo", páginas:116 },
 { ISBN:6550970431, título:"Orgulho e Preconceito", autor:"Jane Austen", páginas:288 },
 { ISBN:8526022253, título:"O Povo Brasileiro: A formação e o sentido Brasil", autor:"Darcy Ribeiro", páginas:368 },
 { ISBN:8577533360, título:"Pedagogia do Oprimido", autor:"Paulo Freire", páginas:245 },
 { ISBN:8535925481, título:"Raízes do Brasil", autor:"Sérgio Buarque", páginas:256 },
 { ISBN:8582850409, título:"Romeu e Julieta", autor:"William Shakespeare", páginas:248 },
 { ISBN:8535933921, título:"Sapiens: Uma breve história da humanidade", autor:"Yuval Harari", páginas:472 },
 { ISBN:8501114782, título:"Vidas Secas", autor:"Graciliano Ramos", páginas:176 }
]);


// Consultando os dados (livros) na coleção (livraria)
// Por padrão, a consulta é ordenada na ordem em que os dados foram inseridos.
db.Livraria.find();
// Caso queira consultar de uma maneira filtrada, será necessário colocar uma condição dentro dos parênteses. O "{_id:0}" serve para omitir o número ObjectId que é mostrado de forma desnecessária, considerando os ISBN dos livros, mas obrigatória para o MongoDB.
db.Livraria.find({}, {_id:0}).sort({título:1}); // Consulta os livros em ordem alfabética, de 0 a 9 e A a Z
db.Livraria.find({}, {_id:0}).sort( { autor: 1 } ); // Consulta os livros por número de páginas em ordem crescente
db.Livraria.find( { páginas: { $gt: 1000 } },{ _id: 0} ); // Consulta os livros com mais de 1000 páginas (ambos os Dicionários)
db.Livraria.find( { título: /^C/ }, { _id: 0 }); // Consulta os livros que começam com a letra C
db.Livraria.find( { título: { $not: /^(A |O )/} }, { _id: 0} ); // Títulos que NÃO começam com artigo definido
db.Livraria.find( { título: /Buarque$/ }, { _id: 0 }); // Três livros escritos por membros da mesma família, ou árvore genealógica
db.Livraria.countDocuments( {} ); // Consulta quantas entradas (livros) há na tabela (livraria)


// Inserção de um novo campo, este para saber se o livro é nacional ou não
db.Livraria.updateMany({},{$set: {nacional:1}});
// Marcação de livros de escritores brasileiros. Os valores ISBN abaixo se referem aos livros que NÃO são brasileiros.
db.Livraria.updateOne( { ISBN: 6555522267 }, { $set: { nacional:0 } });
db.Livraria.updateOne( { ISBN: 8594318596 }, { $set: { nacional:0 } });
db.Livraria.updateOne( { ISBN: 8594318782 }, { $set: { nacional:0 } });
db.Livraria.updateOne( { ISBN: 8535923438 }, { $set: { nacional:0 } });
db.Livraria.updateOne( { ISBN: 6550970431 }, { $set: { nacional:0 } });
db.Livraria.updateOne( { ISBN: 8535930485 }, { $set: { nacional:0 } });
db.Livraria.updateOne( { ISBN: 6555520809 }, { $set: { nacional:0 } });
db.Livraria.updateOne( { ISBN: 8582850409 }, { $set: { nacional:0 } });
db.Livraria.updateOne( { ISBN: 8580578892 }, { $set: { nacional:0 } });
db.Livraria.updateOne( { ISBN: 8535933921 }, { $set: { nacional:0 } });

// Consultando os livros em ordem priorizando os brasileiros
db.Livraria.find({}, {_id:0}).sort({nacional:-1});
db.Livraria.find( { nacional: 1 },{ _id: 0} ); // Consulta apenas livros brasileiros
db.Livraria.find( { nacional: 0 },{ _id: 0} ); // Consulta apenas livros estrangeiros


// Remoção de um campo nos documentos
db.Livraria.updateMany({},{ $unset: { autor: "" } });
// Inserção de dois novos campos nos documentos, nomes e sobrenomes dos escritores dos respectivos livros
db.Livraria.updateOne( { ISBN: 6555522267 }, { $set: { nome:"George", sobrenome:"Orwell" } });
db.Livraria.updateOne( { ISBN: 8594318596 }, { $set: { nome:"Tzu", sobrenome:"Sun" } });
db.Livraria.updateOne( { ISBN: 8594318782 }, { $set: { nome:"Franz", sobrenome:"Kafka" } });
db.Livraria.updateOne( { ISBN: 8535923438 }, { $set: { nome:"Friedrich", sobrenome:"Nietzsche" } });
db.Livraria.updateOne( { ISBN: 6550970431 }, { $set: { nome:"Fyodor", sobrenome:"Dostoyévsky" } });
db.Livraria.updateOne( { ISBN: 8535930485 }, { $set: { nome:"Malala", sobrenome:"Yousafzai" } });
db.Livraria.updateOne( { ISBN: 6555520809 }, { $set: { nome:"Stephen", sobrenome:"Hawking" } });
db.Livraria.updateOne( { ISBN: 8582850409 }, { $set: { nome:"Jane", sobrenome:"Austen" } });
db.Livraria.updateOne( { ISBN: 8580578892 }, { $set: { nome:"William", sobrenome:"Shakespeare" } });
db.Livraria.updateOne( { ISBN: 8535933921 }, { $set: { nome:"Yuval", sobrenome:"Harari" } });
db.Livraria.updateOne( { ISBN: 8579624169 }, { $set: { nome:"Marcelo", sobrenome:"Paiva" } });
db.Livraria.updateOne( { ISBN: 8535904174 }, { $set: { nome:"Chico", sobrenome:"Buarque" } });
db.Livraria.updateOne( { ISBN: 8535911693 }, { $set: { nome:"Jorge", sobrenome:"Amado" } });
db.Livraria.updateOne( { ISBN: 8542213742 }, { $set: { nome:"Paulo", sobrenome:"Lins" } });
db.Livraria.updateOne( { ISBN: 8535915389 }, { $set: { nome:"Lygia", sobrenome:"Fagundes" } });
db.Livraria.updateOne( { ISBN: 6598002192 }, { $set: { nome:"Brasil", sobrenome:"" } });
db.Livraria.updateOne( { ISBN: 9788538583 }, { $set: { nome:"Aurélio", sobrenome:"Buarque" } });
db.Livraria.updateOne( { ISBN: 8573029633 }, { $set: { nome:"Antônio", sobrenome:"Houaiss" } });
db.Livraria.updateOne( { ISBN: 8578887239 }, { $set: { nome:"Machado", sobrenome:"Assis" } });
db.Livraria.updateOne( { ISBN: 8535933581 }, { $set: { nome:"Ailton", sobrenome:"Krenak" } });
db.Livraria.updateOne( { ISBN: 6555320249 }, { $set: { nome:"Clarice", sobrenome:"Lispector" } });
db.Livraria.updateOne( { ISBN: 6580722029 }, { $set: { nome:"Monteiro", sobrenome:"Lobato" } });
db.Livraria.updateOne( { ISBN: 8534705259 }, { $set: { nome:"Conceição", sobrenome:"Evaristo" } });
db.Livraria.updateOne( { ISBN: 8526022253 }, { $set: { nome:"Darcy", sobrenome:"Ribeiro" } });
db.Livraria.updateOne( { ISBN: 8577533360 }, { $set: { nome:"Paulo", sobrenome:"Freire" } });
db.Livraria.updateOne( { ISBN: 8535925481 }, { $set: { nome:"Sérgio", sobrenome:"Buarque" } });
db.Livraria.updateOne( { ISBN: 8501114782 }, { $set: { nome:"Graciliano", sobrenome:"Ramos" } });
// Os dados acima colocados nos novos campos irão formar o nome do autor de uma forma muito comum em livros, que é no formato "SOBRENOME, Nome". O formato "sobrenome nome" (nessa ordem) é padrão nos idiomas da Ásia Oriental e no húngaro.
// Criando no formato "SOBRENOME, Nome" e consultando depois
db.Livraria.updateMany({}, [ { $set: { autor: { $concat: [ {$toUpper: "$sobrenome"},", ","$nome"]}}}]);
db.Livraria.find({}, { autor:1, _id:0 });


// O comando abaixo irá consultar os dados dos respectivos livros de uma forma personalizada. A consulta renderizada estará no arquivos de saída (consoles das IDEs como .txt, .xls, .xml, .csv e JSON).
db.Livraria.updateMany({},{ $unset: { sobrenome: "", nome: "" } });
db.Livraria.find({}, { _id:0 }).sort({nacional:-1});


// Os comandos abaixo deletam os dados inseridos e descarta a tabela inteira. 
db.Livraria.deleteMany({}); // AVISO: ISTO IRÁ APAGAR TODOS OS DADOS DA TABELA! USE COM CUIDADO.
db.Livraria.drop(); // IRÁ DESCARTAR A TABELA INTEIRA.
