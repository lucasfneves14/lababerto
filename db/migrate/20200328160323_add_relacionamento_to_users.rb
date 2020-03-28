class AddRelacionamentoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :relacionamento, :string
  end
end
