class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @occupation = Occupation.find_by(params[:occupation_id]) || Occupation.find_by(name: "未登録")
  end

end
