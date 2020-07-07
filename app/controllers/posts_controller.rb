# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.where(community_id: params[:community_id])
    @community = Community.find(params[:community_id])
  end

  def new
    @community = Community.find(params[:community_id])
    @post = Post.new
  end

  def create
    Post.create!(post_params)
    redirect_to posts_path(community_id: post_params[:community_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id, :community_id)
  end
end
