class CreateIconlyPackages < ActiveRecord::Migration[5.0]
  def change
    create_table :iconly_packages do |t|
      t.uuid :user_id, null: false, index: true, foreign_key: true
      t.string :name
      t.boolean :shared
      t.string :slug

      t.timestamps
    end
  end
end
