### Testes para a API de exemplo do curso de APIs do viniciuspessoni.com

Essa framewok de teste foi desenvolvida usando Ruby, Rspec e HttParty.

Os testes exercitam os métodos GET, POST, PUT e DELETE do micro-serviço clientes.

Para executar TODOS os testes, abra a pasta dos testes no terminal e execute:

    rspec .\ExemploTesteApi_Rspec.rb --format doc

Para executar um teste em específico, precisamos usar tags nos exemplos. Colocamos um symbol para isso após a aspas duplas, com vírgula e antes do "do" que inicia o método. 

   "Quando eu deletar um cliente, Então ele deve ser removido com sucesso", :deletar => true

E executamos com essa tag na linha de comando:

    rspec .\ExemploTesteApi_Rspec.rb --tag deletar

[viniciuspessoni.com/downloads]( https://www.viniciuspessoni.com/downloads)

Me Segue =}

😍 [YouTube]( https://www.youtube.com/c/pessonizando) 

💗 [Instagram](https://www.instagram.com/pessonizando)

⭐ [Telegram](https://t.me/pessonizando)
