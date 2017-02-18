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

  def show
    @record = Record.find_by_id(params[:id])
    if @record
      if current_user.records.exists?(@record.id)
        render status: :ok
      else
        @errors = [t(:user_not_authorized)]
        render :error, status: :unauthorized
      end
    else
      @errors = [t(:record_not_found)]
      render :error, status: :unprocessable_entity
    end
  end

  def index
    @records = current_user.records
  end

  private

  def create_params
    params.permit(:date, :glycemia, :carbohydrates, :meal_insulin,
                  :correction_insulin, :activity, :notes)
  end
end
