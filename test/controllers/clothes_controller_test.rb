require 'test_helper'

class ClothesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clothe = clothes(:one)
  end

  test 'should get index' do
    get clothes_url
    assert_response :success
  end

  test 'should get new' do
    get new_clothe_url
    assert_response :success
  end

  # test 'should create clothe' do
  #   assert_difference('Clothe.count') do
  #     post clothes_url,
  #          params: { clothe: { clothing_category: @clothe.clothing_category, color: @clothe.color, occasion: @clothe.occasion,
  #                              quadrant: @clothe.quadrant, user_id: @clothe.user_id } }
  #   end

  #   assert_redirected_to clothe_url(Clothe.last)
  # end

  test 'should show clothe' do
    get clothe_url(@clothe)
    assert_response :success
  end

  test 'should get edit' do
    get edit_clothe_url(@clothe)
    assert_response :success
  end

  # test 'should update clothe' do
  #   patch clothe_url(@clothe),
  #         params: { clothe: { clothing_category: @clothe.clothing_category, color: @clothe.color, occasion: @clothe.occasion,
  #                             quadrant: @clothe.quadrant, user_id: @clothe.user_id } }
  #   assert_redirected_to clothe_url(@clothe)
  # end

  test 'should destroy clothe' do
    assert_difference('Clothe.count', -1) do
      delete clothe_url(@clothe)
    end

    assert_redirected_to clothes_url
  end
end
