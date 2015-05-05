class PagesController < ApplicationController
	before_action :set_user, only: :profile
  def home
  	redirect_to pins_path if user_signed_in?
  end

   def about
   end

   def team
   end

   def profile
   	
   		@likes = @user.likes.ids.map do |x|
   			Pin.find(Like.find(x).pin_id)
   		end
   		@pins = @user.pins	
   end

   private

   def set_user
   		@user ||= User.find_by(id: params[:id]) 
   		if @user == nil 
   			redirect_to profile_path(current_user), status: 400 , notice: "User profile not found"
   		else 
   		   @user
   		end
   end

end