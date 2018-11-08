class PessoasController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :criar_conexao

    # Routes
    def create

        pessoa = Pessoa.new(pessoa_params)
        t = Time.at(params[:data_nascimento])
        pessoa.data_nascimento = t.to_date

        successfull = checar_campos(pessoa)

        if successfull
            
            colunas = ""
            contador = 0
            Pessoa.column_names.each do |coluna|
                if contador > 0
                    colunas = (contador == 1) ? "#{colunas} #{coluna}" : "#{colunas}, #{coluna}"
                end
                contador += 1
            end
            
            @conn.execute("  insert into pessoas(#{colunas}) 
                            values( #{pessoa.codigo_fonte}, 
                                    #{pessoa.cpf},
                                    '#{pessoa.nome}',
                                    '#{pessoa.email}',
                                    #{pessoa.telefone},
                                    #{pessoa.celular},
                                    #{pessoa.cep},
                                    #{pessoa.codigo_UF},
                                    #{pessoa.codigo_cidade},
                                    #{pessoa.codigo_municipio},
                                    '#{pessoa.sexo}',
                                    null,
                                    #{pessoa.codigo_faixa_etaria},
                                    #{pessoa.codigo_estado_civil},
                                    '#{pessoa.classe_social}',
                                    #{pessoa.codigo_instrucao},
                                    #{pessoa.codigo_renda},
                                    #{pessoa.codigo_profissao},
                                    #{pessoa.codigo_posicao_trabalho},
                                    '#{pessoa.imovel}',
                                    '#{pessoa.funcionario}',
                                    '#{pessoa.moradia}',
                                    #{pessoa.possui_carro},
                                    '#{pessoa.raca}')")

            #{pessoa.data_nascimento}

            results = @conn.select_one "select * from pessoas order by numero_registro desc limit 1"

            render json: results, status: 201
        else
            render json: {message: "Preencha todos os campos!!"}, status: 418
        end
    end

    def show

        results = @conn.select_all "select * from pessoas order by numero_registro asc"

        render json: results, status: 200
    end

    def show_one

        results = @conn.select_one "select * from pessoas where numero_registro = #{params[:numero_registro]}"

        render json: results, status: 200
    end 

    def update


        
    end

    def destroy
        
        results = @conn.select_one "select * from pessoas where numero_registro = #{params[:numero_registro]}"
        @conn.execute("delete from pessoas where numero_registro = #{params[:numero_registro]}")

        render json: results, status: 200
    end

    # General functions

    def checar_campos(pessoa)

        contador = 0
        successfull = true
        pessoa.attributes.each do |att_name, att_value|
            if contador > 0 
                successfull = !att_value.nil?
                if !successfull
                    puts "#{att_name}"
                    break
                end
            end
            contador += 1
        end 

        successfull
    end
    
    def pessoa_params
        params.permit( :codigo_fonte, 
            :cpf, 
            :nome, 
            :email, 
            :telefone, 
            :celular, 
            :cep, :codigo_UF, 
            :codigo_cidade, 
            :codigo_municipio, 
            :sexo, 
            :data_nascimento, 
            :codigo_faixa_etaria, 
            :codigo_estado_civil, 
            :classe_social, 
            :codigo_instrucao,
            :codigo_renda, 
            :codigo_profissao, 
            :codigo_posicao_trabalho, 
            :imovel, 
            :funcionario, 
            :moradia, 
            :possui_carro, 
            :raca)
    end

    private
    def criar_conexao
        @conn = ActiveRecord::Base.connection
    end
end



# Esse funcionou
        # conn.execute("insert into pessoas(#{colunas}) 
        # values( 1, 
        #         01216946324,
        #         'Mateus',
        #         'aa',
        #         34921280,
        #         988581130,
        #         60421070,
        #         1,
        #         1,
        #         1,
        #         'M',
        #         null,
        #         1,
        #         1,
        #         'M',
        #         1,
        #         1,
        #         1,
        #         1,
        #         'praia',
        #         'empregada',
        #         'Casa propria',
        #         true,
        #         'branca')")

        # def show

        #     results = @conn.select_all "select * from pessoas order by numero_registro asc"
    
        #     render json: results, status: 200
        # end
        # def criar_conexao
        #     @conn = ActiveRecord::Base.connection
        # end