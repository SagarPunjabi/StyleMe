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

  test 'should show clothe' do
    get clothe_url(@clothe)
    assert_response :success
  end

  test 'should get edit' do
    get edit_clothe_url(@clothe)
    assert_response :success
  end

  test 'should destroy clothe' do
    assert_difference('Clothe.count', -1) do
      delete clothe_url(@clothe)
    end

    assert_redirected_to '/users/1'
  end
end
