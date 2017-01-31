class CreateIconlyProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :iconly_projects, id: :uuid do |t|
      t.uuid :user_id, null: false, index: true, foreign_key: true
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
