class Users::RegistrationsController < Devise::RegistrationsController
  acts_as_token_authentication_handler_for User, fallback: :devise

  def create
    @user = User.new(user_params)
    if @user.save
      render status: :ok
    else
      @errors = @user.errors.full_messages
      render :error, status: :unprocessable_entity
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
