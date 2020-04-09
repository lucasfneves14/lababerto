class AddPecaIdToPrintings < ActiveRecord::Migration[5.2]
  def change
    add_reference :printings, :peca, foreign_key: true
  end
end
