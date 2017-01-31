class CreateIconlyProjectIcons < ActiveRecord::Migration[5.0]
  def change
    create_table :iconly_project_icons, id: :uuid do |t|
      t.uuid :project_id, null: false, index: true, foreign_key: true
      t.uuid :icon_id, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
