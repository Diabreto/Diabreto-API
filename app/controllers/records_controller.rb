class RecordsController < ApplicationController
  CALLBACK = "www.pedrobelem.com/unplugg_callback"

  def create
    @record = current_user.records.new(create_params)
    if @record.save
      time_range = RecordsHelper.get_time_range(@record.date)
      update_predictions(time_range)
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
    @records = current_user.records.order(:date)
    current_time_range = RecordsHelper.get_time_range(DateTime.now)
    predictions = Prediction.where("extract(hour from date) >= ? and extract(hour from date) < ?", current_time_range.first, current_time_range.second)
    if predictions.empty?
      @prediction = -1
    else
      if predictions.first.date.beginning_of_day == DateTime.now.beginning_of_day
        @prediction = predictions.first.value
      else
        @prediction = -1
      end
    end
  end

  private

  def update_predictions(time_range)
    records = RecordsHelper.consistent_dates(current_user.records, time_range)
    byebug
    if records.size > 3
      if Time.at(records.second[:timestamp]) - Time.at(records.first[:timestamp]) > 1.day
        obj = {
          timestamp: Time.at(records.first[:timestamp]) - 1.day,
          value: record.first[:value]
        }
        records.insert(0, obj)
      end

      request = {
        data: records,
        callback: CALLBACK
      }
      response = HTTParty.post("https://api.unplu.gg/forecast",
                               body: request.to_json,
                               headers: {
                                 "Content-Type" => "application/json",
                                 "x-access-token" => Rails.application.secrets.unplugg_api_base
                               })
      byebug
    end

  end

  def create_params
    params.permit(:date, :glycemia, :carbohydrates, :meal_insulin,
                  :correction_insulin, :activity, :notes)
  end

  def build_data
    request = current_user.records.order(:date).map do |rec|
      {
        timestamp: rec.date.to_time.to_i,
        value: rec.glycemia
      }
    end
  end

end
