class ChangeRecordDateToDatetime < ActiveRecord::Migration[5.0]
  def change
    change_column :date, :datetime
  end
end
