class UsersController < ApplicationController
  before_action :set_user, only: [:login, :destroy]
  

  # GET /users/login/:id
  def login
    render json: UserRepresenter.new(@user).as_json, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.password = params[:password]

    if @user.save
      render json: UserRepresenter.new(@user).as_json, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
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
