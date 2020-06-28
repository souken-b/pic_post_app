# frozen_string_literal: true

class CommunitiesController < ApplicationController
  before_action :sign_in_required
  def index
    @communities = Community.all
  end

  def new
    @community = Community.new
  end

  def create
    Community.create!(community_params)
    redirect_to communities_path
  end

  private

  def community_params
    params.require(:community).permit(:name, :user_id)
  end
end
