class Organisation < ApplicationRecord
	has_many :users
	has_many :boards
	accepts_nested_attributes_for :users
	validates :name, presence: true
end
