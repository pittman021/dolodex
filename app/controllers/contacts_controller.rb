class ContactsController < ApplicationController

  before_action :authenticate_user!

  def index
    puts params[:group]
    @groups = current_user.groups
    if params[:group].blank?
      @contacts = current_user.contacts.includes(:group).all.order(:last_name)
    else
    @contacts = Contact.joins(:group).where('groups.title = ?', params[:group])
  end
    respond_to do |format|
      format.html
      format.json { render json: @contacts }
  end
  end

  def upload
    @contacts = current_user.contacts.all
  end

  def import
    current_user.contacts.import(params[:file])
    redirect_to contacts_path, notice: 'Data Imported!'
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
    @groups = Group.all
  	@contact = Contact.includes(:group).find(params[:id])
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
    params.require(:contact).permit(:id, :user_id, :group_id, :notes, :first_name, :last_name, :birthday_day, :birthday_month, :wedding_anniversary, :address, gifts_attributes: [:user_id, :id, :title, :image, :contact_id, :url, :_destroy])
  end

end
