class Printer < ApplicationRecord
	mount_uploader :attachment, PrinterUploader
	attr_accessor :modelo_aux
	attr_accessor :tipo_aux

	has_many :printings, dependent: :destroy


	validates :name, presence: true
  	validates :modelo, presence: true
  	validates :tipo, presence: true
  	validates :x, presence: true
  	validates :y, presence: true
  	validates :z, presence: true
end
