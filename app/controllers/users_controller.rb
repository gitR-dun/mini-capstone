class UsersController < ApplicationController
  def create
    # make a new user
    user = User.new(
      name: params['name'],
      email: params['email'],
      password: params['password'],
      password_confirmation: params['password_confirmation']
    )

    if user.save
      render json: {message: "you created the user"}
    else
      render json: {errors: user.errors.full_messages}
    end
  end
end
