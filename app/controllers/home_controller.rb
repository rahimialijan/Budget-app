class HomeController < ApplicationController
  def check_and_redirect
    if user_signed_in?
      redirect_to groups_path
    else
      render 'landing'
    end
  end
end
