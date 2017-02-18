class AddDefaultToGlycemiaUnit < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :glycemia_unit, "mg/dL"
  end
end
