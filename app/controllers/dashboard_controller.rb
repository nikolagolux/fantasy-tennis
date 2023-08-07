class DashboardController < ApplicationController
  def index
  end

  def users
    @users = User.all
    @number_of_users = @users.count
  end
end
