class CreateIconlyIcons < ActiveRecord::Migration[5.0]
  def change
    create_table :iconly_icons, id: :uuid do |t|
      t.uuid :package_id, null: false, index: true, foreign_key: true
      t.string :name
      t.string :slug
      t.string :svg
      t.text :contents

      t.timestamps
    end
  end
end
