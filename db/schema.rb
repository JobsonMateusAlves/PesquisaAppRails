# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "Cidades", primary_key: "codigo_cidade", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome_cidade", limit: 50
  end

  create_table "EstadoCivils", primary_key: "codigo_estado_civil", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "descricao_estado_civil", limit: 20
  end

  create_table "FaixaEtarias", primary_key: "codigo_faixa_etaria", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "descricao_faixa_etaria", limit: 20
  end

  create_table "Fontes", primary_key: "codigo_fonte", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "descricao_fonte", limit: 50
  end

  create_table "HistoricoCadastros", primary_key: "codigo_cadastro", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome_pessoa_cadastrada", limit: 100
    t.datetime "data_cadastro"
  end

  create_table "Instrucaos", primary_key: "codigo_instrucao", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "descricao_instrucao", limit: 50
  end

  create_table "Municipios", primary_key: "codigo_municipio", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome_municipio", limit: 50
  end

  create_table "PosicaoTrabalhos", primary_key: "codigo_posicao_trabalho", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "descricao_posicao_trabalho", limit: 40
  end

  create_table "Profissaos", primary_key: "codigo_profissao", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "descricao_profissao", limit: 80
  end

  create_table "Rendas", primary_key: "codigo_renda", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "descricao_renda", limit: 40
  end

  create_table "UFs", primary_key: "codigo_UF", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome_UF", limit: 2
  end

  create_table "pessoas", primary_key: "numero_registro", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "codigo_fonte", null: false
    t.string "cpf", limit: 11, null: false
    t.string "nome", limit: 100, null: false
    t.string "email", limit: 40, null: false
    t.string "telefone", limit: 30, null: false
    t.string "celular", limit: 30, null: false
    t.string "cep", limit: 10, null: false
    t.integer "codigo_UF", null: false
    t.integer "codigo_cidade", null: false
    t.integer "codigo_municipio", null: false
    t.string "sexo", limit: 1, null: false
    t.date "data_nascimento", null: false
    t.integer "codigo_faixa_etaria", null: false
    t.integer "codigo_estado_civil", null: false
    t.string "classe_social", limit: 1, null: false
    t.integer "codigo_instrucao", null: false
    t.integer "codigo_renda", null: false
    t.integer "codigo_profissao", null: false
    t.integer "codigo_posicao_trabalho", null: false
    t.string "imovel", limit: 30, null: false
    t.string "funcionario", limit: 30, null: false
    t.string "moradia", limit: 20, null: false
    t.boolean "possui_carro", null: false
    t.string "raca", limit: 10, null: false
    t.index ["codigo_UF"], name: "codigo_UF"
    t.index ["codigo_cidade"], name: "codigo_cidade"
    t.index ["codigo_estado_civil"], name: "codigo_estado_civil"
    t.index ["codigo_faixa_etaria"], name: "codigo_faixa_etaria"
    t.index ["codigo_fonte"], name: "codigo_fonte"
    t.index ["codigo_instrucao"], name: "codigo_instrucao"
    t.index ["codigo_municipio"], name: "codigo_municipio"
    t.index ["codigo_posicao_trabalho"], name: "codigo_posicao_trabalho"
    t.index ["codigo_profissao"], name: "codigo_profissao"
    t.index ["codigo_renda"], name: "codigo_renda"
  end

  add_foreign_key "pessoas", "Cidades", column: "codigo_cidade", primary_key: "codigo_cidade", name: "pessoas_ibfk_3"
  add_foreign_key "pessoas", "EstadoCivils", column: "codigo_estado_civil", primary_key: "codigo_estado_civil", name: "pessoas_ibfk_6"
  add_foreign_key "pessoas", "FaixaEtarias", column: "codigo_faixa_etaria", primary_key: "codigo_faixa_etaria", name: "pessoas_ibfk_5"
  add_foreign_key "pessoas", "Fontes", column: "codigo_fonte", primary_key: "codigo_fonte", name: "pessoas_ibfk_1"
  add_foreign_key "pessoas", "Instrucaos", column: "codigo_instrucao", primary_key: "codigo_instrucao", name: "pessoas_ibfk_8"
  add_foreign_key "pessoas", "Municipios", column: "codigo_municipio", primary_key: "codigo_municipio", name: "pessoas_ibfk_4"
  add_foreign_key "pessoas", "PosicaoTrabalhos", column: "codigo_posicao_trabalho", primary_key: "codigo_posicao_trabalho", name: "pessoas_ibfk_10"
  add_foreign_key "pessoas", "Profissaos", column: "codigo_profissao", primary_key: "codigo_profissao", name: "pessoas_ibfk_9"
  add_foreign_key "pessoas", "Rendas", column: "codigo_renda", primary_key: "codigo_renda", name: "pessoas_ibfk_7"
  add_foreign_key "pessoas", "UFs", column: "codigo_UF", primary_key: "codigo_uf", name: "pessoas_ibfk_2"
end
