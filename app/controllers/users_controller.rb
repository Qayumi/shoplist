class UsersController < ApplicationController

  def index
    @users = User.all
  end


    def show
     @users= User.find(params[:id])
    end


  def new
    @users = User.new
  end

  def create
    @users = User.new(allowed_params)
    if @users.save
      redirect_to users_path
    else
      redender 'new'
    end
  end


  def edit
    @users= User.find(params[:id])
  end

  def update
    @users= User.find(params[:id])
    if @users.update(allowed_params)
      redirect_to users_path
    else
      redender 'new'
    end
  end

  def destroy
     @users= User.find(params[:id])
     @users.destroy
     redirect_to users_path
  end

private
   def allowed_params
     params.require(:user).permit(:name, :age, :bio)
   end

end
