class UsersController < ApplicationController
  def profile
    @user = current_user
    @rents = @user.rents_as_owner
  end
end
