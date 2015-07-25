class Result < ActiveRecord::Base
  # association
  belongs_to :user
  belongs_to :indoorkadai
  belongs_to :indoor
end
