class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @occupation = Occupation.find(params[:id])
  end
end
