class CreateFilamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :filamentos do |t|
      t.string :material
      t.string :cor
      t.string :dono
      t.float :massa
      t.boolean :fechado
      t.float :diametro
      t.boolean :uso

      t.timestamps
    end
  end
end
