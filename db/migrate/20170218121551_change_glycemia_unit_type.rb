class ChangeGlycemiaUnitType < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :glycemia_unit, :string
  end
end
