class AddEnderecoToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :endereco, :string
  end
end
