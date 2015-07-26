class Result < ActiveRecord::Base
  # association
  belongs_to :user
  belongs_to :indoorkadai
  belongs_to :indoor

  #validation
  validates :trial, presence: true
  validates :climbtype, presence: true
end
