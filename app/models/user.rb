# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  # Associations
  has_many :votes

  # Validations
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }

  def voted?(video_id)
    votes.map(&:video_id).include?(video_id)
  end

  def voted_type(video_id)
    votes.find_by(video_id: video_id)&.kind
  end
end
