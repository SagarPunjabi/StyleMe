class ApplicationController < ActionController::Base
  def welcome
    render html: 'Welcome to outfit planner!'
  end
end
