class Record < ApplicationRecord
  belongs_to :user

  def day_time_range_timestamp
    return (DateTime.parse(date.to_date.to_s) +
            RecordsHelper.get_time_range(date).first.hours).to_time.to_i
  end
end
