class Api::V1::ChatController < ApplicationController
  def index
    page = params[:page] || 1
    @matches = current_user.matches.left_joins(:messages)
                                    .group(:id).having("COUNT(messages.*) > 0").order("created_at DESC")
    render "api/v1/matches/index"
  end
end
