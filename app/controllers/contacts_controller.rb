class ContactsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(
      # Use hash to sanitize parameters...
      name: params[:contact][:name],
      email: params[:contact][:email],
      message: params[:contact][:message]
      )
    if @contact.save
      ContactMailer.send_message(@contact)
      flash[:notice] = "Your message has been sent. Thanks for getting in touch."
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @contacts = Contact.order(created_at: :desc)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
