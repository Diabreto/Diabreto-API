class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.date :date
      t.float :glycemia
      t.float :carbohydrates
      t.float :meal_insulin
      t.float :correction_insulin
      t.float :activity
      t.text :notes

      t.timestamps
    end
  end
end
