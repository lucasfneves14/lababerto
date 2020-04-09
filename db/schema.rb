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

ActiveRecord::Schema.define(version: 2020_04_08_194924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "filamentos", force: :cascade do |t|
    t.string "material"
    t.string "cor"
    t.string "dono"
    t.float "massa"
    t.boolean "fechado"
    t.float "diametro"
    t.boolean "uso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.string "tipo"
    t.float "preco"
    t.string "client"
    t.string "cpf"
    t.string "canal"
    t.string "email"
    t.string "telefone"
    t.string "estado"
    t.string "cep"
    t.text "descricao"
    t.string "status"
    t.boolean "entregue"
    t.string "prazo"
    t.string "frete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "endereco"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "pecas", force: :cascade do |t|
    t.float "tempo"
    t.float "massa"
    t.integer "quantidade"
    t.float "resolucao"
    t.float "infill"
    t.string "cor"
    t.string "material"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "attachment"
    t.index ["order_id"], name: "index_pecas_on_order_id"
  end

  create_table "printers", force: :cascade do |t|
    t.string "name"
    t.string "tipo"
    t.float "x"
    t.float "y"
    t.float "z"
    t.boolean "fechada"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "modelo"
  end

  create_table "printings", force: :cascade do |t|
    t.float "tempo"
    t.float "massa"
    t.integer "quantidade"
    t.float "resolucao"
    t.float "infill"
    t.string "cor"
    t.string "material"
    t.bigint "filamento_id"
    t.bigint "printer_id"
    t.bigint "user_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.bigint "peca_id"
    t.index ["filamento_id"], name: "index_printings_on_filamento_id"
    t.index ["order_id"], name: "index_printings_on_order_id"
    t.index ["peca_id"], name: "index_printings_on_peca_id"
    t.index ["printer_id"], name: "index_printings_on_printer_id"
    t.index ["user_id"], name: "index_printings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "admin", default: false
    t.boolean "colaborador", default: false
    t.string "relacionamento"
    t.boolean "first_time", default: true
    t.string "matricula"
    t.string "curso"
    t.string "telefone"
    t.text "bio"
    t.string "attachment"
    t.string "color"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "orders", "users"
  add_foreign_key "pecas", "orders"
  add_foreign_key "printings", "filamentos"
  add_foreign_key "printings", "orders"
  add_foreign_key "printings", "pecas"
  add_foreign_key "printings", "printers"
  add_foreign_key "printings", "users"
end
