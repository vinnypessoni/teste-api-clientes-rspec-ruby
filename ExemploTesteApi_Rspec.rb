require 'rspec'
require 'httparty'
require 'pry'

class TestaCliente

        @@baseURL = "http://localhost:8080/"
        @@recursoCliente = "cliente"

        describe "Testes de API Exemplo Cliente" do
                it "Quando eu requisitar a lista de clientes sem adicionar clientes antes, Então ela deve estar vazia" do
                        resposta = HTTParty.get(@@baseURL)
                        puts resposta.code, resposta.headers, resposta.body
                        expect(resposta.code).to eq(200)
                        expect(resposta.body).to eq("{}")
                end

                it "Quando eu cadastrar um cliente, Então ele deve ser salvo com sucesso" do
                        requestBody = { :nome => 'Vinny', :idade => '30', :id => '1234' }

                        resposta = HTTParty.post(@@baseURL + @@recursoCliente, 
                                :body => requestBody.to_json,
                                :headers => { 'Content-Type' => 'application/json' })
                                
                        puts resposta.code, resposta.headers, resposta.body
                        expect(resposta.code).to eq(201)      
                        expect(resposta.body).to include(requestBody[:nome])   
                        expect(resposta.body).to include(requestBody[:idade])     
                        expect(resposta.body).to include(requestBody[:id])                    
                end

                it "Quando eu atualizar um cliente, Então ele deve ser atualizado com sucesso" do
                        requestBody = { :nome => 'Mickey', :idade => '64', :id => '4545' }
                        resposta = HTTParty.post(@@baseURL + @@recursoCliente, 
                                :body => requestBody.to_json,
                                :headers => { 'Content-Type' => 'application/json' })
                                     
                        requestBody = { :nome => 'Mickey, Mouse', :idade => '18', :id => '4545' }       
                        resposta = HTTParty.put(@@baseURL + @@recursoCliente, 
                                :body => requestBody.to_json,
                                :headers => { 'Content-Type' => 'application/json' })        
                                
                        puts resposta.code, resposta.headers, resposta.body
                        expect(resposta.code).to eq(200)
                        expect(resposta.body).to include(requestBody[:nome])   
                        expect(resposta.body).to include(requestBody[:idade])     
                        expect(resposta.body).to include(requestBody[:id])                    
                end

                it "Quando eu deletar um cliente, Então ele deve ser removido com sucesso", :deletar => true do
                        requestBody = { :nome => 'Minnie Mouse', :idade => '55', :id => '8752' }
                        resposta = HTTParty.post(@@baseURL + @@recursoCliente, 
                                :body => requestBody.to_json,
                                :headers => { 'Content-Type' => 'application/json' })  
                       
                        resposta = HTTParty.delete(@@baseURL + @@recursoCliente +"/#{requestBody[:id]}")
                                
                        puts resposta.code, resposta.headers, resposta.body
                        expect(resposta.code).to eq(200)
                        expect(resposta.body).to include(requestBody[:id])
                        expect(resposta.body).to include("CLIENTE REMOVIDO")
                end

        end
end
      