class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #validation
  validates :username, presence: true
  # association
  has_many :favorites
  has_many :favo_indoors, class_name: "Indoor", foreign_key: "indoor_id", through: :favorites, source: 'user', dependent: :delete_all
  has_many :results
  # paperclip
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :avatar, content_type: %w(image/jpeg image/jpg image/png)
end
