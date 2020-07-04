# frozen_string_literal: true

class CommunitiesController < ApplicationController
  before_action :sign_in_required
  before_action :set_community, only: %i[edit update destroy]
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
    redirect_to index_my_community_path
  end

  def edit; end

  def update
    @community.update(community_params)
    redirect_to index_my_community_path
  end

  def destroy
    @community.destroy
    redirect_to index_my_community_path
  end

  private

  def set_community
    @community = Community.find(params[:id])
  end

  def community_params
    params.require(:community).permit(:name, :user_id)
  end
end
