require 'rspec'
require 'httparty'
require 'pry'

class TestaCliente

        @@servicoClientes = "http://localhost:8080"

        describe "Verifica zero clientes cadastrados" do
                it "em getClientes" do
                        resposta = HTTParty.get(@@servicoClientes)
                        puts resposta.code, resposta.headers, resposta.body
                        expect(resposta.code).to eq(200)
                        expect(resposta.body).to eq("{}")
                end
        end

end
      