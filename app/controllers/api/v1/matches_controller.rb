class Api::V1::MatchesController < ApplicationController
  def index
    @matches = current_user.matches.paginate(page: params[:page] || 1)
  end


  def destroy
    @match = current_user.matches.find(params[:id])
    @match.destroy
    head :ok
  end
end
