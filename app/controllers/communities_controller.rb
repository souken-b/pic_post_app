# frozen_string_literal: true

class CommunitiesController < ApplicationController
  before_action :sign_in_required
  def index
    @communities = Community.all
  end

  def index_my
    @communities = Community.where(user_id: current_user.id)
  end

  def new
    @community = Community.new
  end

  def create
    Community.create!(community_params)
    redirect_to communities_path
  end

  def edit
    @community = Community.find(params[:id])
  end

  def update
    community = Community.find(params[:id])
    community.update(community_params)
    redirect_to index_my_community_path
  end

  private

  def community_params
    params.require(:community).permit(:name, :user_id)
  end
end
