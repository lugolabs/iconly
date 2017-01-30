class CreateIconlyUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :iconly_users, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :image_url
      t.string :url
      t.string :uid

      t.timestamps
    end
  end
end
