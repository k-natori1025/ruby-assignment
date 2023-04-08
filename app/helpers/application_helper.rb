module ApplicationHelper
    
    def current_user 
        @current_user = User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !currrent_user.nil?
    end
end
