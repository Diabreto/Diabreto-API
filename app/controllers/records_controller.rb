class RecordsController < ApplicationController

  def create
    @record = current_user.records.new(create_params)
    if @record.save
      render status: :ok
    else
      @errors = @record.errors.full_messages
      render :error, status: :unprocessable_entity
    end

  end


  private

  def create_params
    params.permit(:date, :glycemia, :carbohydrates, :meal_insulin,
                  :correction_insulin, :activity, :notes)
  end
end
