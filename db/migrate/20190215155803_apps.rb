class Apps < ActiveRecord::Migration[5.1]
  def change
    add_index( :apps, :name )
    add_index( :apps, :appid )
  end
end
