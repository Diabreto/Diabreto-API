class UsersController < ApplicationController
  before_action :user_is_authorized

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(update_params)
      render status: :ok
    else
      @errors = @user.errors.full_messages
      render :error, status: :unprocessable_entity
    end
  end

  private

  def update_params
    params.permit(:glycemia_unit,
                  :carbohydrates_to_unit,
                  :target_glycemia,
                  :insulin_to_unit,
                  :correction_factor,
                  :hyperglycemia_threshold,
                  :hypoglycemia_threshold,
                  :full_name
                 )
  end

end
