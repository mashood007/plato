class Organisation < ApplicationRecord
	has_many :users
	accepts_nested_attributes_for :users
	validates :name, presence: true
end
