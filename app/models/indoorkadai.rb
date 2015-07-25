class Indoorkadai < ActiveRecord::Base
  has_attached_file :kadaipic,
                    :styles =>  { medium: "300×300#", thumb: "100×100#" }
  validates_attachment_content_type :kadaipic,
                                    :content_type => ["image/jpg","image/jpeg","image/png"]
  # association
  belongs_to :indoor
  has_many :results
end
