class AddDadosToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :matricula, :string
    add_column :users, :curso, :string
    add_column :users, :telefone, :string
  end
end
