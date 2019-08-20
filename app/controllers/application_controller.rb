# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  before_action :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:resource_id])
  end

  def logged_in?
    current_user != nil
  end

  def authenticate_user!
    if @current_user.nil?
      flash[:error] = 'You must be signed in to view that page.'
      redirect_to root_url
    end
  end
end
