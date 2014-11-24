class SystemController < ApplicationController
	before_action :set_event, only: [:index, :mercados]

	def index
		
	end

	def markets
		@markets = Market.where(user_id: current_user)
	end


	private

	def set_event
		if current_user.nil?
			redirect_to root_path
		end
	end

end
