class AddStatusToPrinting < ActiveRecord::Migration[5.2]
  def change
    add_column :printings, :status, :string
  end
end
