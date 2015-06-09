class ContactsController < ApplicationController

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(json: contact.errors.full_messages, status: :unprocessable_entity)
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render json: contact
  end

  def index
    id = params[:user_id]
    contacts = User.find(id).contacts

    # contact = User.
    render json: contacts
  end

  def show
    contact = Contact.find(params[:id])
    render json: contact
  end

  def update
    contact = Contact.find(params[:id])
    check = contact.update(contact_params)
    if check
      render json: contact
    else
      render(json: contact.errors.full_messages, status: :unprocessable_entity)
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
