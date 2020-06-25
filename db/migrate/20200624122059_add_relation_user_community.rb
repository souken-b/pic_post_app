# frozen_string_literal: true

class AddRelationUserCommunity < ActiveRecord::Migration[6.0]
  def change
    add_reference :communities, :user, null: false, foreign_key: true
  end
end
