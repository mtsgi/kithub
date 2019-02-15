class CreateApps < ActiveRecord::Migration[5.1]
  def change
    create_table :apps do |t|
      t.string :name
      t.string :author
      t.string :desc
      t.string :genre
      t.string :url
      t.binary :data

      t.timestamps
    end
  end
end
