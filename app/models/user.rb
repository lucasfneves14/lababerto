class User < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :orders, dependent: :destroy
   has_many :printings, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
end
