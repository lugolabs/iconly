class AddIconCountToPackages < ActiveRecord::Migration[5.0]
  def change
    add_column :iconly_packages, :icon_count, :integer, default: 0
  end
end
