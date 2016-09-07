class ChangeDescriptionsToSingular < ActiveRecord::Migration
  def change
    rename_column :cats, :descriptions, :description
  end
end
