class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

 def twitter
    auth = env["omniauth.auth"]

    @user = User.find_for_twitter_oauth(request.env["omniauth.auth"],current_user)
    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', :kind => 'Twitter')
      sign_in_and_redirect @user
    else
      session["devise.twitter_uid"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
end

  protected

  def auth_hash
  	request.env['omniauth.auth']
  end
end