class CreatePredictions < ActiveRecord::Migration[5.0]
  def change
    create_table :predictions do |t|
      t.datetime :date
      t.float :value

      t.timestamps
    end
  end
end
