# frozen_string_literal: true

class Video < ApplicationRecord
  YT_URL_FORMAT = %r{\A.*(youtu.be/|v/|u/\w/|embed/|watch\?v=|\&v=)([^#\&\?]*).*}i.freeze

  # Associations
  belongs_to :user

  # Validations
  validates :url, presence: true, format: YT_URL_FORMAT

  # Hooks
  before_save :get_info_by_url

  def sharer
    user&.email
  end

  private

  def get_info_by_url
    url = Yt::URL.new self.url
    video = Yt::Video.new id: url&.id

    self.uid = video.id
    self.title = video.title
    self.description = video.description
    self.likes = video.like_count
    self.dislikes = video.dislike_count
  rescue Yt::Errors::NoItems
    self.title = ''
  end
end
