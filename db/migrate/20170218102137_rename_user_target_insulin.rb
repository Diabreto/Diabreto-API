class RenameUserTargetInsulin < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :glycemia_target, :target_glycemia
  end
end
