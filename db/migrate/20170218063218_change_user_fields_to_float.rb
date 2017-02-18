class ChangeUserFieldsToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :glycemia_unit, :float, default: 0
    change_column :users, :carbohydrates_to_unit, :float, default: 1
    change_column :users, :glycemia_target, :float, default: 100
    change_column :users, :insulin_to_unit, :float, default: 1
    change_column :users, :correction_factor, :float, default: 1
    change_column :users, :hyperglycemia_threshold, :float, default: 120
    change_column :users, :hypoglycemia_threshold, :float, default: 80
  end
end
