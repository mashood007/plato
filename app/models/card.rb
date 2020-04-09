class Card < ApplicationRecord
  belongs_to :board

  belongs_to :parent, :class_name => "Card", :foreign_key => "parent_id", optional: true
  has_many :children, :class_name => "Card", :foreign_key => "parent_id"
  has_many :tasks
  validates_length_of :title,  maximum: 288, presence: true


  def tasks_completed?
  	self.tasks.size == self.tasks.completed_are.size 
  end

  def self.competed_cards
  	self.all.reject{|card| card unless card.tasks_completed? && !card.tasks.blank? }
  end

  def self.uncompleted_cards 
  	self.all.reject{|card| card unless !card.tasks_completed? && !card.tasks.blank? }
  end

end
