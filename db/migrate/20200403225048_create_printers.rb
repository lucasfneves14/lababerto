class CreatePrinters < ActiveRecord::Migration[5.2]
  def change
    create_table :printers do |t|
      t.string :name
      t.string :tipo
      t.float :x
      t.float :y
      t.float :z
      t.boolean :fechada
      t.string :attachment

      t.timestamps
    end
  end
end
