class Api::V1::SelectionListsController < ApplicationController
  def index
    @users = SelectionListService.call(current_user, page: params[:page])
    byebug
    render 'api/v1/users/index'
  end
end