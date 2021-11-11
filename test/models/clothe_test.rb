require 'test_helper'

class ClotheTest < ActiveSupport::TestCase
  def setup
    @clothe = Clothe.new(user_id: 1, quadrant: 'Top', clothing_category: 'T-Shirt', color: '#c7c7c7',
                         occasion: 'casual')
  end
  test 'userid should be present' do
    @clothe.user_id = nil
    assert_not @clothe.valid?
  end
  test 'quadrant should be present' do
    @clothe.quadrant = ''
    assert_not @clothe.valid?
  end
  test 'category should be present' do
    @clothe.clothing_category = ''
    assert_not @clothe.valid?
  end
  test 'color should be present' do
    @clothe.color = ''
    assert_not @clothe.valid?
  end
  test 'occasion should be present' do
    @clothe.occasion = ''
    assert_not @clothe.valid?
  end
end
