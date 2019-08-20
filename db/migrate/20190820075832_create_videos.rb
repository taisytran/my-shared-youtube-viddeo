# frozen_string_literal: true

class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :url
      t.text :description
      t.integer :likes
      t.integer :dislikes
      t.string :uid
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
