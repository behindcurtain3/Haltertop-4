# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  black_id   :integer
#  white_id   :integer
#  turn_id    :integer
#  result     :string(255)
#  private    :boolean
#  ranked     :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Game < ActiveRecord::Base
  validates :black_id,
    presence: true
    
  validates :white_id,
    presence: true
    
  belongs_to :black, class_name: "User"
  belongs_to :white, class_name: "User"

end
