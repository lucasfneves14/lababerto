class AddAttachmentToPecas < ActiveRecord::Migration[5.2]
  def change
    add_column :pecas, :attachment, :string
  end
end
