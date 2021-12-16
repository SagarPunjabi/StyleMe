require 'test_helper'

class ClotheTest < ActiveSupport::TestCase
  def setup
    @user = User.new(id: 1, name: 'Example User', email: 'user@example.com', password: 'password123')
    @clothe = Clothe.new(user: @user, quadrant: 'Top', clothing_category: 'T-Shirt', color: '#c7c7c7',
                         occasion: 'casual')
  end
  test 'should be valid' do
    assert @clothe.valid?
  end
  test 'userid should be present' do
    @clothe.user_id = nil
    assert_not @clothe.valid?
  end
 
end
