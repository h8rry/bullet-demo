class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :asc)
    # @users = User.all.order(created_at: :desc).includes(:questions)

    render 'users/index', status: :ok
  end
end
