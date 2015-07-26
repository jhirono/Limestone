class Indoorkadai < ActiveRecord::Base
  #paperclip
  has_attached_file :kadaipic,
                    :styles =>  { medium: "300×300#", thumb: "100×100#" }
  validates_attachment_content_type :kadaipic,
                                    :content_type => ["image/jpg","image/jpeg","image/png"]
  # association
  belongs_to :indoor
  has_many :results

  #validation
  validates :wallname, presence: true
  validates :routename, presence: true
  validates :grade, presence: true
end
