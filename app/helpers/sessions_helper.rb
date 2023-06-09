module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end 
    def remember(user)
        user.remember
        cookies.permanent.encrypted[:user_id] = user.id
        cookies.encrypted[:remember_token] = user.remember_token
    end 
    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.encrypted[:user_id])
            user = User.find_by(id: user_id)
        if user && user.authenticated?(:remember, cookies[:remember_token])
            log_in user
            @current_user = user 
        end 
    end
    end 
    def forget(user)
        user.forget
        cookies.delete(:remember_token)
        cookies.delete(:user_id)
    end 
    def logged_in?
        !current_user.nil?
        end
    def log_out
        forget(current_user)
        session.delete(:user_id)
        current_user = nil 
    end 
    def current_user?(user)
        user && user == current_user
    end 
    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end
end
def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
    end
    def store_location
    session[:forwarding_url] = request.original_url if request.get?
    end
