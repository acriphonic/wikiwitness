module AdminHelper
	private
		def correct_user
		  @user = User.find(params[:id])
		  redirect_to(root_path) unless current_user?(@user) || admin_user?(current_user)
		end

		def admin_user
		  redirect_to(root_path) unless (admin_user?(current_user))
		end

		def admin_user?(user)
			signed_in? && (user.account == "admin")
		end

		def split_str(str, len = 10)
  			fragment = /.{#{len}}/
  			str.split(/(\s+)/).map! { |word|
    			(/\s/ === word) ? word : word.gsub(fragment, '\0<wbr />')
  			}.join
		end

		def wrap_long_string(text, max_width = 20)
  			(text.length < max_width) ?
    			text :
    			text.scan(/.{1,#{max_width}}/).join("<wbr>")
		end
end