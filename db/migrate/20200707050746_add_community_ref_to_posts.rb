# frozen_string_literal: true

class AddCommunityRefToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :community, null: false, foreign_key: true
  end
end
