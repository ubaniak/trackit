module UserHelper
    def admin_only
        if user_signed_in?
            deny_access("You do not have permission to view this page") unless current_user.is_admin?
        end
    end

    def deny_access(notice)
        redirect_to root_path, :notice => notice
    end
end
