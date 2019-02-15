class CreateApps < ActiveRecord::Migration[5.1]
  def change
    create_table :apps do |t|
      t.string :name, null: false
      t.string :appid, null: false
      t.string :author, null: false
      t.string :desc, null: false
      t.string :genre
      t.string :url
      t.binary :data, null: false

      t.timestamps
    end
  end
end
