UNIVERSIDADE DE SÃO PAULO

INSTITUTO DE CIÊNCIAS MATEMÁTICAS E DE COMPUTAÇÃO

DEPARTAMENTO DE CIÊNCIAS DE COMPUTAÇÃO

**SCC 540 / SCC 640 – Bases de Dados**

Profa. Elaine Parros Machado de Sousa

# Lista 2 – MER-X

```
Construa o DER para cada um dos sistemas abaixo. Faça considerações adicionais e defina os atributos que julgar necessário. 
```

**1. Universidade**

Um professor deseja armazenar informações sobre os alunos da disciplina que ministra tais como informações pessoais de cada um (número matrícula, nome, curso, período, endereço, média ponderada,etc) e as atividades realizadas para definição da nota final na disciplina. Assim, devem ser armazenados o nome da atividade, a data em que ela ocorreu e o peso na nota final. Sabe-se que uma atividade pode ser realizada somente uma vez por cada aluno. As atividades podem ser trabalhos e provas. Para prova armazena-se o número de questões e se foi teste ou dissertativa. O professor pretende obter relatórios sobre as provas e trabalhos realizados pelos alunos em cada mês de aula

**2. Picolé**

Uma empresa fabricante de picolés deseja armazenar informações acerca de seus negócios. Os picolés fabricados são divididos em frutas e ao leite. Os picolés de frutas podem ser de tomate e jenipapo e os ao leite podem ser de chocolate e groselha. As informações armazenadas dos picolés são: sabor, ingredientes, preço e tipo da embalagem. Todo picolé é vendido em um lote para um determinado revendedor. Todo revendedor possui uma pessoa de contato para eventuais resoluções de problemas. Além disso, armazena-se do revendedor, dados como CNPJ, razão social, nome fantasia, etc. Deseja-se obter relatórios sobre as vendas mensais dos picolés e quais revendedores compraram mais picolés nos últimos meses

**3. Pizzaria**

Uma pizzaria de tele-entrega apresenta um cardápio composto por diversos tipos de pizza, cujos dados são: número do item, nome da pizza, lista de ingredientes e preços das pizzas pequena, média e grande, como por exemplo: (12, francesa, (queijo, presunto, champignon, aspargo), 10.00, 15.00, 18.00). Na pizzaria trabalham funcionários que emitem pedidos de pizzas. Cada pedido possui um número e uma data de emissão, além do nome, telefone e endereço do cliente que solicitou o pedido. Um pedido, emitido por apenas um funcionário, é composto por vários itens: cada item possui um número e se refere a uma determinada pizza do cardápio, em um determinado tamanho (pequena, média ou grande) e em uma certa quantidade. Dos funcionários entregadores (ou seja, responsáveis pela entrega de um ou mais pedidos),deve-se saber o número do telefone celular para um eventual contato durante uma entrega. Uma entrega destina-se a um bairro, e para cada bairro existe um tempo máximo de espera para a entrega de um pedido. Defina outros atributos que julgar relevante

**4. Administradora de Imóveis**

Uma entrevista com o gerente da administradora resultou nas seguintes informações:

- A administradora administra condomínios formados por unidades condominiais (lotes);
- Cada unidade condominial é de propriedade de uma ou mais pessoas. Uma pessoa pode possuir diversasunidades;
- Cada unidade pode estar alugada para no máximo uma pessoa. Uma pessoa pode alugar diversas unidades

**5. Clínica**

Em uma clínica trabalham médicos de diversas especialidades. Cada médico é identificado pelo seu CRM, possui um nome e recebe um salário na clínica. Um médico pode ter formação em diversas especialidades (ortopedia, traumatologia, etc), mas só exerce uma delas na clínica. Para todo paciente internado na clínicasão cadastrados alguns dados pessoais: nome, RG, CPF, endereço, telefone(s) para contato e data do nascimento. Um paciente tem sempre um determinado médico como responsável (com um horário de visitadiário predeterminado), porém vários outros médicos podem participar do seu tratamento. Pacientes estão sempre internados em quartos individuais, que são identificados por um número e ficam em um andar da clínica

**6. Vendas**

O Departamento de Vendas da Indústria Beleza Ltda, após estudos de mercado, verificou que para atingir seus objetivos seria necessário adquirir frota de veículos próprios para motorizar seus vendedores. O mercado consumidor foi dividido em regiões de venda; foram estabelecidos percursos de entrega abrangendo pontos estratégicos dessas regiões e vendedores foram designados para cobrir estes percursos. Um sistema deve ser construído para administração do novo mecanismo de vendas adotado pela empresa. Após entrevistas com o gerente da área, foram obtidas as seguintes informações:

- cada região é identificada por um código;
- uma região é composta de vários pontos estratégicos;
- as regiões não têm pontos estratégicos em comum;
- o vendedor tem a responsabilidade de cobrir uma região;
- uma região pode ser coberta por vários vendedores;
- a cada dia, um veículo fica sob responsabilidade de um vendedor;
- um vendedor pode vender quaisquer itens ativos da tabela de produtos;
- o vendedor é responsável pela identificação de cada cliente consumidor na nota fiscal;
- a nota fiscal contendo identificação do vendedor, itens e quantidades vendidas, é exigida para comprovação da venda

**7. Faculdade**

Uma faculdade oferece vários cursos, cujos currículos são compostos por diversas disciplinas. Cada disciplina pode ser oferecida para vários cursos distintos, além de poder ter outras disciplinas como pré-requisitos seriais ou paralelos, dependendo do curso. Os alunos, como na USP, só podem matricular-se em um único curso. Em cada semestre, os alunos matriculam-se nas disciplinas do seu curso, que são divididas em turmas quando há um grande número de alunos matriculados. Professores podem ministrar várias disciplinas, sendo também atribuídos a turmas específicas. A base de dados deve permitir a geração de listas de presença e de notas, bem como históricos escolares, onde deve constar com que professor um aluno fez qual disciplina. Construa dois diagramas distintos para o mesmo problema: um usando apenas MER e outro usando MER-X (ou seja, usando as abstrações de agregação e/ou generalização)

**8. Farmácia**

Uma farmácia comercializa vários tipos de produtos (remédios, cosméticos, etc.). Além do tipo, para cada produto são registrados o código, designação, composição, fabricante e preço de venda. Quando um cliente compra pela 1ª vez um produto são registrados os seus dados (nome, endereço, telefone, código postal, localidade e número de contribuinte). Depois de cadastrado, sempre que um cliente compra determinado produto é registrado seu código de cliente, os produtos adquiridos, o nome do médico (no caso das receitas médicas), bem como o total de venda. Cada compra é identificada por um número para facilitar as consultas à base de dados

**9. Locadora de vídeos**

Uma pequena locadora de vídeos possui ao redor de 2000 DVDs, cujo empréstimo deve ser controlado. CadaDVD possui um número de identificação e contém um único filme. Cada filme recebe um identificadorpróprio, e sabe-se título e categoria (comédia, drama, aventura,...). Para cada filme cadastrado há pelomenos um DVD. Além disso, filmes mais longos necessitam de dois DVDs.Os clientes podem desejar encontrar os filmes estrelados pelo seu ator predileto. Por isso, é necessáriomanter a informação dos atores que estrelam em cada filme, mas nem todo filme possui estrelas. Muitosclientes, quando vêem a listagem de atores do filme escolhido, ficam interessados em saber, para umdeterminado ator, o seu nome real e de quais outros filmes do mesmo gênero aquele ator participou. Alocadora possui muitos clientes cadastrados, dos quais sabe-se nome e sobrenome, telefone e seu endereçode contato. Além disso, cada cliente recebe um número de associado.Finalmente, o sistema deve permitir a consulta a empréstimos de DVDs, com informações de qualcliente alugou o quê, datas de empréstimo e devolução, valor pago ou a pagar, atrasos, etc... Não sãomantidos registros históricos de empréstimos

**10. Empresa de reparo de automóveis**

Uma empresa de reparo de automóveis pretende implementar um sistema para administrar a informaçãorelativa aos reparos efetuados nos veículos de seus clientes. O sistema de informação deverá permitirmanter um registro de todos os reparos efetuados.A empresa registra as seguintes informações de cada cliente: código de identificação, nome, endereço,telefone. A informação relativa aos veículos que um dado cliente teve ou tem e as datas em que fizeram oprimeiro reparo, também são importantes.Em relação aos funcionários da oficina é necessário registrar a seguinte informação: código deidentificação, nome, endereço, telefone e categoria profissional. O custo/hora da mão-de-obra depende dacategoria do funcionário e é definido por meio de uma tabela que é atualizada regularmente.Em relação a cada reparo é necessário saber: qual veículo, qual cliente, a data em que o reparo foiefetuado e o custo total do reparo. A empresa pretende saber para cada reparo quais peças foram utilizadase o seu preço, bem como o tempo de mão de obra gasto por cada funcionário e o respectivo custo. Ainformação relativa às peças em estoque deverá ser: código de identificação, designação, custo unitário equantidade armazenada

**11. Garagem**

Uma garagem para estacionamento de veículos motorizados pretende implementar um sistema que lhepermita administrar a informação relativa ao estacionamento dos seus clientes. Há 2 tipos deestacionamento: ocasionais e aqueles que se efetuam ao mês. Assim, é registrado o nome do cliente, a placado veículo a estacionar e a identificação do lugar, sendo necessário verificar a disponibilidade de espaço paraestacionamento. Cada estacionamento terá um preço (o ocasional terá um custo por hora e o mensal umcusto fixo), que será diferenciado de acordo com 2 tipos de veículos possíveis de serem estacionados:automóveis ou veículos de 2 rodas

**12. Controle de Estoque de uma Rede de Supermercados**

O sistema de controle de estoque de uma rede de supermercados mantém na base de dados a descrição detodas as informações que permitem a manutenção de seu estoque de mercadorias. O controle é efetuadopara cada ponto de venda da rede, mas centralizado em uma única base de dados, que efetua os pedidos decompra para todos os pontos de venda ao mesmo tempo. Quando um novo produto deve ser comprado, éemitida uma ordem de compra com a quantidade total comprada, indicando também a quantidade doproduto que deve ser entregue em cada ponto de venda. Um pedido de compra pode incluir também maisdo que um produto comprado do mesmo fornecedor.Para que esse sistema possa funcionar, o sistema de controle de estoque mantém três informaçõesfundamentais: o estoque de cada produto existente em cada ponto de venda da rede, as informações sobreos fornecedores e as informações sobre os pedidos em andamento. O estoque consiste na descrição de cadaproduto, incluindo a maneira como ele é medido (por volume, unidade, peso, etc), como é embalado enúmero de embalagens disponíveis em cada armazém. Mantêm-se também os dados sobre os preços decompra e venda, e taxa esperada e medida de venda por mês. Como essas informações são tratadas demaneira centralizada, elas são atualizadas em lotes por meio da comunicação de cada ponto de venda com acentral, e não para cada produto vendido em caixa.Sobre os fornecedores são registrados dados gerais como identificadores, endereços, pontos dedistribuição, etc., e também a relação de produtos disponíveis e prazos de entrega. Todos os pedidos sãomantidos num histórico, onde as várias atividades correspondentes são registradas, além de datas, valores eprodutos envolvidos. As atividades de um pedido são: emissão do pedido de compra, entregas em cadaponto de venda e pagamentos efetuados. Estas atividades podem assumir _status_ de parciais ou totais, alémde confirmação ou não do aceite o pedido e seu respectivo encerramento. Note que em pedido podeconstar de mais de um produto e, nesse caso, cada produto dever ser tratado separadamente

**13. Museu Histórico de São Carlos**

O Museu Histórico de São Carlos em parceria com a Universidade de São Paulo - Campus de São Carlos,exibe atrações sobre a história da cidade, ensinando de forma lúdica e não-formal os acontecimentos queocorreram na cidade de São Carlos e região. O Museu abre de segunda a sexta das 8h às 11h e das 14h às18h. Deseja-se desenvolver um sistema que mantenha o controle das exposições e palestras realizadasdiariamente no Museu.O Museu possui diversas salas onde há exposições temporárias sobre os mais diversos acontecimentosda cidade. Essas exposições possuem tema específico, maquetes, fotografias e objetos de cena. Não há maisde uma exposição com o mesmo tema. Quando uma nova exposição é criada, ela deve ser agendada parauma sala.Para cada sala, mantém-se a informação de seu número e da exposição em andamento. Cada sala alocaapenas uma exposição por um tempo pré-determinado. Também deseja-se manter um histórico deexposições que foram apresentadas naquela sala. Em todas as salas, há um estagiário responsável porreceber o público visitante, ensinando e sanando as dúvidas sobre a exposição. Este estagiário é um aluno degraduação de algum curso da USP. Ele trabalha no Museu em alguns dos horários de funcionamento deste,não podendo exceder a carga horária máxima de 20 horas semanais. Deseja-se guardar a data de início e fimdo período que o estagiário trabalhou no Museu. As salas são atribuídas ao estagiário de acordo com ohorário de funcionamento do museu, de forma que a cada período do dia o estagiário pode ou não trocar desala (i.e. o estagiário pode trabalhar em uma sala no período da manhã e em outra no período da tarde).Além das exposições, o Museu agenda palestras de sua autoria para grupos fechados, como turmasescolares. Cada palestra é agendada em um horário e sala específica, possuindo um palestrante, duração etema. O palestrante é um funcionário contratado do Museu. Do palestrante deseja-se manter o CPF, o nome,idade, período de contratação e salário. Dos grupos de visitantes deseja-se manter as informações doresponsável pelo grupo, o dia da visita, o número de participantes e o tipo do grupo (podendo ser escolaspúblicas, estaduais, grupos particulares, escoteiros, entre outros)

**14. Conferência de Banco de Dados**

Deseja-se construir um sistema para apoiar a organização de Conferências de Banco de Dados. Essesistema automatiza a submissão e revisão de artigos.Uma Conferência acontece no tempo de uma semana, com local, data de ínício e fim, podendo ser umaconferência anual ou semestral. Na conferência participam os organizadores, revisores e inscritos. Aconferência possui prazo máximo para submissão de artigos, podendo ter extensões dessa data.Um artigo deve conter título, autores, número de páginas, data de submissão e pertencer a um ou maistemas propostos pela Conferência dentro da área de Banco de Dados. O artigo só pode ser aceito por 1(uma) conferência, mas pode ser submetido em várias conferências desde que já não tenha sido aceitoanteriormente. Dos autores, deseja-se saber o cpf, o nome e a instituição. Um autor pode submeter um oumais artigos. O autor que submete o artigo deve estar inscrito no evento e não pode ser revisor do próprioartigo.Cada artigo passa por no mínimo três revisores, que atribuirão uma nota individual ao artigo. Essesrevisores são pessoas fazem parte do comitê de organização do evento, podendo submeter artigos também.Os artigos que obtiverem uma nota acima de 5, calculada pela média simples entre as notas individuais, seráincluído nos anais do evento

**15. Rede de Hotéis**

Uma rede de hotéis mantém um Centro de Informações -- CI centralizado, onde processam-se todas astransações dos hotéis filiados à rede, os quais estão espalhados em diversas cidades. Note-se que podehaver mais de um hotel da rede numa mesma cidade. Cada hotel filiado pode ter seu próprio nome, gerentelocal, empregados, etc. Além disso, existem hotéis de diversas categorias. O CI tem uma base de dadoscentralizada, onde encontram-se todas as informações necessárias aos seus vários sistemas computacionais.Quando o CI foi criado, foi feito o levantamento das necessidades dos vários sistemas que deveriam serinstalados. Os itens seguintes indicam uma especificação inicial de 3 dos sistemas desenvolvidos:

**16. Sistema Material Semi-Permanente:**

Este sistema centraliza as compras de materiais semi-permanentes quedevem ser supridos aos hotéis filiados à rede, que são: pratos, aparelhos de mesa, toalhas, talheres, roupade cama, uniformes e cortinas. Como todo esse material deve ser personalizado, devem ser mantidos nabase os dados os fornecedores de cada um. Além disso, determinados hotéis, de acordo com sua categoria,têm necessidade de produtos que um mesmo fornecedor pode não dispor. Por outro lado, podem existirdiversos fornecedores para um mesmo item. Cada item possui uma descrição de suas características, talcomo dimensões para as toalhas e cortinas, componentes dos aparelhos de mesa, etc. Cada requisição decompra pode ser feita apenas a um fornecedor, mas pode englobar diversos itens que aquele fornecedortem condições de atender. Além disso, numa mesma requisição podem ser atendidos itens para mais de umhotel, desde que especificado quantos itens estarão destinados para cada hotel. O sistema mantém oregistro de todas as compras efetuadas para cada hotel, com o respectivo gerente responsável, bem comoinformações comerciais, tais como preço de cada item, descontos oferecidos, etc. Este sistema não cuida dopagamento das compras, o que é efetuado pelo sistema de _Contas a pagar_

**17. Sistema de Registro de Hóspedes:**

Este sistema controla as reservas, entradas e saídas de hóspedes eclientes nos diversos hotéis. Os clientes são classificados em empresas e individuais. Os clientes classificadoscomo empresas podem fazer reservas coletivas e indicar hóspedes para hospedagem, enquanto osindividuais indicam a própria pessoa como hóspede. Cada cliente e cada hóspede têm seus dados pessoaisregistrados e essa informação deve ser repassada para outros sistemas, tais como _Contas a Receber_ ,_Divulgação de Promoções_ , etc. O sistema de registro de hóspedes deve ser capaz de receber reservas,conformá-las, aceitar a entrada e saída de hóspedes, etc., levando em conta os quartos existentes em cadahotel. Cada hotel tem quartos de várias categorias ( _standard_ , luxo, suíte, etc.), e com diferentesconfigurações de acomodações (1 solteiro, 2 solteiros, 2 casais, etc). As reservas podem ser feitas até 24horas antes da hospedagem, e devem ser confirmadas até o final da primeira hora do período dehospedagem reservado. Não havendo reservas, os hotéis podem aceitar hóspedes para hospedagens semreservas. Cada hospedagem registra, para cada pessoa envolvida, a cidade de destino e a cidade de origem,bem como o tipo de hospedagem envolvido em cada caso (com reserva, sem reversa, tipo de acomodação...).Se o hóspede for prosseguir viagem para uma cidade em que haja hotéis da rede, solicita-se ao cliente sedeseja reserva automática. O sistema também cuida dos gastos extras de cada hospedagem, e efetua osdébitos nas contas dos clientes

**18. Sistema de Folha de Pagamento:**

Este sistema cuida do pagamento dos funcionários dos diversos hotéis darede. Existem funcionários que são alocados para um único hotel, e outros que atendem a diversos hotéis,sendo que neste último caso existe um hotel onde o funcionário tem seu vínculo principal tal como, porexemplo, ser nesse hotel que sua inclusão em folha tem efeito. Os funcionários podem ser horistas oumensalistas, além de ser necessário cuidar de uma terceira classe de funcionários autônomos que prestamserviços regularmente para o hotel e cujo pagamento é feito com ordens de serviço solicitadas. Dependendode cada categoria de funcionário, um conjunto de leis pode se aplicar individualmente a cada funcionário,influindo no cálculo dos fatores das parcelas que compõem o salário sendo, portanto, necessário manter umregistro de quais leis aplicam-se a quais funcionários, em alguns casos com os respectivos parâmetros etemporizações. Além disso, todo funcionário tem registro de seu salário base, dependentes, adicionais,gratificações, etc., bem como índices e valores de descontos, tais como INPS, seguridade, etc

**a.** Faça um DER de uma base de dados única que armazene a informação dos 3 sistemas. Destaque quaisforam as informações não contidas na especificação que você incorporou usando seu próprio conhecimento.
