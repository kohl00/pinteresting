class Pins::LikesController < ApplicationController

	before_action :authenticate_user!
	before_action :set_pin

	def create
		if @pin.user != current_user
 			@pin.likes.where(user_id: current_user.id).first_or_create
 		end
	end

	def destroy
		
		@pin.likes.where(user_id: current_user.id).destroy_all
	end

	private
	
	def set_pin
		@pin = Pin.find(params[:pin_id])
	end

end