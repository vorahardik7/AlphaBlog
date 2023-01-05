module ApplicationHelper

    def gravatar_file(user)
        email_address = user.email
        hash = Digest::MD5.hexdigest(email_address)
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=200"
        image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

end
