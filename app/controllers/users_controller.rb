class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new()
  end

  def create
    new_user = params.require(:user).permit(:name, :email, :password, :password_confirmation)
    @user=User.new(new_user)
    if @user.save
      
      sign_in @user
      redirect_to @user
    else
      render'new'
    end
  end

  def index
    @users = User.all
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    render :show
  end


  def destroy
    user = User.find(params[:id])
    intention = Intention.find_by_name(user.intentions)
    intention.destroy

  end





end

