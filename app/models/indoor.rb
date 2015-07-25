class Indoor < ActiveRecord::Base
  # association
  has_many :indoorkadais
  has_many :favorites
  has_many :favo_users, class_name: "User", foreign_key: "user_id", through: :favorites, source: 'user', dependent: :delete_all
  has_many :results
end
