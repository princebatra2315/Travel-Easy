
class UsersController < ApplicationController
  
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only:[:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
  def index
  	@users=User.all
  end

def new
    @user=User.new
  end

   def show
      @user = User.find(params[:id])
       @microposts = @user.microposts.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    @message = "welcome to Travel easy by Prince."
    if @user.save
       # SampleMailer.sample_mail(@user).deliver # calls sample_mail.
       # calls https request to send message to given number
    RestClient.get 'http://api.textlocal.in/send/?username=princebatra2315@gmail.com&hash=353493ee903af42572bc057ac1c2d494f3e6bd13cbaf11b606cbc2b5c5596e62&sender=TXTLCL&numbers=91'+@user.phone+'&message='+@message
    log_in @user
    flash[:success] = "Welcome to the Sample App!"
          redirect_to @user
      #UserMailer.account_activation(@user).deliver_now
      #flash[:info] = "Please check your email to activate your account."
      #redirect_to root_url
    else
      render 'new'
    end
  end

   def edit
    @user = User.find(params[:id])
  end

def update
  @user=User.find(params[:id])
  if @user.update_attributes(user_params)
 flash[:success]="profile updated"
 redirect_to @user
  else
    render 'edit'
  end
end

def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


 
def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end



private

def user_params
      params.require(:user).permit(:name, :email, :phone, :password,
                                   :password_confirmation)
    end



def correct_user
  @user=User.find(params[:id])
  unless @user == current_user
    flash[:danger] ="Don't Try to access other info"
      redirect_to(root_url)
    end
end

 def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
end
