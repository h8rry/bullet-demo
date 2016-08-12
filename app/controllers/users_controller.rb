class UsersController < ApplicationController
  def index
    # @users = User.all.order(created_at: :asc)
    # @users = User.all.order(created_at: :asc).includes(:questions)
    @users = User.find_by_sql('SELECT * FROM users')
    # ActiveRecord::Associations::Preloader.new.preload(@users, :questions)

    render 'users/index', status: :ok
  end
end
