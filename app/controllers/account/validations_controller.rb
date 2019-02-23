class Account::ValidationsController < ApplicationController
  skip_before_action :validate_complete_user!
  before_action :redirect_to_valid_user, if: :current_user_valid?

  def edit; end

  def update
    if current_user.update(user_params)
      flash[:notice] = t('.success')
      sign_in_and_redirect current_user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:phone_number)
  end

  def redirect_to_valid_user
    sign_in_and_redirect current_user
  end

  def current_user_valid?
    current_user.valid?
  end
end