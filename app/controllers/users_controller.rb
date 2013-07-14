class UsersController < ApplicationController

  def index
    @title = "Users"
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to users_path    
      flash[:notice] = "User was successfully created"
    else
      flash[:notice] = "User could not be created."
      render :new
    end
  end

  def new
    @title = "Add a User"
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
      flash[:notice] = "Congratulations - User updated ;)"
    else
      flash[:alert] = "Sorry I'm being an arse, user not updated."
      render :new
    end
  end

  def edit
    @title = "Edit a User"
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path
      flash[:notice] = "User is dead."
    else
      flash[:notice] = "User is zombie. Cannot kill what is already dead!"
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
