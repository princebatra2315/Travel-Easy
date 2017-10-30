class StaticPagesController < ApplicationController
  def help
  end

  def home
    @micropost = Micropost.new
  end

  def adminhome 
  	@ticket = current_user.tickets.build if logged_in?
  end
  
  def about
  end

   def contact
  end

end
