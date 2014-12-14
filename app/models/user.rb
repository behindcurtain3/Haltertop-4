# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
 validates :name,
    presence: true,
    uniqueness: { case_sensitive: false	},
    length: { maximum: 25, minimum: 3 }
    
  has_many :games_as_black, 
    foreign_key: "black_id", 
    class_name: "Game"
	
	has_many :games_as_white, 
	  foreign_key: "white_id",
	  class_name: "Game"
	
	has_many :turns,
	  foreign_key: "turn_id",
	  class_name: "Game"  
	  
	scope :recent, -> { order("created_at desc") }
	scope :active, -> { where("result IS NULL") }
	scope :finished, -> { where("result IS NOT NULL") }
	  
	def games
	  games_as_white + games_as_black
	end
  
  def to_param
    name
  end
end
