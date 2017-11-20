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

ActiveRecord::Schema.define(version: 20170925192638) do

 
  create_table "categoria", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre_categoria"
  end

  create_table "categorias_productos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "categoria_id"
    t.bigint "producto_id"
    t.index ["categoria_id"], name: "index_categorias_productos_on_categoria_id"
    t.index ["producto_id"], name: "index_categorias_productos_on_producto_id"
  end

  create_table "categorias_palabras_clave", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "categoria_id"
    t.bigint "palabra_clave_id"
    t.index ["categoria_id"], name: "index_categorias_palabras_clave_on_categoria_id"
    t.index ["palabra_clave_id"], name: "index_categorias_palabras_clave_on_palabra_clave_id"
  end

  create_table "comentarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "comentario"
    t.bigint "usuario_id"
    t.bigint "producto_id"
    t.index ["producto_id"], name: "index_comentarios_on_producto_id"
    t.index ["usuario_id"], name: "index_comentarios_on_usuario_id"
  end

  create_table "producto_palabras", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "producto_id"
    t.bigint "palabra_clave_id"
    t.index ["producto_id"], name: "index_producto_palabras_on_producto_id"
    t.index ["palabra_clave_id"], name: "index_producto_palabras_on_palabra_clave_id"
  end

  create_table "productos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre_producto"
    t.float "latitud", limit: 24, default: 0.0
    t.float "longitud", limit: 24, default: 0.0
    t.integer "verificado", default: 0
    t.integer "precio_promedio", default: 0
    t.float "rating_precio", limit: 24
    t.float "rating_calidad", limit: 24
    t.text "imagen", limit: 4294967295
    t.integer "cantidad_rating", default: 0
    t.integer "cantidad_precio", default: 0
    t.datetime "ultima_conexion"
    t.datetime "fecha_registro"
    t.string "descripcion"
    t.string "telefono"
    t.bigint "usuario_id"
    t.bigint "membresia_id"
    t.integer "veces_visto"
    t.index ["membresia_id"], name: "index_productos_on_membresia_id"
    t.index ["usuario_id"], name: "index_productos_on_usuario_id"
  end

  create_table "pagos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "producto_id"
    t.datetime "fecha_hora"
    t.text "concepto"
    t.float "monto", limit: 24
    t.text "comentario"
    t.index ["producto_id"], name: "index_pagos_on_producto_id"
  end

  create_table "palabra_claves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "palabra"
  end

  create_table "promocions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.string "descripcion"
    t.integer "aprobada", default: 0
    t.text "poster", limit: 4294967295
    t.datetime "fecha_registro", default: -> { "CURRENT_TIMESTAMP" }
    t.bigint "producto_id"
    t.index ["producto_id"], name: "index_promocions_on_producto_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean "active", default: false
    t.integer "usertype", default: 0
    t.bigint "usuario_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["usuario_id"], name: "index_users_on_usuario_id"
  end

  create_table "usuarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre_usuario"
    t.string "apellidos"
    t.string "celular"
    t.string "correo"
    t.string "contrasena"
    t.boolean "activo", default: true
    t.string "tipo", limit: 1, default: "u"
    t.text "foto", limit: 4294967295
  end

  create_table "vendedors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "codigo"
    t.bigint "usuario_id"
    t.index ["usuario_id"], name: "index_vendedors_on_usuario_id"
  end

  create_table "venta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "usuario_id"
    t.bigint "vendedor_id"
    t.datetime "fecha_venta"
    t.date "fecha"
    t.index ["usuario_id"], name: "index_venta_on_usuario_id"
    t.index ["vendedor_id"], name: "index_venta_on_vendedor_id"
  end

  create_table "version_productos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre_producto"
    t.text "imagen"
    t.integer "aprobado", default: 0
    t.bigint "producto_id"
    t.index ["producto_id"], name: "index_version_productos_on_producto_id"
  end

  add_foreign_key "comentarios", "productos"
  add_foreign_key "comentarios", "usuarios"
  add_foreign_key "producto_palabras", "productos"
  add_foreign_key "producto_palabras", "palabra_claves", column: "palabra_clave_id"
  add_foreign_key "pagos", "productos"
  add_foreign_key "promocions", "productos"
  add_foreign_key "users", "usuarios"

end
