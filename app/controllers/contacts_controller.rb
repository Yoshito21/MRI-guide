class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_id, only: [:index, :new, :create, :contact_notice]

  def index
    @contacts = Contact.all
    @show_completed = params[:show_completed].present?
  end

  def update_visibility
    contact_ids = params[:contact_ids] || []
    Contact.where(id: contact_ids).update_all(completed: true)

    show_completed = params[:show_completed].present?

    respond_to do |format|
      format.json { render json: { show_completed: show_completed } }
      format.html { redirect_to contacts_path }
    end
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      @contact.save
      redirect_to contact_thanks_path
    else
      render :new
    end
  end

  def thanks
  end

  private

def contact_params
  params.require(:contact).permit(:name, :email, :message).merge(user_id: current_user.id)
end

def set_contact
  @contact = Contact.find(params[:id])
end

  def set_user_id
    @user_id = current_user.id
  end
end
