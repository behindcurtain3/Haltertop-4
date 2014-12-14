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

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  def setup
    @game = games(:one)
  end
  
  test "game should be valid" do
    assert @game.valid?
  end
  
  test "black_id should be present" do
    @game.black_id = nil
    
    assert_not @game.valid?
  end
  
  test "white_id should be present" do
    @game.white_id = nil
    
    assert_not @game.valid?
  end
end
