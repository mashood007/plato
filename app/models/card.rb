class Card < ApplicationRecord
  belongs_to :board

  belongs_to :parent, :class_name => "Card", :foreign_key => "parent_id", optional: true
  has_many :children, :class_name => "Card", :foreign_key => "parent_id"
  has_many :tasks, dependent: :destroy
  validates_length_of :title,  maximum: 288, presence: true

  def completed
    tasks.where(completed: true).blank?
  end

  def self.competed_cards
    self.distinct.joins(:tasks).where("tasks.completed = true")
  end

  def self.uncompleted_cards 
  	self.distinct.joins(:tasks).where("tasks.completed = false")
  end


end
