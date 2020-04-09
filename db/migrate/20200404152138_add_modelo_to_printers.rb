class AddModeloToPrinters < ActiveRecord::Migration[5.2]
  def change
    add_column :printers, :modelo, :string
  end
end
