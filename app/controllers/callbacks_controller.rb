class CallbacksController < Devise::OmniauthCallbacksController
  def facebook
    auth = request.env["omniauth.auth"]
    @user = User.where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.phone_number = auth.info.phone_number
      user.password = Devise.friendly_token[0,20]
      user.avatar = auth.info.image
      user.skip_phone_number_validation = true
    end

    if @user.save
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
