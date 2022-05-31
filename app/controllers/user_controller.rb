# frozen_string_literal: true

# controls authentication and user-related actions
class UserController < ApplicationController
  def spotify
    flash.clear
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.save
      redirect_to root_path, flash: { success: "Success! You've been logged-in!" }
    else
      redirect_to root_path, flash: { error: 'failure!' }
    end
  end

  def oauth_failure
    flash.clear
    redirect_to root_path, flash: { error: 'failure!' }
  end
end
