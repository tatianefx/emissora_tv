# encoding: UTF-8
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

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artista", primary_key: "codigo_art", force: true do |t|
    t.string "tipo_artista", limit: 50
  end

  create_table "atua", primary_key: "cod_novela", force: true do |t|
    t.integer "cod_ator", null: false
  end

  create_table "auditorio", primary_key: "codigo_aud", force: true do |t|
    t.string  "tipo",             limit: 30
    t.integer "cod_apresentador"
  end

  create_table "bem", primary_key: "codigo_bem", force: true do |t|
    t.string "descricao_bem", limit: 50
    t.string "tipo_bem",      limit: 20
  end

  create_table "cliente", primary_key: "codigo_cli", force: true do |t|
    t.string "nome_cli",     limit: 50, null: false
    t.string "endereco_cli", limit: 60
    t.string "telefone_cli", limit: 14
  end

  create_table "departamento", primary_key: "codigo_dep", force: true do |t|
    t.string "nome_dep", limit: 50, null: false
  end

  create_table "dependente", primary_key: "nome_dependente", force: true do |t|
    t.integer "cod_fun",              null: false
    t.date    "data_nasc_dependente"
  end

  create_table "dirige", primary_key: "cod_diretor", force: true do |t|
    t.integer "cod_prog", null: false
  end

  create_table "exibe_propaganda", primary_key: "cod_cli", force: true do |t|
    t.integer "cod_prog",                        null: false
    t.string  "descricao_propaganda", limit: 60
    t.float   "valor_propaganda"
  end

  create_table "filme", primary_key: "codigo_filme", force: true do |t|
    t.string "nome",   limit: 50
    t.string "genero", limit: 20
  end

  create_table "funcionario", primary_key: "codigo_fun", force: true do |t|
    t.string  "nome_fun",      limit: 50, null: false
    t.string  "cpf_fun",       limit: 11
    t.date    "data_nasc_fun"
    t.float   "salario_fun"
    t.integer "cod_dep"
  end

  create_table "jornal", primary_key: "codigo_jornal", force: true do |t|
    t.string  "tipo_jornal", limit: 20
    t.integer "cod_ancora"
  end

  create_table "jornalista", primary_key: "codigo_jor", force: true do |t|
    t.string "especialidade_jor", limit: 50
  end

  create_table "novela", primary_key: "codigo_novela", force: true do |t|
    t.date "data_inicio_nov"
    t.date "data_fim_nov"
  end

  create_table "programa", primary_key: "codigo_prog", force: true do |t|
    t.string  "nome_prog",          limit: 50, null: false
    t.string  "dia_prog",           limit: 10
    t.time    "horario_prog"
    t.string  "classificacao_prog", limit: 30
    t.integer "cod_dep"
  end

  create_table "reproduz", primary_key: "cod_prog", force: true do |t|
    t.integer "cod_filme", null: false
  end

  create_table "serie", primary_key: "codigo_serie", force: true do |t|
    t.integer "nro_episodios"
    t.integer "temporada"
    t.date    "data_inicio_serie"
    t.date    "data_fim_serie"
  end

  create_table "tecnico", primary_key: "codigo_tec", force: true do |t|
    t.string "formacao_tec", limit: 50
  end

  create_table "usa", primary_key: "cod_bem", force: true do |t|
    t.integer "cod_dep", null: false
  end

end
