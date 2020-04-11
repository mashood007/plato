class Task < ApplicationRecord
	default_scope -> { order(:id) } 

	validates_length_of :title,  maximum: 288, presence: true
	belongs_to :card
end
