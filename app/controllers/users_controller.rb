class UsersController < ApplicationController
 include SessionsHelper

before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
before_action :correct_user, only: [:edit, :update]
before_action :admin_user, only: :destroy
  def index
   # @users=User.all
    @users=User.paginate(page: params[:page])
  end
  def show
    @user=User.find(params[:id])
    @microposts=@user.microposts.paginate(page: params[:page])
  end
  def new
    @user=User.new
  end
  def edit
    @user=User.find(params[:id])
  end
  def create
    @user=User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success]="Welecome to the Sample app by xlgwr!"
      redirect_to @user
      # Handle a successful save.
    else
      render 'new'
    end
  end
  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update
      flash[:success]="Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  def destroy
              user=User.find(params[:id])
    if user.admin?
       flash[:error]="#{user.name},#{user.email} is administrator,can't destroyed."
    else
      flash[:success]="#{user.name},#{user.email} User destroyed."
      user.destroy
    end
    redirect_to users_url
  end
  private
   def user_params
     params.require(:user).permit(:name,:email,:password,:password_confirmation)
   end
   # before filters
   def correct_user
     @user=User.find(params[:id])
     redirect_to(root_path) unless current_user?(@user)
   end
   def admin_user
     redirect_to(root_path) unless current_user.admin?
   end
end
