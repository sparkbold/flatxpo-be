class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @user = User.new(user_params)
    unless @user.img.attached?
      @user.img.attach(io: File.open('app/assets/images/avatar.png'), filename: 'avatar.png', content_type: 'image/png')
    end 
    @user.avatar = rails_blob_url(@user.img) if @user.avatar

    if @user.save
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token}, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :phone_number, :bio, :avatar, :github_username)
  end


end
