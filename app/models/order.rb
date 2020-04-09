class Order < ApplicationRecord
  belongs_to :user
  has_many :pecas, dependent: :destroy
  has_many :printings, dependent: :destroy

  validates :user_id, presence: true
  validates :client, presence: true
  validates :email, presence: true
  validates :cpf, presence: true
  validates :estado, presence: true
  validates :endereco, presence: true
  validates :tipo, presence: true
  validates :canal, presence: true
  validates :prazo, presence: true
  validates :preco, presence: true
  validates :descricao, presence: true
end
