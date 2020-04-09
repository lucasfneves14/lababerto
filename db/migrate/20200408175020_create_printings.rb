class CreatePrintings < ActiveRecord::Migration[5.2]
  def change
    create_table :printings do |t|
      t.float :tempo
      t.float :massa
      t.integer :quantidade
      t.float :resolucao
      t.float :infill
      t.string :cor
      t.string :material
      t.references :filamento, foreign_key: true
      t.references :printer, foreign_key: true
      t.references :user, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
