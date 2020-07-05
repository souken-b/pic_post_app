# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:posts).permit(:message, :user_id)
  end
end
