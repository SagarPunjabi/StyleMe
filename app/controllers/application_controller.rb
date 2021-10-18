class ApplicationController < ActionController::Base
  include SessionsHelper
  def welcome
    render html: 'Welcome to outfit planner!'
  end
end
