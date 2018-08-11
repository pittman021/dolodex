class ContactsController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    @contacts = current_user.contacts.all

    @birthdays_this_month = Contact.where("EXTRACT(MONTH FROM date_of_birth) = ?", (Date.today.month))
    @birthdays_next_month = Contact.where("EXTRACT(MONTH FROM date_of_birth) = ?", (Date.today + 1.month).month)
  end

  def create
    @contact = current_user.contacts.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_path, notice: "Your contact has been added. You're so neat!" }
        format.json { render :json => @contact.to_json, status: :created, location: @contact }
      else
        format.html { render :new, notice: "Uh oh, something went wrong" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @contact = Contact.new
  end

  def edit
  	@contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
  	if @contact.update(contact_params)
  		format.html { redirect_to contacts_path, notice: 'Contact was successfully updated.' }
      format.json { render :json => @contact.to_json, status: :ok, location: @contact }
  	else
      format.html { render :edit, notice: "Uh oh, something went wrong" }
      format.json { render json: @contact.errors, status: :unprocessable_entity }
  	end
  end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path
  end

  def show
    @contact = Contact.includes(:gifts).find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:id, :user_id, :first_name, :last_name, :date_of_birth, :wedding_anniversary, :address, gifts_attributes: [:id, :title, :image, :contact_id, :url, :_destroy])
  end

end