class Organisation < ApplicationRecord
	has_many :users, dependent: :destroy
	has_many :boards, dependent: :destroy
	accepts_nested_attributes_for :users
	validates :name, presence: true
	belongs_to :subscription, optional: true
end
