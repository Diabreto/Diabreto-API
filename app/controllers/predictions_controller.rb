class PredictionsController < ActionController::Base

  def callback
    print params
    predictions = params[:forecast]
    first = predictions.first
    date = Time.at(first[:timestamp])
    time_range = RecordsHelper.get_time_range(date)
    old_predictions = Prediction.where("extract(hour from date) >= ? and extract(hour from date) < ?", time_range.first, time_range.second)
    old_predictions.delete_all
    Prediction.create(date: date, value: first[:value])
  end
end
