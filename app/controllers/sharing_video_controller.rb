# frozen_string_literal: true

class SharingVideoController < ApplicationController
  before_action :authenticate_user!

  def index
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)

    if @video.save
      flash[:success] = 'A video shared successfully!!!'
      redirect_to root_url
    else
      flash[:error] = @video.errors.full_messages
      render :index
    end
  end

  private

  def video_params
    params.require(:video).permit(:url, :user_id)
  end
end
