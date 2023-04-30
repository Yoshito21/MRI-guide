class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @imaging = Imaging.find(params[:id])
  end
end
