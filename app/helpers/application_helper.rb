module ApplicationHelper
	def error_tag(model, attribute)
		if model.errors.has_key? attribute
			content_tag(
				:div,
				model.errors[attribute].first,
				class: "alert alert-danger"
			)
		end
	end

	def belongs_to_user(post)
		user_signed_in? && post.user = current_user
	end
end
