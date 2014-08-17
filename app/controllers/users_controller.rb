class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.paginate(page: params[:page], per_page: 5)
  end

  def gallery
    redirect_to(root_url) unless signed_in?
  end

  # GET /users/new
  def new
    if signed_in?
      redirect_to root_path
    end
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound 
    redirect_to root_path, notice: "This profile does not exist."
  end

  # POST /users
  # POST /users.json
  def create
    if signed_in?
      redirect_to root_path
    end
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to the KCRuby!"
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    if all_of_the_user_fields_could_be_updated
      flash[:success] = "Edit Successful."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def all_of_the_user_fields_could_be_updated
    @user.update_attribute(:name,  params[:user][:name])  &&
    @user.update_attribute(:email, params[:user][:email]) &&
    @user.update_attribute(:bio,   params[:user][:bio])
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :bio, :password, :password_confirmation, :github, :ghusername)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
