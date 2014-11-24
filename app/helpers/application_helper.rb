module ApplicationHelper
	# Helper do lateral_users, set como ativo se o link for o seu current_page
	def is_active?(link_path)
		current_page?(link_path) ? "active" : ""
	end
end
