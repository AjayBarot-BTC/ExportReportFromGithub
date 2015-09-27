class CallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :redirect_to_login_if_required

  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    else
    	redirect_to root_path
    end
  end
end