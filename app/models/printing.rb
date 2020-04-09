class Printing < ApplicationRecord
  belongs_to :filamento
  belongs_to :printer
  belongs_to :user
  belongs_to :peca
  belongs_to :order


  validates :filamento_id, presence: true
  validates :user_id, presence: true
  validates :printer_id, presence: true
  validates :peca_id, presence: true


  validates :material, presence: true
  validates :cor, presence: true
  validates :resolucao, presence: true
  validates :infill, presence: true
  validates :massa, presence: true
  validates :tempo, presence: true
  validates :quantidade, presence: true

end
