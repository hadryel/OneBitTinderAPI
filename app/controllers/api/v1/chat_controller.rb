class Api::V1::ChatController < ApplicationController
  def index
    @matches = current_user.matches.left_joins(:messages)
                           .group(:id)
                           .having("COUNT(messages.*) > 0")
                           .paginate(page: params[:page] || 1)
    render "api/v1/matches/index"
  end
end
