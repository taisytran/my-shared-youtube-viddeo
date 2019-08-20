# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @shared_videos = Video.all.order(created_at: :desc)
  end
end
