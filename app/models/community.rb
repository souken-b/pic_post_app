# frozen_string_literal: true

class Community < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :posts, dependent: :destroy
end
