# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  # Validations
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
end
