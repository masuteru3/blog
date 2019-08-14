class SessionsController < ApplicationController
  def destroy
    session["warden.user.user.key"] = nil
    redirect_to root_path
  end
end
