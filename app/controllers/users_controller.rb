class UsersController < ApplicationController
  before_action :set_user, only: [ :destroy ]
  

  # GET /users/login
  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      render json: UserRepresenter.new(@user).as_json, status: :created
    else
      render json: { errors: 'Incorrect Password'}, status: :unprocessable_entity
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.password = params[:password]

    if @user.save
      render json: UserRepresenter.new(@user).as_json, status: :created
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password_hash, :username)
    end
end
