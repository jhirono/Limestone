class Favorite < ActiveRecord::Base
  # association
  belongs_to :user
  belongs_to :indoor

end
