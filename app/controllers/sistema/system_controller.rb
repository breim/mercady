class Sistema::SystemController < Sistema::SistemaController
	before_action :set_event, only: [:index, :mercados]

	def index	
	end


	private

	def set_event
		if current_user.nil?
			redirect_to root_path
		end
	end

end
