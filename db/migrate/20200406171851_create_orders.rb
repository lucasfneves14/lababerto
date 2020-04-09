class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :tipo
      t.float :preco
      t.string :client
      t.string :cpf
      t.string :canal
      t.string :email
      t.string :telefone
      t.string :estado
      t.string :cep
      t.text :descricao
      t.string :status
      t.boolean :entregue
      t.string :prazo
      t.string :frete

      t.timestamps
    end
  end
end
