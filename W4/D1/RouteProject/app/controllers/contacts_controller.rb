class ContactsController < ApplicationController

  def index
    @contacts = Contact.find(params[:user_id])
    render json: @contacts
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @user
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    render json: @contact
  end

  def show
    @contacts = Contact.find(contact_params)
    render json: @user
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update(contact_params)
      render :json => @contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :user_id)
    end
end
