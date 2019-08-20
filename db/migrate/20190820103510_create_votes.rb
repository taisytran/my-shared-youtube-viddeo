# frozen_string_literal: true

class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.references :video, foreign_key: true
      t.integer :kind

      t.timestamps
    end
  end
end
