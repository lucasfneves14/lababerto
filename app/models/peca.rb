class Peca < ApplicationRecord
  mount_uploader :attachment, StlUploader
  belongs_to :order
  has_many :printings, dependent: :destroy
  attr_accessor :material_aux
  attr_accessor :cor_aux


  validates :name, presence: true
  validates :material, presence: true
  validates :cor, presence: true
  validates :resolucao, presence: true
  validates :infill, presence: true
  validates :massa, presence: true
  validates :tempo, presence: true
  validates :quantidade, presence: true
  validates :attachment, presence: true

end
