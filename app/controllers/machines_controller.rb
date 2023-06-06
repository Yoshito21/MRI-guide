class MachinesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_machine, only: [:show, :edit, :update, :destroy]
    before_action :set_occupation, only: [:new, :show, :edit]

    def new
        @machine = Machine.new
    end
    
    def create
        @occupation = current_user.occupation
        @machine = Machine.new(machine_params)
      
        if @machine.save
          @occupation.machines << @machine
          redirect_to @occupation
        else
          render :new
        end
      end

    def show
    end

    def edit
    end

    def update
        if @machine.update(machine_params)
            redirect_to occupation_machine_path(@machine, occupation_id: current_user.occupation.id)
        else
            render :new
        end
    end

    def destroy
        current_user.occupation.occupation_machines.where(machine_id: @machine.id).destroy_all
        @machine.destroy
        redirect_to occupation_path(occupation: current_user.occupation)
    end

    private

    def machine_params
        params.require(:machine).permit(:manufacturer_id, :strength_id, :name).merge(occupation_id: current_user.occupation.id)
    end

    def set_machine
        @machine = Machine.find(params[:id])
    end
    
    def set_occupation
        @occupation = Occupation.find(params[:occupation_id])
    end
end
