class CreateIconlyUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :iconly_users, id: :uuid do |t|
      t.string :image_url

      t.timestamps
    end
  end
end
