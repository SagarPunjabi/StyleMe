require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(email: 'test@gmail.com', password: 'password', password_confirmation: 'password')
  end

  test 'user can login' do
    get '/login'
    assert_response :success
    post '/login', params: { session: { email: 'pyatetskryan@gmail.com',
                                        password: 'password' } }
    assert_response :success
  end
  test 'login with valid information followed by logout' do
    get '/login'
    assert_response :success
    post '/login', params: { session: { email: '',
                                        password: '' } }
    assert_response :success
    delete '/logout'
    assert_redirected_to root_path
  end
end
