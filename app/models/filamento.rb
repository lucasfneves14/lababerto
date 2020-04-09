class Filamento < ApplicationRecord
	attr_accessor :dono_aux
	attr_accessor :material_aux
	attr_accessor :cor_aux
	has_many :printings, dependent: :destroy



	validates :material, presence: true
	validates :cor, presence: true
	validates :dono, presence: true
	validates :massa, presence: true
	validates :diametro, presence: true

end
