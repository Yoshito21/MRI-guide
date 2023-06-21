class RemarksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_remark, only: [:edit, :update, :destroy]

    def new
        @imaging = Imaging.find(params[:imaging_id])
        @occupation = current_user.occupation
        @remark = Remark.new
    end
  
    def create
      @imaging = Imaging.find(params[:imaging_id])
      @occupation = current_user.occupation
      @remark = Remark.new(remark_params)
      if @remark.valid?
        @remark.save
        redirect_to imaging_path(id: @imaging.id, occupation_id: @occupation.id)
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @remark.valid?
        @remark.update(remark_params)
        redirect_to imaging_path(id: @imaging.id, occupation_id: @occupation.id)
      else
        render :edit
      end
    end
  
    def destroy
        @remark.destroy 
        redirect_to imaging_path(id: @imaging.id, occupation_id: @occupation.id)
    end
  
private
  def remark_params
    params.require(:remark).permit(:content).merge(imaging_id: @imaging.id, occupation_id: @occupation.id)
  end
  
  def set_remark
    @imaging = Imaging.find(params[:imaging_id])
    @occupation = current_user.occupation
    @remark = Remark.find_by(imaging_id: @imaging.id, occupation_id: current_user.occupation.id)
  end
end
