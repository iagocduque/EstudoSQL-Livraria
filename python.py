# NOTA: Aqui, trabalha-se com orientação a objetos, não com um banco de dados. A linguagem Python de fato possui integração com o SQLite ("import sqlite3") para trabalhar com bancos de dados, mas o foco aqui é em orientação a objetos. Logo, não há atribuição de chaves primária ou estrangeira. Os livros serão criados aqui como objetos atribuídos a uma classe (Livro, no caso) e registrados em uma variável, não como valores em uma tabela.

## Criando a classe livro
class Livro():
# Assim como nos bancos de dados, serão atribuídos os tipos de dados com base no que o Python aceita. "int" para números inteiros, "str" para textos e "bool" para booleanos (True ou False).
 def __init__ (self,ISBN,titulo,autor,paginas,nacional):
  self.ISBN=int(ISBN)
  self.titulo=str(titulo)
  self.autor=str(autor)
  self.paginas=int(paginas)
  self.nacional=bool(nacional)


## Criando uma livraria como classe
class Livraria():
 def __init__(self,lista):  # Define uma lista de livros na livraria como classe
  self.lista=[]
 def livros(self):  # Exibe todos os livros presentes na livraria
  for l in self.lista:
   print(f"[{l.ISBN}] {l.titulo} ({l.autor}, {l.paginas} páginas)")
 def livrosbrasileiros(self):  # Exibe apenas livros brasileiros presentes na livraria
  for l in self.lista:
   if l.nacional==True:
    print(f"[{l.ISBN}] {l.titulo} ({l.autor}, {l.paginas} páginas)")
 def livrosestrangeiros(self):  # Exibe apenas livros estrangeiros presentes na livraria
  for l in self.lista:
   if l.nacional==False:
    print(f"[{l.ISBN}] {l.titulo} ({l.autor}, {l.paginas} páginas)")
# O "void" abaixo irá exibir o nome do autores de uma forma muito comum em livros, que é no formato "SOBRENOME, Nome". O formato "sobrenome nome" (nessa ordem) é padrão nos idiomas da Ásia Oriental e no húngaro.
 def autores(self):
  for l in self.lista:
   print(f"{l.autor.split()[-1].upper()}, {l.autor.split()[0]}")
 def inserirlivro(self,l):  # Insere um livro na livraria
  if type(l)!=Livro:
   print("Isto não é um livro.")
  else:
   self.lista.append(l)
   print(f"Livro {l.titulo} inserido.")
 def verlivro(self,l):  # Consulta um livro presente na livraria
  if l in self.lista:
   print(f"[{l.ISBN}] {l.titulo} ({l.autor}, {l.paginas} páginas)")
  else:
   print("Esta livraria não tem esse livro.")
 def paginas(self,l):  # Consulta um número de páginas de um livro
  if l in self.lista:
   print(f"{l.paginas} páginas")
  else:
   print("Esta livraria não tem esse livro.")
 def removerlivro(self,l):  # Remove um livro da livraria
  if l in self.lista:
   print(f"Livro {l.titulo} removido.")
   self.lista.remove(l)
  else:
   print("Esta livraria não tem esse livro.") # Uma mensagem de erro será exibida


## Criando variáveis com o operador de atribuição "=" (não confundir com "==", sinal de igual)
# Assim como no "INSERT INTO Tabela VALUES" nas linguagens SQL, os dados devem ser inseridos na respectiva ordem explícita na criação da classe. Se os dados forem inseridos em outra ordem, não na respectiva, ou terá um erro na criação da variável (pois os tipos não condizem) ou os dados incorretos serão exibidos.
mcmlxxxiv=Livro(6555522267,'1984','George Orwell',334,False)
# NOTA: O Python não aceita variáveis em forma de números. O livro "1984" de George Orwell foi referido como variável em forma de número romano (que usa letras).
a_arte_da_guerra=Livro(8594318596,'A Arte da Guerra','Sun Tzu',160,False)
a_metamorfose=Livro(8594318782,'A Metamorfose','Franz Kafka',96,False)
ainda_estou_aqui=Livro(8579624169,'Ainda Estou Aqui','Marcelo Rubens Paiva',296,True)
assim_falou_zaratustra=Livro(8535930485,'Assim Falou Zaratustra','Friedrich Nietzsche',360,False)
budapeste=Livro(8535904174,'Budapeste','Chico Buarque',176,True)
capitaes_da_areia=Livro(8535911693,'Capitães da Areia','Jorge Amado',283,True)
cidade_de_deus=Livro(8542213742,'Cidade de Deus', 'Paulo Lins',400,True)
ciranda_de_pedra=Livro(8535915389,'Ciranda de Pedra','Lygia Telles Fagundes',224,True)
constituicao_de_mcmlxxxviii=Livro(6598002192,'Constituição de 1988','Brasil',303,True)
crime_e_castigo=Livro(6555520809,'Crime e Castigo','Fyodor Dostoyévsky',240,False)
dicionario_aurelio=Livro(9788538583,'Dicionário Aurélio','Aurélio Buarque',2272,True)
dicionario_houaiss=Livro(8573029633,'Dicionário Houaiss','Antônio Houaiss',1986,True)
dom_casmurro=Livro(8578887239,'Dom Casmurro','Machado de Assis',208,True)
eu_sou_malala=Livro(8535923438,'Eu sou Malala','Malala Yousafzai',360,False)
ideias_para_adiar_o_fim_do_mundo=Livro(8535933581,'Ideias para adiar o fim do mundo','Ailton Krenak',104,True)
lacos_de_familia=Livro(6555320249,'Laços de Família','Clarice Lispector',144,True)
o_picapau_amarelo=Livro(6580722029,'O Pica-Pau Amarelo','Monteiro Lobato',144,True)
o_universo_numa_casca_de_noz=Livro(8580578892,'O universo numa casca de noz','Stephen Hawking',224,False)
olhos_de_agua=Livro(8534705259,'Olhos de Água','Conceição Evaristo',116,True)
orgulho_e_preconceito=Livro(6550970431,'Orgulho e Preconceito','Jane Austen',288,False)
o_povo_brasileiro=Livro(8526022253,'O Povo Brasileiro: A formação e o sentido Brasil','Darcy Ribeiro',368,True)
pedagogia_do_oprimido=Livro(8577533360,'Pedagogia do Oprimido','Paulo Freire',245,True)
raizes_do_brasil=Livro(8535925481,'Raízes do Brasil','Sérgio Buarque',256,True)
romeu_e_julieta=Livro(8582850409,'Romeu e Julieta','William Shakespeare',248,False)
sapiens=Livro(8535933921,'Sapiens: Uma breve história da humanidade','Yuval Harari',472,False)
vidas_secas=Livro(8501114782,'Vidas Secas','Graciliano Ramos',176,True)

## Criando a livraria
livraria=Livraria([])
## Inserindo cada livro criado, como objeto, na livraria
livraria.inserirlivro(mcmlxxxiv)
livraria.inserirlivro(a_arte_da_guerra)
livraria.inserirlivro(a_metamorfose)
livraria.inserirlivro(ainda_estou_aqui)
livraria.inserirlivro(assim_falou_zaratustra)
livraria.inserirlivro(budapeste)
livraria.inserirlivro(capitaes_da_areia)
livraria.inserirlivro(cidade_de_deus)
livraria.inserirlivro(ciranda_de_pedra)
livraria.inserirlivro(constituicao_de_mcmlxxxviii)
livraria.inserirlivro(crime_e_castigo)
livraria.inserirlivro(dicionario_aurelio)
livraria.inserirlivro(dicionario_houaiss)
livraria.inserirlivro(eu_sou_malala)
livraria.inserirlivro(ideias_para_adiar_o_fim_do_mundo)
livraria.inserirlivro(lacos_de_familia)
livraria.inserirlivro(o_picapau_amarelo)
livraria.inserirlivro(o_universo_numa_casca_de_noz)
livraria.inserirlivro(olhos_de_agua)
livraria.inserirlivro(orgulho_e_preconceito)
livraria.inserirlivro(o_povo_brasileiro)
livraria.inserirlivro(pedagogia_do_oprimido)
livraria.inserirlivro(raizes_do_brasil)
livraria.inserirlivro(romeu_e_julieta)
livraria.inserirlivro(sapiens)
livraria.inserirlivro(vidas_secas)
livraria.livros()  # Retorna todos os livros incluídos (logo, disponíveis) na livraria
livraria.livrosbrasileiros()  # Retorna os livros brasileiros disponíveis
livraria.livrosestrangeiros()  # Retorna os livros estrangeiros disponíveis
livraria.autores()  # Retorna os autores dos livros disponíveis
livraria.removerlivro(sapiens)  # Remove o livro "Sapiens: Uma breve história da humanidade" da livraria
livraria.verlivro(sapiens)  # Com o livro removido (logo, indisponível) da livraria, esta ação irá resultar num erro e nada acontecerá.
livraria.verlivro(budapeste)  # Este está disponível. Logo, consulta o livro "Budapeste" e os dados do mesmo.
livraria.paginas(dicionario_aurelio)  # Retorna quantas páginas possui o livro "Dicionário Aurélio"
livraria.paginas(sapiens)  # Mesmo erro do "verlivro(self)".
livraria.inserirlivro(sapiens)  # Conserta ambos os retornos de erro acima
