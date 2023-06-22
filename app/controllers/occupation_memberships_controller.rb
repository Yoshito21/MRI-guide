class OccupationMembershipsController < ApplicationController

  def index
    @user = User.all
    @occupation = Occupation.find(params[:occupation_id])
    @pending_memberships = @occupation.occupation_memberships.pending
  end

  def create
    @membership = OccupationMembership.new(user_id: params[:user_id], occupation_id: params[:occupation_id])

    if @membership.save
      flash[:success] = '申請が送信されました。'
    else
      flash[:error] = '申請の送信に失敗しました。'
    end

    redirect_to occupation_path(params[:occupation_id])
  end

  def destroy
    @occupation = Occupation.find(params[:id])
    @membership = OccupationMembership.find_by(user_id: current_user.id, occupation_id: @occupation.id)
    @membership.destroy
    flash[:success] = '申請が取り消されました。'
    redirect_to occupation_path(@occupation)
  end

  def accept
    @membership = OccupationMembership.find(params[:id])
    @occupation = @membership.occupation
    @membership.update(status: 'accepted')
    @membership.user.occupation = @occupation
    @membership.user.save
    redirect_to occupation_occupation_memberships_path, notice: '申請を承認しました。'
  end
  
  
  def reject
    @membership = OccupationMembership.find(params[:id])
    @membership.rejected!
    redirect_to occupation_occupation_memberships_path, notice: '申請を拒否しました。'
  end
end
