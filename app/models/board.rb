class Board < ApplicationRecord
  belongs_to :organisation
  belongs_to :user
  has_many :cards, dependent: :destroy

  def self.organisation_is organisation_id
  	self.where(organisation_id: organisation_id)
  end

end
