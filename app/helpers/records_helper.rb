module RecordsHelper

  TIME_RANGES = [
    [0, 7],
    [7, 10],
    [10, 12],
    [12, 15],
    [15, 19],
    [19, 22],
    [22, 24]
  ].freeze

  def is_in_time_range(date, time_range)
    return (date.hour >= time_range.first and date.hour < time_range.second)
  end

  def get_time_range(time)
    for time_range in TIME_RANGES
      return time_range if is_in_time_range(time, time_range)
    end
  end

  def get_records_in_time_range(records, time_range)
    records.select do |record|
      is_in_time_range(Time.at(record[:timestamp]), time_range)
    end
  end

  def consistent_dates(records, time_range)
    if records.empty?
      return []
    end
    reversed_sorted_records = get_records_in_time_range(group_records(records), time_range).sort_by{
      |k| k[:timestamp]
    }.reverse
    if (DateTime.now - Time.at(reversed_sorted_records.first[:timestamp]).to_date).to_i > 1
      return []
    end
    consistent_dates = [reversed_sorted_records.first]
    reversed_sorted_records.each_cons(2) do |a, b|
      if Time.at(a[:timestamp]) - Time.at(b[:timestamp]) > 2.day
        break
      else
        consistent_dates << b
      end
    end
    return consistent_dates.reverse
  end

  def group_records(records)
    records.group_by(&:day_time_range_timestamp).to_a.map do |r|
      values = r.second.pluck(:glycemia)
      {
        timestamp: r.first,
        value: values.sum / values.size.to_f
      }
    end
  end

  extend self

end
