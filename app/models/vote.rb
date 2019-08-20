# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :video

  enum kind: { up_voted: 1, down_voted: 2 }

  validates :user_id, uniqueness: { scope: :video_id }
end
