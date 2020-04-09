class CreatePecas < ActiveRecord::Migration[5.2]
  def change
    create_table :pecas do |t|
      t.float :tempo
      t.float :massa
      t.integer :quantidade
      t.float :resolucao
      t.float :infill
      t.string :cor
      t.string :material
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
