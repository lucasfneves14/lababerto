class AddNameToPecas < ActiveRecord::Migration[5.2]
  def change
    add_column :pecas, :name, :string
  end
end
