class Api::V1::MatchesController < ApplicationController
  def index
    @matches = current_user.matches.left_joins(:messages)
                                   .group(:id).having("COUNT(messages.*) <= 0").order("created_at DESC")
  end


  def destroy
    @match = current_user.matches.find(params[:id])
    @match.destroy
    head :ok
  end
end
