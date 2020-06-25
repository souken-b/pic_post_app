# frozen_string_literal: true

class CommunitiesController < ApplicationController
  before_action :sign_in_required
  def index
    @communities = Community.all
  end
end
