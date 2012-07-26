module AdminHelper
	private
		def correct_user
		  @user = User.find(params[:id])
		  redirect_to(root_path) unless current_user?(@user) || admin_user?(@user)
		end

		def admin_user
		  redirect_to(root_path) unless (admin_user?(current_user))
		end

		def admin_user?(user)
			signed_in? && (user.account == "admin")
		end
end