# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    authenticate_or_signup!

    redirect_to root_url
  end

  def destroy
    session[:resource_id] = nil
    redirect_to root_url
  end

  private

  def authenticate_or_signup!
    resource = User.find_by_email(resource_params[:email])
    if resource&.authenticate(resource_params[:password])
      session[:resource_id] = resource.id
      flash[:success] = 'Logged In Successfully!!!'
    elsif resource
      # password is invalid
      flash[:error] = 'Invalid Username or Password'
    end

    signup! unless resource
  end

  def signup!
    resource = User.new(resource_params)

    if resource.save
      session[:resource_id] = resource.id
      flash[:success] = 'A account is signup successfully!!!'
    else
      flash[:error] = resource.errors.full_messages
    end
  end

  def resource_params
    params.require(:resource).permit(:email, :password)
  end
end
